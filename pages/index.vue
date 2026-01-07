<template>
  <div class="min-h-screen bg-black relative overflow-hidden">
    <!-- Animated Background -->
    <div class="fixed inset-0 overflow-hidden pointer-events-none">
      <div class="absolute -top-40 -right-40 w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl"></div>
      <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-blue-500/20 rounded-full blur-3xl"></div>
      <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-96 h-96 bg-purple-500/10 rounded-full blur-3xl"></div>
    </div>

    <!-- Header -->
    <header class="bg-black/60 backdrop-blur-xl border-b border-cyan-500/20 shadow-lg shadow-cyan-500/5 sticky top-0 z-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center py-4">
          <div class="flex items-center">
            <h1 class="text-2xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent">Cuan Platform</h1>
          </div>
          <nav class="hidden md:flex space-x-6">
            <a href="#features" class="text-gray-300 hover:text-cyan-400 transition-colors duration-200">Fitur</a>
            <a href="#how-it-works" class="text-gray-300 hover:text-cyan-400 transition-colors duration-200">Cara Kerja</a>
            <a href="#pricing" class="text-gray-300 hover:text-cyan-400 transition-colors duration-200">Harga</a>
          </nav>
          <div class="flex items-center space-x-4">
            <NuxtLink to="/login" class="text-gray-300 hover:text-cyan-400 transition-colors duration-200">Masuk</NuxtLink>
            <NuxtLink to="/register" class="bg-gradient-to-r from-cyan-500 to-blue-600 text-white px-4 py-2 rounded-lg hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30">
              Daftar
            </NuxtLink>
          </div>
        </div>
      </div>
    </header>

    <!-- Hero Section -->
    <section class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-12 md:pt-16 pb-20 md:pb-32 overflow-hidden">
      <!-- Animated Gradient Orbs -->
      <div class="absolute inset-0 overflow-hidden pointer-events-none">
        <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-cyan-500/20 rounded-full blur-3xl animate-pulse"></div>
        <div class="absolute bottom-1/4 right-1/4 w-96 h-96 bg-blue-500/20 rounded-full blur-3xl animate-pulse" style="animation-delay: 1s;"></div>
        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-80 h-80 bg-purple-500/15 rounded-full blur-3xl animate-pulse" style="animation-delay: 2s;"></div>
      </div>

      <div class="text-center relative z-10">
        <!-- Badge -->
        <div class="inline-flex items-center gap-2 bg-cyan-500/10 border border-cyan-500/30 rounded-full px-4 py-2 mb-6 backdrop-blur-sm">
          <span class="w-2 h-2 bg-cyan-400 rounded-full animate-pulse"></span>
          <span class="text-sm text-cyan-400 font-medium">Trusted by 10,000+ Users</span>
        </div>

        <!-- Main Heading -->
        <h1 class="text-4xl md:text-6xl lg:text-7xl font-bold mb-6 leading-tight">
          <span class="text-gray-100 block mb-2">Platform Staking dengan</span>
          <span class="bg-gradient-to-r from-cyan-400 via-blue-400 to-purple-400 bg-clip-text text-transparent">
            Sistem Referral
          </span>
        </h1>

        <!-- Subheading -->
        <p class="text-lg md:text-xl lg:text-2xl text-gray-300 mb-4 max-w-3xl mx-auto leading-relaxed">
          Dapatkan reward staking harian <span class="text-cyan-400 font-semibold">0.5%</span> dan keuntungan dari sistem referral. 
          Mulai dengan deposit minimal <span class="text-cyan-400 font-semibold">$10 USDT</span>.
        </p>
        <p class="text-sm md:text-base text-gray-400 mb-8 max-w-2xl mx-auto">
          Platform terpercaya dengan sistem keamanan tingkat tinggi dan transaksi cepat
        </p>

        <!-- CTA Buttons -->
        <div class="flex flex-col sm:flex-row justify-center gap-4 mb-12">
          <NuxtLink to="/register" class="group bg-gradient-to-r from-cyan-500 to-blue-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30 hover:shadow-cyan-500/50 hover:scale-105 transform">
            <span class="flex items-center justify-center gap-2">
              Mulai Sekarang
              <svg class="w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
              </svg>
            </span>
          </NuxtLink>
          <a href="#how-it-works" class="bg-black/60 backdrop-blur-xl border border-cyan-500/30 text-cyan-400 px-8 py-4 rounded-lg text-lg font-semibold hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200 shadow-lg shadow-cyan-500/10 hover:scale-105 transform">
            Pelajari Lebih Lanjut
          </a>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 md:gap-6 max-w-4xl mx-auto">
          <div class="bg-black/40 backdrop-blur-xl border border-cyan-500/20 rounded-xl p-4 md:p-6 hover:border-cyan-400/50 transition-all duration-200 hover:scale-105 transform">
            <div class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent mb-1">0.5%</div>
            <div class="text-xs md:text-sm text-gray-400">Daily Reward</div>
          </div>
          <div class="bg-black/40 backdrop-blur-xl border border-purple-500/20 rounded-xl p-4 md:p-6 hover:border-purple-400/50 transition-all duration-200 hover:scale-105 transform">
            <div class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent mb-1">$10</div>
            <div class="text-xs md:text-sm text-gray-400">Min Deposit</div>
          </div>
          <div class="bg-black/40 backdrop-blur-xl border border-green-500/20 rounded-xl p-4 md:p-6 hover:border-green-400/50 transition-all duration-200 hover:scale-105 transform">
            <div class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-green-400 to-emerald-400 bg-clip-text text-transparent mb-1">24/7</div>
            <div class="text-xs md:text-sm text-gray-400">Support</div>
          </div>
          <div class="bg-black/40 backdrop-blur-xl border border-orange-500/20 rounded-xl p-4 md:p-6 hover:border-orange-400/50 transition-all duration-200 hover:scale-105 transform">
            <div class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-orange-400 to-amber-400 bg-clip-text text-transparent mb-1">10K+</div>
            <div class="text-xs md:text-sm text-gray-400">Active Users</div>
          </div>
        </div>
      </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-12 md:pt-16 pb-20">
      <div class="text-center mb-16 relative z-10">
        <h2 class="text-3xl md:text-4xl font-bold text-gray-100 mb-4">Fitur Utama</h2>
        <p class="text-lg md:text-xl text-gray-400">Semua yang Anda butuhkan untuk mulai menghasilkan</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 relative z-10">
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/30 p-8 rounded-xl shadow-lg shadow-cyan-500/20 hover:border-cyan-400 transition-all duration-200">
          <div class="w-16 h-16 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-lg mb-4 flex items-center justify-center shadow-lg shadow-cyan-500/50">
            <span class="text-white text-2xl font-bold">0.5%</span>
          </div>
          <h3 class="text-xl font-semibold text-gray-100 mb-2">Staking Harian</h3>
          <p class="text-gray-400">Dapatkan reward 0.5% per hari dari deposit Anda. Reward dibayar setiap hari secara otomatis.</p>
        </div>
        <div class="bg-black/60 backdrop-blur-xl border border-purple-500/30 p-8 rounded-xl shadow-lg shadow-purple-500/20 hover:border-purple-400 transition-all duration-200">
          <div class="w-16 h-16 bg-gradient-to-br from-purple-500 to-pink-600 rounded-lg mb-4 flex items-center justify-center shadow-lg shadow-purple-500/50">
            <span class="text-white text-2xl font-bold">90%</span>
          </div>
          <h3 class="text-xl font-semibold text-gray-100 mb-2">Coin Reward</h3>
          <p class="text-gray-400">Dapatkan 90% dari deposit sebagai Coins. Coin dapat digunakan untuk berbagai keperluan di platform.</p>
        </div>
        <div class="bg-black/60 backdrop-blur-xl border border-green-500/30 p-8 rounded-xl shadow-lg shadow-green-500/20 hover:border-green-400 transition-all duration-200">
          <div class="w-16 h-16 bg-gradient-to-br from-green-500 to-emerald-600 rounded-lg mb-4 flex items-center justify-center shadow-lg shadow-green-500/50">
            <span class="text-white text-2xl font-bold">10%</span>
          </div>
          <h3 class="text-xl font-semibold text-gray-100 mb-2">Token Referral</h3>
          <p class="text-gray-400">Dapatkan 10% token dari setiap deposit referral. Token dapat dicairkan atau ditransfer.</p>
        </div>
      </div>
    </section>

    <!-- How It Works Section -->
    <section id="how-it-works" class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-12 md:pt-16 pb-20">
      <div class="text-center mb-16 relative z-10">
        <h2 class="text-3xl md:text-4xl font-bold text-gray-100 mb-4">Cara Kerja</h2>
        <p class="text-lg md:text-xl text-gray-400">Langkah mudah untuk mulai menghasilkan</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8 relative z-10">
        <div class="text-center bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-xl p-6 hover:border-cyan-400 transition-all duration-200">
          <div class="w-16 h-16 bg-gradient-to-br from-cyan-500 to-blue-600 text-white rounded-full flex items-center justify-center mx-auto mb-4 text-2xl font-bold shadow-lg shadow-cyan-500/50">1</div>
          <h3 class="text-lg font-semibold text-gray-100 mb-2">Daftar Akun</h3>
          <p class="text-gray-400">Buat akun baru atau gunakan referral code untuk mendapatkan bonus</p>
        </div>
        <div class="text-center bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-xl p-6 hover:border-cyan-400 transition-all duration-200">
          <div class="w-16 h-16 bg-gradient-to-br from-cyan-500 to-blue-600 text-white rounded-full flex items-center justify-center mx-auto mb-4 text-2xl font-bold shadow-lg shadow-cyan-500/50">2</div>
          <h3 class="text-lg font-semibold text-gray-100 mb-2">Deposit USDT</h3>
          <p class="text-gray-400">Deposit minimal $10 USDT menggunakan wallet atau payment gateway</p>
        </div>
        <div class="text-center bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-xl p-6 hover:border-cyan-400 transition-all duration-200">
          <div class="w-16 h-16 bg-gradient-to-br from-cyan-500 to-blue-600 text-white rounded-full flex items-center justify-center mx-auto mb-4 text-2xl font-bold shadow-lg shadow-cyan-500/50">3</div>
          <h3 class="text-lg font-semibold text-gray-100 mb-2">Mulai Staking</h3>
          <p class="text-gray-400">Staking dimulai otomatis dan reward dibayar setiap hari</p>
        </div>
        <div class="text-center bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-xl p-6 hover:border-cyan-400 transition-all duration-200">
          <div class="w-16 h-16 bg-gradient-to-br from-cyan-500 to-blue-600 text-white rounded-full flex items-center justify-center mx-auto mb-4 text-2xl font-bold shadow-lg shadow-cyan-500/50">4</div>
          <h3 class="text-lg font-semibold text-gray-100 mb-2">Dapatkan Reward</h3>
          <p class="text-gray-400">Terima reward harian dan keuntungan dari sistem referral</p>
        </div>
      </div>
    </section>

    <!-- Pricing Section -->
    <section id="pricing" class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-12 md:pt-16 pb-20">
      <div class="text-center mb-16 relative z-10">
        <h2 class="text-3xl md:text-4xl font-bold text-gray-100 mb-4">Mulai dengan Mudah</h2>
        <p class="text-lg md:text-xl text-gray-400">Deposit minimal $10 untuk mulai staking</p>
      </div>
      <div class="max-w-md mx-auto relative z-10 bg-gradient-to-br from-cyan-500/10 to-blue-600/10 backdrop-blur-xl border border-cyan-500/30 p-8 rounded-2xl shadow-2xl shadow-cyan-500/20">
        <div class="text-center">
          <h3 class="text-2xl font-bold text-gray-100 mb-4">Paket Starter</h3>
          <div class="mb-6">
            <span class="text-5xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$10</span>
            <span class="text-gray-400"> minimum</span>
          </div>
          <ul class="text-left space-y-3 mb-8">
            <li class="flex items-center">
              <span class="w-5 h-5 bg-green-500 rounded-full mr-3 shadow-lg shadow-green-500/50"></span>
              <span class="text-gray-300">Staking 0.5% per hari</span>
            </li>
            <li class="flex items-center">
              <span class="w-5 h-5 bg-green-500 rounded-full mr-3 shadow-lg shadow-green-500/50"></span>
              <span class="text-gray-300">90% Coin allocation</span>
            </li>
            <li class="flex items-center">
              <span class="w-5 h-5 bg-green-500 rounded-full mr-3 shadow-lg shadow-green-500/50"></span>
              <span class="text-gray-300">10% Token allocation</span>
            </li>
            <li class="flex items-center">
              <span class="w-5 h-5 bg-green-500 rounded-full mr-3 shadow-lg shadow-green-500/50"></span>
              <span class="text-gray-300">Sistem referral aktif</span>
            </li>
            <li class="flex items-center">
              <span class="w-5 h-5 bg-green-500 rounded-full mr-3 shadow-lg shadow-green-500/50"></span>
              <span class="text-gray-300">Token transfer ke referral</span>
            </li>
          </ul>
          <NuxtLink to="/register" class="block w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-3 rounded-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 text-center shadow-lg shadow-cyan-500/30">
            Daftar Sekarang
          </NuxtLink>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="relative bg-black/80 backdrop-blur-xl border-t border-cyan-500/20 text-white py-12">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <h3 class="text-xl font-bold mb-4 bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">Cuan Platform</h3>
            <p class="text-gray-400">Platform staking dengan sistem referral terpercaya.</p>
          </div>
          <div>
            <h4 class="font-semibold mb-4 text-gray-200">Platform</h4>
            <ul class="space-y-2 text-gray-400">
              <li><a href="#features" class="hover:text-cyan-400 transition-colors duration-200">Fitur</a></li>
              <li><a href="#how-it-works" class="hover:text-cyan-400 transition-colors duration-200">Cara Kerja</a></li>
              <li><a href="#pricing" class="hover:text-cyan-400 transition-colors duration-200">Harga</a></li>
            </ul>
          </div>
          <div>
            <h4 class="font-semibold mb-4 text-gray-200">Akun</h4>
            <ul class="space-y-2 text-gray-400">
              <li><NuxtLink to="/login" class="hover:text-cyan-400 transition-colors duration-200">Masuk</NuxtLink></li>
              <li><NuxtLink to="/register" class="hover:text-cyan-400 transition-colors duration-200">Daftar</NuxtLink></li>
            </ul>
          </div>
          <div>
            <h4 class="font-semibold mb-4 text-gray-200">Kontak</h4>
            <p class="text-gray-400">Email: support@cuanplatform.com</p>
          </div>
        </div>
        <div class="border-t border-cyan-500/20 mt-8 pt-8 text-center text-gray-400">
          <p>&copy; 2024 Cuan Platform. All rights reserved.</p>
        </div>
      </div>
    </footer>
  </div>
</template>


