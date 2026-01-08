<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Dashboard Admin</h1>
      <p class="text-sm md:text-base text-gray-600">Ringkasan platform dan statistik</p>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-6 md:mb-8">
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm hover:shadow-md transition-shadow">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Pengguna</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-600">1,250</p>
        <p class="text-gray-500 text-xs mt-2">+125 bulan ini</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm hover:shadow-md transition-shadow">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Deposit</p>
        <p class="text-2xl md:text-3xl font-bold text-purple-600">$125,000</p>
        <p class="text-gray-500 text-xs mt-2">+$12,500 bulan ini</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm hover:shadow-md transition-shadow">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Staking Aktif</p>
        <p class="text-2xl md:text-3xl font-bold text-green-600">$98,500</p>
        <p class="text-gray-500 text-xs mt-2">78.8% dari deposit</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm hover:shadow-md transition-shadow">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Withdraw Tertunda</p>
        <p class="text-2xl md:text-3xl font-bold text-orange-600">$2,500</p>
        <p class="text-gray-500 text-xs mt-2">12 permintaan</p>
      </div>
    </div>

    <!-- Main Content Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Left Column -->
      <div class="lg:col-span-2 space-y-4 md:space-y-6">
        <!-- Recent Deposits -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 mb-4">
            <h3 class="text-base md:text-lg font-semibold text-gray-900">Deposit Terkini</h3>
            <NuxtLink to="/cp7x9k2m/dashboard/deposits" class="text-cyan-600 text-xs md:text-sm hover:text-cyan-700 hover:underline whitespace-nowrap transition-colors">
              Lihat Semua
            </NuxtLink>
          </div>
          <div class="space-y-2 md:space-y-3">
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-gray-50 border border-gray-200 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center flex-shrink-0">
                  <span class="text-purple-600 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-900 truncate">john@example.com</p>
                  <p class="text-xs text-gray-500">16 Jan 2024, 10:30</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-purple-600">+$1,000.00</p>
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">
                  Selesai
                </span>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-gray-50 border border-gray-200 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center flex-shrink-0">
                  <span class="text-purple-600 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-900 truncate">jane@example.com</p>
                  <p class="text-xs text-gray-500">16 Jan 2024, 09:15</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-purple-600">+$500.00</p>
                <span class="px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium">
                  Tertunda
                </span>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-gray-50 border border-gray-200 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center flex-shrink-0">
                  <span class="text-purple-600 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-900 truncate">bob@example.com</p>
                  <p class="text-xs text-gray-500">15 Jan 2024, 14:20</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-purple-600">+$250.00</p>
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">
                  Selesai
                </span>
              </div>
            </div>
          </div>
        </div>

        <!-- Pending Withdraws -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 mb-4">
            <h3 class="text-base md:text-lg font-semibold text-gray-900">Withdraw Tertunda</h3>
            <NuxtLink to="/cp7x9k2m/dashboard/withdraws" class="text-orange-600 text-xs md:text-sm hover:text-orange-700 hover:underline whitespace-nowrap transition-colors">
              Lihat Semua
            </NuxtLink>
          </div>
          <div class="space-y-2 md:space-y-3">
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-gray-50 border border-gray-200 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-orange-100 rounded-full flex items-center justify-center flex-shrink-0">
                  <span class="text-orange-600 font-semibold">-</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-900 truncate">alice@example.com</p>
                  <p class="text-xs text-gray-500">16 Jan 2024, 11:00</p>
                </div>
              </div>
              <div class="flex items-center gap-2">
                <div class="text-right">
                  <p class="font-semibold text-xs md:text-sm text-orange-600">-$200.00</p>
                  <p class="text-xs text-gray-500">TRC20</p>
                </div>
                <button class="px-3 py-1 bg-green-100 text-green-700 rounded text-xs font-medium hover:bg-green-200 transition-colors">
                  Setujui
                </button>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-gray-50 border border-gray-200 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-orange-100 rounded-full flex items-center justify-center flex-shrink-0">
                  <span class="text-orange-600 font-semibold">-</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-900 truncate">charlie@example.com</p>
                  <p class="text-xs text-gray-500">15 Jan 2024, 16:45</p>
                </div>
              </div>
              <div class="flex items-center gap-2">
                <div class="text-right">
                  <p class="font-semibold text-xs md:text-sm text-orange-600">-$150.00</p>
                  <p class="text-xs text-gray-500">ERC20</p>
                </div>
                <button class="px-3 py-1 bg-green-100 text-green-700 rounded text-xs font-medium hover:bg-green-200 transition-colors">
                  Setujui
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Right Column -->
      <div class="space-y-4 md:space-y-6">
        <!-- Quick Actions -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Aksi Cepat</h3>
          <div class="space-y-2 md:space-y-3">
            <NuxtLink
              to="/cp7x9k2m/dashboard/users"
              class="block w-full bg-gradient-to-r from-cyan-600 to-blue-600 text-white py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:from-cyan-700 hover:to-blue-700 transition-all duration-200 shadow-md"
            >
              Kelola Pengguna
            </NuxtLink>
            <NuxtLink
              to="/cp7x9k2m/dashboard/deposits"
              class="block w-full bg-gray-100 border border-gray-300 text-gray-700 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-gray-200 transition-all duration-200"
            >
              Setujui Deposit
            </NuxtLink>
            <NuxtLink
              to="/cp7x9k2m/dashboard/withdraws"
              class="block w-full bg-gray-100 border border-gray-300 text-gray-700 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-gray-200 transition-all duration-200"
            >
              Proses Withdraw
            </NuxtLink>
            <NuxtLink
              to="/cp7x9k2m/dashboard/settings"
              class="block w-full bg-gray-100 border border-gray-300 text-gray-700 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-gray-200 transition-all duration-200"
            >
              Pengaturan Platform
            </NuxtLink>
          </div>
        </div>

        <!-- Platform Stats -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Statistik Platform</h3>
          <div class="space-y-3 md:space-y-4">
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-600">Total Coins</span>
                <span class="text-base md:text-lg font-bold text-cyan-600">112,500.00</span>
              </div>
              <div class="w-full bg-gray-200 rounded-full h-2">
                <div class="bg-gradient-to-r from-cyan-600 to-blue-600 h-2 rounded-full" style="width: 90%"></div>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-600">Total Tokens</span>
                <span class="text-base md:text-lg font-bold text-purple-600">12,500.00</span>
              </div>
              <div class="w-full bg-gray-200 rounded-full h-2">
                <div class="bg-gradient-to-r from-purple-600 to-pink-600 h-2 rounded-full" style="width: 10%"></div>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-600">Reward Harian Dibayar</span>
                <span class="text-base md:text-lg font-bold text-green-600">$492.50</span>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-600">Referral Aktif</span>
                <span class="text-base md:text-lg font-bold text-orange-600">850</span>
              </div>
            </div>
          </div>
        </div>

        <!-- System Status -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Status Sistem</h3>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Status API</span>
              <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">
                Online
              </span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Database</span>
              <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">
                Terhubung
              </span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Mesin Staking</span>
              <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">
                Aktif
              </span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Backup Terakhir</span>
              <span class="text-xs text-gray-500">16 Jan 2024, 00:00</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'admin'
})
</script>
