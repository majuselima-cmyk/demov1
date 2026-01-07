# Project Summary - Cuan Platform

## Overview

Cuan Platform adalah platform staking berbasis blockchain dengan sistem referral dan token reward. Platform ini dibangun menggunakan Nuxt.js 3 dan Supabase, dengan deployment ke Vercel atau Cloudflare Pages.

## Fitur Utama

### 1. Landing Page
- Halaman utama untuk informasi platform
- Call-to-action untuk registrasi dan login
- Informasi tentang sistem staking dan referral

### 2. Dashboard Member
- Overview balance (Coins, Tokens, Withdrawable Tokens)
- Deposit interface (minimum $10 USDT)
- Staking information dan history
- Referral management (referral code, referral chain)
- Token transfer ke referral di bawahnya

### 3. Dashboard Admin
- User management
- Deposit approval system
- Staking management
- Token distribution monitoring
- Reports dan analytics

## Konsep Bisnis

### Deposit Minimum $10 USDT

Dari setiap deposit $10:
1. **Staking**: 0.5% per hari dari $10 (daily reward = $0.05)
2. **Coin Allocation**: 90% dari deposit menjadi Coins (coin buatan platform)
3. **Token Allocation**: 10% dari deposit menjadi Tokens
4. **Referral Token**: 10% tokens dapat dicairkan ketika ada referral di bawahnya yang sudah deposit
5. **Token Transfer**: Token dapat ditransfer ke referral di bawahnya jika sudah deposit

### Contoh Perhitungan

**User A deposit $10:**
- Coins: $9 (90%)
- Tokens: $1 (10%, locked sampai ada referral deposit)

**User B (referral User A) deposit $10:**
- User B mendapat:
  - Coins: $9 (90%)
  - Tokens: $1 (10%, bisa ditransfer ke referral mereka)
- User A mendapat:
  - Tokens: $1 (10% dari deposit User B, sekarang withdrawable)

**Daily Staking Reward (0.5% per hari):**
- Dari $10 deposit: $0.05 per hari
- 90% ke Coins: $0.045
- 10% ke Tokens: $0.005

## Tech Stack

- **Frontend**: Nuxt.js 3, Tailwind CSS, TypeScript
- **Backend**: Supabase (PostgreSQL, Auth, RLS)
- **Deployment**: Vercel / Cloudflare Pages
- **Payment**: USDT (TBD: Tron/ERC-20)

## Database Tables

1. **profiles** - User profiles dengan referral code
2. **deposits** - Deposit transactions
3. **staking** - Staking records dan status
4. **user_balances** - Coins, Tokens, dan Withdrawable Tokens
5. **referral_chain** - Referral relationships
6. **token_transfers** - Token transfer history

## Security

- Supabase Authentication (Email/Password)
- Row Level Security (RLS) untuk data protection
- Role-based access control (Member/Admin)
- HTTPS only
- Environment variables untuk secrets

## Development Roadmap

### Phase 1: Core Features (Current)
- [x] Project setup dan dokumentasi
- [ ] Landing page
- [ ] Authentication (Register/Login)
- [ ] Member dashboard
- [ ] Admin dashboard
- [ ] Deposit system
- [ ] Staking system
- [ ] Referral system

### Phase 2: Enhanced Features
- [ ] OTP verification
- [ ] Email notifications
- [ ] Real-time balance updates
- [ ] Advanced analytics
- [ ] Payment gateway integration

### Phase 3: Future Enhancements
- [ ] Mobile app
- [ ] Advanced referral tiers
- [ ] Token marketplace
- [ ] Withdrawal system

## File Structure

```
cuan-platform/
├── assets/
│   └── css/
│       └── main.css
├── components/
│   ├── Landing/
│   ├── Dashboard/
│   └── Admin/
├── composables/
│   ├── useAuth.ts
│   ├── useStaking.ts
│   └── useReferral.ts
├── layouts/
│   ├── default.vue
│   ├── dashboard.vue
│   └── admin.vue
├── middleware/
│   ├── auth.ts
│   └── admin.ts
├── pages/
│   ├── index.vue
│   ├── login.vue
│   ├── register.vue
│   ├── dashboard/
│   └── admin/
├── server/
│   └── api/
│       ├── deposits/
│       ├── staking/
│       └── referrals/
├── docs/
│   ├── FLOW.md
│   ├── TECH_STACK.md
│   ├── ARCHITECTURE.md
│   ├── DATABASE_SCHEMA.sql
│   └── index.html
├── nuxt.config.ts
├── tailwind.config.js
├── tsconfig.json
└── package.json
```

## Getting Started

1. Install dependencies:
```bash
npm install
```

2. Setup environment variables:
```bash
cp .env.example .env
# Edit .env dengan Supabase credentials
```

3. Run database migrations:
- Import `docs/DATABASE_SCHEMA.sql` ke Supabase SQL Editor

4. Start development server:
```bash
npm run dev
```

5. Build for production:
```bash
npm run build
```

## Documentation

- **Flow Diagrams**: `docs/FLOW.md`
- **Tech Stack**: `docs/TECH_STACK.md`
- **Architecture**: `docs/ARCHITECTURE.md`
- **Database Schema**: `docs/DATABASE_SCHEMA.sql`
- **HTML Documentation**: `docs/index.html`

## Notes

- OTP verification akan ditambahkan kemudian
- USDT payment gateway integration perlu ditentukan (Tron/ERC-20)
- Daily staking rewards memerlukan cron job atau scheduled function
- Token transfer hanya bisa dilakukan ke referral di bawahnya yang sudah deposit


