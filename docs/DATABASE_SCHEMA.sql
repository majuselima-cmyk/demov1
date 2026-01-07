-- Cuan Platform Database Schema
-- Supabase PostgreSQL

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Profiles table
CREATE TABLE profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL,
    referral_code TEXT UNIQUE NOT NULL,
    upline_id UUID REFERENCES profiles(id) ON DELETE SET NULL,
    role TEXT NOT NULL DEFAULT 'member' CHECK (role IN ('member', 'admin')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Deposits table
CREATE TABLE deposits (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount >= 10),
    currency TEXT NOT NULL DEFAULT 'USDT',
    status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'failed')),
    transaction_hash TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    confirmed_at TIMESTAMP WITH TIME ZONE
);

-- Staking table
CREATE TABLE staking (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    amount DECIMAL(18, 2) NOT NULL,
    daily_rate DECIMAL(5, 4) NOT NULL DEFAULT 0.005,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'completed', 'paused')),
    started_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    last_reward_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- User balances table
CREATE TABLE user_balances (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
    coins_balance DECIMAL(18, 2) NOT NULL DEFAULT 0,
    tokens_balance DECIMAL(18, 2) NOT NULL DEFAULT 0,
    withdrawable_tokens DECIMAL(18, 2) NOT NULL DEFAULT 0,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Referral chain table
CREATE TABLE referral_chain (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    referrer_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    referee_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    level INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(referrer_id, referee_id)
);

-- Token transfers table
CREATE TABLE token_transfers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    from_user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    to_user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    amount DECIMAL(18, 2) NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'completed', 'failed')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    completed_at TIMESTAMP WITH TIME ZONE
);

-- Indexes for performance
CREATE INDEX idx_profiles_referral_code ON profiles(referral_code);
CREATE INDEX idx_profiles_upline_id ON profiles(upline_id);
CREATE INDEX idx_deposits_user_id ON deposits(user_id);
CREATE INDEX idx_deposits_status ON deposits(status);
CREATE INDEX idx_staking_user_id ON staking(user_id);
CREATE INDEX idx_staking_status ON staking(status);
CREATE INDEX idx_user_balances_user_id ON user_balances(user_id);
CREATE INDEX idx_referral_chain_referrer ON referral_chain(referrer_id);
CREATE INDEX idx_referral_chain_referee ON referral_chain(referee_id);
CREATE INDEX idx_token_transfers_from ON token_transfers(from_user_id);
CREATE INDEX idx_token_transfers_to ON token_transfers(to_user_id);

-- Function to generate referral code
CREATE OR REPLACE FUNCTION generate_referral_code()
RETURNS TEXT AS $$
DECLARE
    code TEXT;
    exists_check BOOLEAN;
BEGIN
    LOOP
        code := UPPER(SUBSTRING(MD5(RANDOM()::TEXT || NOW()::TEXT) FROM 1 FOR 8));
        SELECT EXISTS(SELECT 1 FROM profiles WHERE referral_code = code) INTO exists_check;
        EXIT WHEN NOT exists_check;
    END LOOP;
    RETURN code;
END;
$$ LANGUAGE plpgsql;

-- Function to create profile on user signup
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO profiles (id, email, referral_code)
    VALUES (
        NEW.id,
        NEW.email,
        generate_referral_code()
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to create profile on user signup
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers for updated_at
CREATE TRIGGER update_profiles_updated_at
    BEFORE UPDATE ON profiles
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_user_balances_updated_at
    BEFORE UPDATE ON user_balances
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Function to process deposit and start staking
CREATE OR REPLACE FUNCTION process_deposit(deposit_id UUID)
RETURNS VOID AS $$
DECLARE
    deposit_record deposits%ROWTYPE;
    user_profile profiles%ROWTYPE;
    upline_profile profiles%ROWTYPE;
    coins_amount DECIMAL(18, 2);
    tokens_amount DECIMAL(18, 2);
    upline_tokens DECIMAL(18, 2);
BEGIN
    -- Get deposit record
    SELECT * INTO deposit_record FROM deposits WHERE id = deposit_id AND status = 'confirmed';
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Deposit not found or not confirmed';
    END IF;
    
    -- Get user profile
    SELECT * INTO user_profile FROM profiles WHERE id = deposit_record.user_id;
    
    -- Calculate allocations (90% coins, 10% tokens)
    coins_amount := deposit_record.amount * 0.9;
    tokens_amount := deposit_record.amount * 0.1;
    
    -- Start staking
    INSERT INTO staking (user_id, amount, status)
    VALUES (deposit_record.user_id, deposit_record.amount, 'active');
    
    -- Update or create user balance
    INSERT INTO user_balances (user_id, coins_balance, tokens_balance)
    VALUES (deposit_record.user_id, coins_amount, tokens_amount)
    ON CONFLICT (user_id) 
    DO UPDATE SET
        coins_balance = user_balances.coins_balance + coins_amount,
        tokens_balance = user_balances.tokens_balance + tokens_amount;
    
    -- Check if user has upline
    IF user_profile.upline_id IS NOT NULL THEN
        -- Get upline profile
        SELECT * INTO upline_profile FROM profiles WHERE id = user_profile.upline_id;
        
        -- Calculate upline tokens (10% of deposit)
        upline_tokens := deposit_record.amount * 0.1;
        
        -- Update upline balance (withdrawable tokens)
        UPDATE user_balances
        SET withdrawable_tokens = withdrawable_tokens + upline_tokens
        WHERE user_id = upline_profile.id;
        
        -- Create referral chain entry if not exists
        INSERT INTO referral_chain (referrer_id, referee_id, level)
        VALUES (upline_profile.id, user_profile.id, 1)
        ON CONFLICT (referrer_id, referee_id) DO NOTHING;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Row Level Security Policies

-- Enable RLS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE deposits ENABLE ROW LEVEL SECURITY;
ALTER TABLE staking ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_balances ENABLE ROW LEVEL SECURITY;
ALTER TABLE referral_chain ENABLE ROW LEVEL SECURITY;
ALTER TABLE token_transfers ENABLE ROW LEVEL SECURITY;

-- Profiles policies
CREATE POLICY "Users can view own profile"
    ON profiles FOR SELECT
    USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
    ON profiles FOR UPDATE
    USING (auth.uid() = id);

CREATE POLICY "Admins can view all profiles"
    ON profiles FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

-- Deposits policies
CREATE POLICY "Users can view own deposits"
    ON deposits FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can create own deposits"
    ON deposits FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Admins can view all deposits"
    ON deposits FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

CREATE POLICY "Admins can update deposits"
    ON deposits FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

-- Staking policies
CREATE POLICY "Users can view own staking"
    ON staking FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all staking"
    ON staking FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

-- User balances policies
CREATE POLICY "Users can view own balance"
    ON user_balances FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all balances"
    ON user_balances FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

-- Referral chain policies
CREATE POLICY "Users can view own referrals"
    ON referral_chain FOR SELECT
    USING (auth.uid() = referrer_id OR auth.uid() = referee_id);

CREATE POLICY "Admins can view all referrals"
    ON referral_chain FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

-- Token transfers policies
CREATE POLICY "Users can view own transfers"
    ON token_transfers FOR SELECT
    USING (auth.uid() = from_user_id OR auth.uid() = to_user_id);

CREATE POLICY "Users can create transfers"
    ON token_transfers FOR INSERT
    WITH CHECK (auth.uid() = from_user_id);

CREATE POLICY "Admins can view all transfers"
    ON token_transfers FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );


