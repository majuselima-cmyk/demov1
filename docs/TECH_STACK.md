# Tech Stack - Cuan Platform

## Frontend

### Nuxt.js 3
- **Version**: 3.8.0+
- **Purpose**: Full-stack Vue.js framework
- **Features Used**:
  - Server-Side Rendering (SSR)
  - File-based routing
  - Auto-imports
  - Composables
  - Middleware for authentication

### Tailwind CSS
- **Version**: 3.3.6+
- **Purpose**: Utility-first CSS framework
- **Configuration**: Custom config for design system
- **Usage**: Responsive design, utility classes

## Backend & Database

### Supabase
- **Service**: Backend-as-a-Service
- **Components Used**:
  - **PostgreSQL Database**: Main data storage
  - **Supabase Auth**: Authentication & authorization
  - **Row Level Security (RLS)**: Data security
  - **Realtime**: Real-time updates (optional)
  - **Storage**: File storage (if needed)

### Supabase Client
- **Package**: @supabase/supabase-js
- **Version**: 2.38.4+
- **Nuxt Module**: @nuxtjs/supabase
- **Version**: 1.3.0+

## Database Schema

### Tables

#### profiles
```sql
- id (uuid, primary key, references auth.users)
- email (text)
- referral_code (text, unique)
- upline_id (uuid, references profiles.id)
- role (text: 'member' | 'admin')
- created_at (timestamp)
- updated_at (timestamp)
```

#### deposits
```sql
- id (uuid, primary key)
- user_id (uuid, references profiles.id)
- amount (decimal)
- currency (text, default 'USDT')
- status (text: 'pending' | 'confirmed' | 'failed')
- transaction_hash (text)
- created_at (timestamp)
- confirmed_at (timestamp)
```

#### staking
```sql
- id (uuid, primary key)
- user_id (uuid, references profiles.id)
- amount (decimal)
- daily_rate (decimal, default 0.005)
- status (text: 'active' | 'completed' | 'paused')
- started_at (timestamp)
- last_reward_at (timestamp)
- created_at (timestamp)
```

#### user_balances
```sql
- id (uuid, primary key)
- user_id (uuid, references profiles.id, unique)
- coins_balance (decimal, default 0)
- tokens_balance (decimal, default 0)
- withdrawable_tokens (decimal, default 0)
- updated_at (timestamp)
```

#### referral_chain
```sql
- id (uuid, primary key)
- referrer_id (uuid, references profiles.id)
- referee_id (uuid, references profiles.id)
- level (integer)
- created_at (timestamp)
```

#### token_transfers
```sql
- id (uuid, primary key)
- from_user_id (uuid, references profiles.id)
- to_user_id (uuid, references profiles.id)
- amount (decimal)
- status (text: 'pending' | 'completed' | 'failed')
- created_at (timestamp)
```

## Authentication

### Supabase Auth
- **Method**: Email/Password
- **Features**:
  - Email verification (OTP - coming soon)
  - Session management
  - Password reset
  - Role-based access control

### Middleware
- **Auth Middleware**: Protect routes
- **Admin Middleware**: Admin-only routes
- **Guest Middleware**: Public routes only

## Deployment

### Vercel
- **Platform**: Vercel
- **Build Command**: `npm run build`
- **Output Directory**: `.output`
- **Environment Variables**: Supabase credentials

### Cloudflare Pages
- **Platform**: Cloudflare Pages
- **Build Command**: `npm run build`
- **Output Directory**: `.output`
- **Environment Variables**: Supabase credentials

## Development Tools

### TypeScript
- **Purpose**: Type safety
- **Configuration**: Nuxt auto-configuration

### Nuxt DevTools
- **Purpose**: Development debugging
- **Enabled**: Development mode only

## External Services

### USDT Payment
- **Integration**: TBD (Web3 wallet or payment gateway)
- **Network**: Tron/ERC-20 (to be determined)
- **Verification**: Webhook or manual confirmation

## Environment Variables

```env
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key (server-side only)
```

## Package Dependencies

### Production
- `nuxt`: ^3.8.0
- `@supabase/supabase-js`: ^2.38.4
- `@nuxtjs/supabase`: ^1.3.0

### Development
- `@nuxt/devtools`: latest
- `tailwindcss`: ^3.3.6

## Project Structure

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
│   ├── index.vue (landing)
│   ├── login.vue
│   ├── register.vue
│   ├── dashboard/
│   │   └── index.vue
│   └── admin/
│       └── index.vue
├── server/
│   ├── api/
│   │   ├── deposits/
│   │   ├── staking/
│   │   └── referrals/
│   └── utils/
│       └── supabase.ts
├── public/
├── docs/
├── nuxt.config.ts
├── tailwind.config.js
├── tsconfig.json
└── package.json
```


