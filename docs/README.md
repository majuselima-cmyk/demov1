# Dokumentasi Cuan Platform

Dokumentasi lengkap untuk Cuan Platform - Platform staking berbasis blockchain dengan sistem referral.

## Daftar Dokumentasi

### 1. [FLOW.md](FLOW.md)
User flow dan business flow lengkap:
- Landing page flow
- Registration flow
- Login flow
- Deposit flow
- Staking flow
- Referral flow
- Token transfer flow
- Admin flow
- Database flow

### 2. [FLOW_DIAGRAM.txt](FLOW_DIAGRAM.txt)
Diagram flow dalam format text/ASCII art untuk visualisasi cepat.

### 3. [TECH_STACK.md](TECH_STACK.md)
Detail teknologi yang digunakan:
- Frontend stack (Nuxt.js, Tailwind CSS)
- Backend stack (Supabase, PostgreSQL)
- Database schema detail
- Package dependencies
- Project structure

### 4. [ARCHITECTURE.md](ARCHITECTURE.md)
Arsitektur sistem lengkap:
- System architecture overview
- Application layers
- Data flow architecture
- Security architecture
- Scalability considerations
- Deployment architecture

### 5. [DATABASE_SCHEMA.sql](DATABASE_SCHEMA.sql)
SQL schema untuk Supabase:
- Table definitions
- Indexes
- Functions dan triggers
- Row Level Security policies
- Stored procedures

### 6. [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)
Ringkasan proyek:
- Overview platform
- Fitur utama
- Konsep bisnis
- Tech stack summary
- Development roadmap

### 7. [SETUP_GUIDE.md](SETUP_GUIDE.md)
Panduan setup lengkap:
- Prerequisites
- Setup Supabase
- Environment variables
- Development setup
- Deployment guide
- Troubleshooting

### 8. [index.html](index.html)
Dokumentasi interaktif dalam format HTML:
- Buka di browser untuk tampilan yang lebih baik
- Menggunakan Tailwind CSS
- Navigasi mudah
- Responsive design

## Quick Reference

### Konsep Bisnis
- Deposit minimum: $10 USDT
- Staking: 0.5% per hari
- Coin allocation: 90%
- Token allocation: 10%
- Referral token: 10% dari deposit referral

### Tech Stack
- **Frontend**: Nuxt.js 3, Tailwind CSS, TypeScript
- **Backend**: Supabase (PostgreSQL, Auth)
- **Deployment**: Vercel / Cloudflare Pages

### Database Tables
1. `profiles` - User profiles
2. `deposits` - Deposit transactions
3. `staking` - Staking records
4. `user_balances` - User balances
5. `referral_chain` - Referral relationships
6. `token_transfers` - Token transfers

## Mulai Development

1. Baca [SETUP_GUIDE.md](SETUP_GUIDE.md) untuk setup awal
2. Review [FLOW.md](FLOW.md) untuk memahami flow aplikasi
3. Check [ARCHITECTURE.md](ARCHITECTURE.md) untuk arsitektur
4. Import [DATABASE_SCHEMA.sql](DATABASE_SCHEMA.sql) ke Supabase

## Catatan

- Semua dokumentasi menggunakan bahasa Indonesia
- Tidak menggunakan icon atau emoji
- Format: Markdown (.md) dan HTML
- Styling: Tailwind CSS untuk HTML documentation


