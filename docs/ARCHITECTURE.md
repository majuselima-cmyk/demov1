# Architecture Documentation - Cuan Platform

## System Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                        Client Layer                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │ Landing Page │  │Member Dashboard│ │Admin Dashboard│     │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────────────────────────────────────────────────────────┘
                            │
                            │ HTTP/HTTPS
                            │
┌─────────────────────────────────────────────────────────────┐
│                    Nuxt.js Application                       │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Pages & Components                       │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Composables & Utils                     │  │
│  │  - useAuth()                                         │  │
│  │  - useStaking()                                      │  │
│  │  - useReferral()                                     │  │
│  │  - useBalance()                                      │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Middleware                               │  │
│  │  - auth.ts (Authentication)                          │  │
│  │  - admin.ts (Admin Authorization)                    │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Server API Routes                        │  │
│  │  - /api/deposits                                     │  │
│  │  - /api/staking                                      │  │
│  │  - /api/referrals                                    │  │
│  │  - /api/balances                                     │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                            │
                            │ Supabase Client
                            │
┌─────────────────────────────────────────────────────────────┐
│                      Supabase Backend                        │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Authentication Service                   │  │
│  │  - Email/Password Auth                                │  │
│  │  - Session Management                                 │  │
│  │  - OTP (Coming Soon)                                 │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              PostgreSQL Database                      │  │
│  │  - profiles                                          │  │
│  │  - deposits                                          │  │
│  │  - staking                                           │  │
│  │  - user_balances                                     │  │
│  │  - referral_chain                                    │  │
│  │  - token_transfers                                   │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Row Level Security (RLS)                │  │
│  │  - User can only access own data                     │  │
│  │  - Admin can access all data                         │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                            │
                            │ External API
                            │
┌─────────────────────────────────────────────────────────────┐
│                  External Services                           │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              USDT Payment Gateway                     │  │
│  │  - Payment Processing                                 │  │
│  │  - Transaction Verification                           │  │
│  │  - Webhook Callbacks                                  │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## Application Architecture

### Layer 1: Presentation Layer

#### Pages
- **Landing Page** (`pages/index.vue`)
  - Public access
  - Marketing content
  - Register/Login CTAs

- **Authentication Pages**
  - `pages/login.vue` - User login
  - `pages/register.vue` - User registration
  - `pages/auth/callback.vue` - OAuth callback

- **Member Dashboard** (`pages/dashboard/index.vue`)
  - Protected route (auth middleware)
  - Balance overview
  - Staking information
  - Deposit interface
  - Referral management
  - Token transfer

- **Admin Dashboard** (`pages/admin/index.vue`)
  - Protected route (admin middleware)
  - User management
  - Deposit approval
  - Staking management
  - Reports & analytics

#### Layouts
- **Default Layout** (`layouts/default.vue`)
  - Public pages layout
  - Header & Footer

- **Dashboard Layout** (`layouts/dashboard.vue`)
  - Member dashboard layout
  - Sidebar navigation
  - User profile section

- **Admin Layout** (`layouts/admin.vue`)
  - Admin dashboard layout
  - Admin sidebar
  - Admin navigation

### Layer 2: Business Logic Layer

#### Composables
- **useAuth()** (`composables/useAuth.ts`)
  - Authentication state
  - Login/Logout functions
  - User profile management

- **useStaking()** (`composables/useStaking.ts`)
  - Staking calculations
  - Daily reward computation
  - Staking status management

- **useReferral()** (`composables/useReferral.ts`)
  - Referral code generation
  - Referral chain management
  - Token distribution logic

- **useBalance()** (`composables/useBalance.ts`)
  - Balance fetching
  - Coin/Token balance management
  - Withdrawable token calculation

#### Middleware
- **auth.ts** (`middleware/auth.ts`)
  - Check authentication
  - Redirect to login if not authenticated
  - Protect member routes

- **admin.ts** (`middleware/admin.ts`)
  - Check admin role
  - Redirect if not admin
  - Protect admin routes

### Layer 3: Data Access Layer

#### Server API Routes
- **Deposits API** (`server/api/deposits/`)
  - `POST /api/deposits` - Create deposit request
  - `GET /api/deposits` - Get user deposits
  - `POST /api/deposits/confirm` - Confirm deposit (admin)

- **Staking API** (`server/api/staking/`)
  - `GET /api/staking` - Get staking info
  - `POST /api/staking/calculate` - Calculate rewards
  - `GET /api/staking/rewards` - Get reward history

- **Referrals API** (`server/api/referrals/`)
  - `GET /api/referrals` - Get referral chain
  - `POST /api/referrals/transfer` - Transfer tokens
  - `GET /api/referrals/stats` - Get referral statistics

- **Balances API** (`server/api/balances/`)
  - `GET /api/balances` - Get user balances
  - `POST /api/balances/update` - Update balances (internal)

#### Database Functions (Supabase)
- **Stored Procedures**
  - `calculate_daily_rewards()` - Calculate staking rewards
  - `distribute_referral_tokens()` - Distribute tokens to upline
  - `update_user_balance()` - Update user balances

- **Triggers**
  - `on_deposit_confirmed` - Trigger staking start
  - `on_referral_created` - Link referral chain
  - `on_token_transfer` - Update balances

### Layer 4: External Integration Layer

#### USDT Payment Integration
- Payment gateway connection
- Transaction verification
- Webhook handling
- Balance updates

## Data Flow Architecture

### Registration Flow
```
User Input → Register Page → Supabase Auth → Create Profile → Link Referral → Success
```

### Deposit Flow
```
User Input → Deposit Form → Generate Payment → External Payment → Webhook → Verify → Process Deposit → Start Staking → Distribute Rewards → Update Balances
```

### Staking Flow
```
Cron Job → Fetch Active Staking → Calculate Rewards → Allocate Coins/Tokens → Update Balances → Check Referrals → Distribute Tokens
```

### Referral Flow
```
User Deposits → Check Upline → Calculate Token Share → Transfer to Upline → Update Withdrawable Tokens → Update Referee Tokens
```

## Security Architecture

### Authentication
- Supabase Auth handles all authentication
- JWT tokens for session management
- Secure password hashing (bcrypt)

### Authorization
- Row Level Security (RLS) in Supabase
- Role-based access control (member/admin)
- Middleware for route protection

### Data Protection
- HTTPS only
- Environment variables for secrets
- SQL injection prevention (parameterized queries)
- XSS protection (Vue auto-escaping)

## Scalability Considerations

### Database
- Indexed columns for performance
- Connection pooling (Supabase handles)
- Query optimization

### Caching
- Client-side caching for balances
- Server-side caching for static data
- CDN for static assets (Vercel/Cloudflare)

### Background Jobs
- Cron jobs for daily rewards (Supabase Edge Functions or external service)
- Queue system for deposit processing
- Async token distribution

## Deployment Architecture

### Vercel Deployment
```
Git Repository → Vercel → Build → Deploy → Edge Network
```

### Cloudflare Pages Deployment
```
Git Repository → Cloudflare Pages → Build → Deploy → Global CDN
```

### Environment Configuration
- Production environment variables
- Staging environment (optional)
- Development environment

## Monitoring & Logging

### Application Monitoring
- Error tracking (to be implemented)
- Performance monitoring
- User activity logging

### Database Monitoring
- Supabase dashboard
- Query performance
- Connection monitoring

## Future Enhancements

### Planned Features
- OTP verification system
- Email notifications
- Real-time balance updates
- Advanced analytics dashboard
- Mobile app (future)

### Technical Improvements
- Redis caching layer
- Message queue for async tasks
- GraphQL API (optional)
- Microservices architecture (if needed)


