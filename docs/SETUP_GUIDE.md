# Setup Guide - Cuan Platform

## Prerequisites

- Node.js 18+ dan npm
- Akun Supabase
- Git

## Step 1: Clone & Install

```bash
# Clone repository (jika dari git)
git clone <repository-url>
cd cuan

# Install dependencies
npm install
```

## Step 2: Setup Supabase

### 2.1 Buat Project di Supabase

1. Login ke [Supabase](https://supabase.com)
2. Create new project
3. Catat `Project URL` dan `anon public key`

### 2.2 Setup Database Schema

1. Buka Supabase Dashboard
2. Pilih SQL Editor
3. Copy isi file `docs/DATABASE_SCHEMA.sql`
4. Paste dan run di SQL Editor
5. Verify tables sudah dibuat:
   - profiles
   - deposits
   - staking
   - user_balances
   - referral_chain
   - token_transfers

### 2.3 Setup Authentication

1. Di Supabase Dashboard, pilih Authentication
2. Enable Email provider
3. Configure email templates (optional)
4. Setup redirect URLs:
   - `http://localhost:3000/auth/callback` (development)
   - `https://yourdomain.com/auth/callback` (production)

## Step 3: Environment Variables

1. Copy `.env.example` ke `.env`:
```bash
cp .env.example .env
```

2. Edit `.env` dan isi dengan credentials Supabase:
```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key-here
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key-here
```

**Catatan**: 
- `SUPABASE_URL` dan `SUPABASE_ANON_KEY` bisa ditemukan di Project Settings > API
- `SUPABASE_SERVICE_ROLE_KEY` hanya untuk server-side operations

## Step 4: Development

### 4.1 Run Development Server

```bash
npm run dev
```

Server akan berjalan di `http://localhost:3000`

### 4.2 Test Setup

1. Buka `http://localhost:3000`
2. Coba register user baru
3. Check di Supabase Dashboard > Authentication > Users
4. Check di Supabase Dashboard > Table Editor > profiles

## Step 5: Create Admin User

### Via Supabase Dashboard

1. Buka Supabase Dashboard > Authentication > Users
2. Create user baru atau gunakan user yang sudah ada
3. Buka Supabase Dashboard > Table Editor > profiles
4. Edit profile user tersebut
5. Set `role` menjadi `'admin'`

### Via SQL (Alternative)

```sql
-- Ganti 'user-email@example.com' dengan email admin
UPDATE profiles 
SET role = 'admin' 
WHERE email = 'user-email@example.com';
```

## Step 6: Deployment

### Option 1: Vercel

1. Install Vercel CLI:
```bash
npm i -g vercel
```

2. Deploy:
```bash
vercel
```

3. Setup environment variables di Vercel Dashboard:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
   - `SUPABASE_SERVICE_ROLE_KEY`

4. Update Supabase redirect URLs:
   - Add `https://your-project.vercel.app/auth/callback`

### Option 2: Cloudflare Pages

1. Install Wrangler CLI:
```bash
npm i -g wrangler
```

2. Login:
```bash
wrangler login
```

3. Deploy via Cloudflare Dashboard:
   - Connect GitHub repository
   - Build command: `npm run build`
   - Output directory: `.output`
   - Add environment variables

4. Update Supabase redirect URLs:
   - Add `https://your-project.pages.dev/auth/callback`

## Step 7: Setup Cron Job (Daily Staking Rewards)

### Option 1: Supabase Edge Functions

1. Create Edge Function untuk calculate rewards
2. Setup cron job via Supabase Dashboard atau external service

### Option 2: External Cron Service

1. Gunakan service seperti:
   - GitHub Actions (scheduled workflows)
   - Vercel Cron Jobs
   - Cloudflare Workers (scheduled events)
   - External cron service (cron-job.org, etc.)

2. Endpoint yang perlu dipanggil:
   - `POST /api/staking/calculate-rewards`

## Step 8: USDT Payment Integration

### Setup Payment Gateway

1. Pilih provider USDT payment:
   - Tron network
   - ERC-20 (Ethereum)
   - Payment gateway service

2. Setup webhook untuk payment confirmation:
   - Endpoint: `POST /api/deposits/webhook`
   - Verify transaction
   - Update deposit status

3. Generate payment addresses untuk users

## Troubleshooting

### Error: Cannot connect to Supabase

- Check `SUPABASE_URL` dan `SUPABASE_ANON_KEY` di `.env`
- Verify Supabase project masih active
- Check network connection

### Error: RLS Policy Denied

- Verify Row Level Security policies sudah dibuat
- Check user authentication status
- Verify user role di profiles table

### Error: Referral code already exists

- Function `generate_referral_code()` akan auto-generate unique code
- Jika masih error, check constraint di database

### Staking rewards tidak ter-update

- Verify cron job berjalan
- Check function `calculate_daily_rewards()` di database
- Check logs untuk errors

## Next Steps

1. Implement landing page
2. Build authentication pages (login/register)
3. Create member dashboard
4. Create admin dashboard
5. Integrate USDT payment
6. Setup cron job untuk staking rewards
7. Test semua flow

## Support

Untuk pertanyaan atau issues:
- Check dokumentasi di folder `docs/`
- Review `docs/FLOW.md` untuk flow diagram
- Review `docs/ARCHITECTURE.md` untuk arsitektur


