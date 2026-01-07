<template>
  <div>
    <!-- Stats Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-6 md:mb-8">
      <div class="bg-gradient-to-br from-cyan-500/20 to-blue-600/20 backdrop-blur-xl border border-cyan-500/30 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-cyan-500/20">
        <p class="text-cyan-300 text-xs md:text-sm mb-2">Total Balance</p>
        <p class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$1,250.00</p>
        <p class="text-cyan-400/70 text-xs mt-2">+5.2% dari bulan lalu</p>
      </div>
      <div class="bg-gradient-to-br from-purple-500/20 to-pink-600/20 backdrop-blur-xl border border-purple-500/30 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-purple-500/20">
        <p class="text-purple-300 text-xs md:text-sm mb-2">Coins Balance</p>
        <p class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">1,125.00</p>
        <p class="text-purple-400/70 text-xs mt-2">90% dari deposit</p>
      </div>
      <div class="bg-gradient-to-br from-green-500/20 to-emerald-600/20 backdrop-blur-xl border border-green-500/30 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-green-500/20">
        <p class="text-green-300 text-xs md:text-sm mb-2">Tokens Balance</p>
        <p class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-green-400 to-emerald-400 bg-clip-text text-transparent">125.00</p>
        <p class="text-green-400/70 text-xs mt-2">10% dari deposit</p>
      </div>
      <div class="bg-gradient-to-br from-orange-500/20 to-amber-600/20 backdrop-blur-xl border border-orange-500/30 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-orange-500/20">
        <p class="text-orange-300 text-xs md:text-sm mb-2">Withdrawable Tokens</p>
        <p class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-orange-400 to-amber-400 bg-clip-text text-transparent">50.00</p>
        <p class="text-orange-400/70 text-xs mt-2">Dari referral deposit</p>
      </div>
    </div>

    <!-- Main Content Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Left Column -->
      <div class="lg:col-span-2 space-y-4 md:space-y-6">
        <!-- Active Staking -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 mb-4">
            <h3 class="text-base md:text-lg font-semibold text-gray-100">Staking Aktif</h3>
            <NuxtLink to="/dashboard/staking" class="text-cyan-400 text-xs md:text-sm hover:text-cyan-300 hover:underline whitespace-nowrap transition-colors">
              Lihat Semua
            </NuxtLink>
          </div>
          <div class="space-y-3 md:space-y-4">
            <div class="bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-3 md:p-4 shadow-lg shadow-cyan-500/5">
              <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-2 mb-3 md:mb-2">
                <div>
                  <p class="font-medium text-sm md:text-base text-gray-100">Staking #001</p>
                  <p class="text-xs text-gray-400">Dimulai 15 Jan 2024</p>
                </div>
                <span class="px-3 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded-full text-xs font-medium whitespace-nowrap shadow-lg shadow-green-500/20">
                  Aktif
                </span>
              </div>
              <div class="grid grid-cols-2 gap-3 md:gap-4 mb-3 md:mb-4">
                <div>
                  <p class="text-xs text-gray-400 mb-1">Principal</p>
                  <p class="text-lg md:text-lg font-semibold text-gray-100">$1,000.00</p>
                </div>
                <div>
                  <p class="text-xs text-gray-400 mb-1">Daily Reward</p>
                  <p class="text-lg md:text-lg font-semibold text-green-400">$5.00</p>
                </div>
              </div>
              <div class="pt-3 md:pt-4 border-t border-cyan-500/20">
                <div class="flex items-center justify-between text-sm">
                  <span class="text-gray-400">Total Reward</span>
                  <span class="font-semibold text-cyan-400">$250.00</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Recent Transactions -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 mb-4">
            <h3 class="text-base md:text-lg font-semibold text-gray-100">Transaksi Terkini</h3>
            <NuxtLink to="/dashboard/history" class="text-cyan-400 text-xs md:text-sm hover:text-cyan-300 hover:underline whitespace-nowrap transition-colors">
              Lihat Semua
            </NuxtLink>
          </div>
          <div class="space-y-2 md:space-y-3">
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-green-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-green-500/20 border border-green-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-green-500/20">
                  <span class="text-green-400 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">Daily Staking Reward</p>
                  <p class="text-xs text-gray-400">16 Jan 2024, 08:00</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-green-400">+$5.00</p>
                <p class="text-xs text-gray-400">Coins</p>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-cyan-500/20 border border-cyan-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-cyan-500/20">
                  <span class="text-cyan-400 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">Referral Token</p>
                  <p class="text-xs text-gray-400">15 Jan 2024, 14:30</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-cyan-400">+$10.00</p>
                <p class="text-xs text-gray-400">Tokens</p>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-purple-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-purple-500/20 border border-purple-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-purple-500/20">
                  <span class="text-purple-400 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">Deposit</p>
                  <p class="text-xs text-gray-400">10 Jan 2024, 10:15</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-purple-400">+$1,000.00</p>
                <p class="text-xs text-gray-400">USDT</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Right Column -->
      <div class="space-y-4 md:space-y-6">
        <!-- Quick Actions -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Aksi Cepat</h3>
          <div class="space-y-2 md:space-y-3">
            <NuxtLink
              to="/dashboard/deposit"
              class="block w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30"
            >
              Deposit Baru
            </NuxtLink>
            <NuxtLink
              to="/dashboard/transfers"
              class="block w-full bg-black/40 backdrop-blur-sm border border-cyan-500/30 text-cyan-400 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200"
            >
              Transfer Token
            </NuxtLink>
            <NuxtLink
              to="/dashboard/referral"
              class="block w-full bg-black/40 backdrop-blur-sm border border-cyan-500/30 text-cyan-400 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200"
            >
              Bagikan Referral
            </NuxtLink>
          </div>
        </div>

        <!-- Referral Stats -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Statistik Referral</h3>
          <div class="space-y-3 md:space-y-4">
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-400">Total Referral</span>
                <span class="text-base md:text-lg font-bold text-cyan-400">12</span>
              </div>
              <div class="w-full bg-black/60 rounded-full h-2 border border-cyan-500/20">
                <div class="bg-gradient-to-r from-cyan-500 to-blue-600 h-2 rounded-full shadow-lg shadow-cyan-500/50" style="width: 60%"></div>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-400">Aktif Deposit</span>
                <span class="text-base md:text-lg font-bold text-green-400">8</span>
              </div>
              <div class="w-full bg-black/60 rounded-full h-2 border border-green-500/20">
                <div class="bg-gradient-to-r from-green-500 to-emerald-600 h-2 rounded-full shadow-lg shadow-green-500/50" style="width: 67%"></div>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-400">Total Komisi</span>
                <span class="text-base md:text-lg font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$50.00</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Referral Code -->
        <div class="bg-gradient-to-br from-cyan-500/10 to-blue-600/10 backdrop-blur-xl border border-cyan-500/30 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/20 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-2">Kode Referral Anda</h3>
          <div class="bg-black/60 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-3 md:p-4 mb-4 shadow-lg shadow-cyan-500/10">
            <p class="text-xl md:text-2xl font-bold text-center bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent tracking-wider">ABC123XY</p>
          </div>
          <button class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-2 rounded-lg font-medium text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30">
            Salin Kode
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'dashboard'
})
</script>


