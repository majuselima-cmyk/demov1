# Flow Diagram - Cuan Platform

## User Flow

### 1. Landing Page Flow

```
Visitor
  |
  v
Landing Page
  |
  +---> Register Button
  |       |
  |       v
  |     Register Page
  |       |
  |       v
  |     Fill Form (Email, Password, Referral Code)
  |       |
  |       v
  |     Submit
  |       |
  |       v
  |     Email Verification (OTP - Coming Soon)
  |       |
  |       v
  |     Login Page
  |
  +---> Login Button
          |
          v
        Login Page
          |
          v
        Fill Credentials
          |
          v
        Submit
          |
          v
        Dashboard Member
```

### 2. Registration Flow

```
Start
  |
  v
Register Page
  |
  v
Input Data:
  - Email
  - Password
  - Confirm Password
  - Referral Code (Optional)
  |
  v
Validate Input
  |
  +---> Invalid
  |       |
  |       v
  |     Show Error
  |       |
  |       v
  |     Back to Register
  |
  +---> Valid
          |
          v
        Create Account (Supabase Auth)
          |
          v
        Create User Profile in Database
          |
          v
        Link Referral (if referral code exists)
          |
          v
        Send Verification Email
          |
          v
        Redirect to Login
```

### 3. Login Flow

```
Start
  |
  v
Login Page
  |
  v
Input Credentials:
  - Email
  - Password
  |
  v
Validate
  |
  +---> Invalid
  |       |
  |       v
  |     Show Error
  |       |
  |       v
  |     Back to Login
  |
  +---> Valid
          |
          v
        Check User Role
          |
          +---> Admin
          |       |
          |       v
          |     Dashboard Admin
          |
          +---> Member
                  |
                  v
                Dashboard Member
```

### 4. Deposit Flow

```
Dashboard Member
  |
  v
Deposit Section
  |
  v
Input Amount (Minimum $10)
  |
  v
Select Payment Method (USDT)
  |
  v
Generate Payment Address/QR
  |
  v
Wait for Payment Confirmation
  |
  v
Verify Payment (Webhook/Manual)
  |
  v
Process Deposit:
  1. Add $10 to user balance
  2. Start Staking (0.5% per hari dari $10)
  3. Allocate 90% as Coins
  4. Allocate 10% as Tokens
  5. Check Referral Chain
     |
     v
   If has upline:
     - Transfer 10% tokens to upline
     - Mark tokens as withdrawable for upline
  |
  v
Update Dashboard
```

### 5. Staking Flow

```
Deposit Confirmed
  |
  v
Start Staking Process
  |
  v
Calculate Daily Reward:
  - Base Amount: $10
  - Daily Rate: 0.5%
  - Daily Reward: $0.05
  |
  v
Cron Job (Daily):
  |
  v
For each active staking:
  |
  v
Calculate Reward
  |
  v
Allocate:
  - 90% to Coins
  - 10% to Tokens
  |
  v
Update User Balance
  |
  v
Check Referral Chain
  |
  v
If referral deposited:
  - Transfer 10% tokens to upline
  - Make tokens withdrawable
```

### 6. Referral Flow

```
User A (Referrer)
  |
  v
Share Referral Code
  |
  v
User B (Referee)
  |
  v
Register with User A's Referral Code
  |
  v
Link Created:
  - User B.upline = User A.id
  |
  v
User B Deposits $10
  |
  v
Process:
  1. User B gets:
     - 90% Coins
     - 10% Tokens (locked)
  2. User A gets:
     - 10% Tokens from User B's deposit
     - Tokens become withdrawable
  3. User B's tokens become transferable
     to their own referrals
```

### 7. Token Transfer Flow

```
Dashboard Member
  |
  v
Token Section
  |
  v
View Available Tokens
  |
  v
Select Transfer Action
  |
  v
Input:
  - Recipient (Referral below)
  - Amount
  |
  v
Validate:
  - Recipient is in referral chain
  - Recipient has deposited
  - Sufficient balance
  |
  v
Transfer Tokens
  |
  v
Update Balances
```

### 8. Admin Flow

```
Admin Login
  |
  v
Dashboard Admin
  |
  +---> User Management
  |       |
  |       v
  |     View All Users
  |     Edit User
  |     Suspend User
  |
  +---> Deposit Management
  |       |
  |       v
  |     View Pending Deposits
  |     Approve Deposits
  |     Reject Deposits
  |
  +---> Staking Management
  |       |
  |       v
  |     View All Staking
  |     Manual Staking Adjustment
  |
  +---> Token Management
  |       |
  |       v
  |     View Token Distribution
  |     Manual Token Adjustment
  |
  +---> Reports
          |
          v
        View Statistics
        Export Data
```

## Database Flow

### User Registration

```
Supabase Auth
  |
  v
Create Auth User
  |
  v
profiles table:
  - id (uuid, references auth.users)
  - email
  - referral_code (unique)
  - upline_id (references profiles.id)
  - role (member/admin)
  - created_at
```

### Deposit Processing

```
deposits table:
  - id
  - user_id
  - amount
  - currency (USDT)
  - status (pending/confirmed/failed)
  - transaction_hash
  - created_at
  |
  v
Update user balance
  |
  v
Create staking record:
  staking table:
    - id
    - user_id
    - amount
    - daily_rate (0.5%)
    - status (active/completed)
    - started_at
    - last_reward_at
```

### Reward Distribution

```
Daily Cron Job
  |
  v
For each active staking:
  |
  v
Calculate reward
  |
  v
Update balances:
  user_balances table:
    - user_id
    - coins_balance
    - tokens_balance
    - withdrawable_tokens
```

### Referral Chain

```
referral_chain table:
  - id
  - referrer_id
  - referee_id
  - level
  - created_at
  |
  v
When deposit confirmed:
  |
  v
Transfer tokens to upline
  |
  v
Update withdrawable_tokens
```


