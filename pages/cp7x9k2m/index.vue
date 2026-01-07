<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Admin Dashboard</h1>
      <p class="text-sm md:text-base text-gray-400">Overview platform dan statistik</p>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-6 md:mb-8">
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-cyan-500/10">
        <p class="text-cyan-300 text-xs md:text-sm mb-2">Total Users</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-400">1,250</p>
        <p class="text-cyan-400/70 text-xs mt-2">+125 bulan ini</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-purple-500/20 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-purple-500/10">
        <p class="text-purple-300 text-xs md:text-sm mb-2">Total Deposits</p>
        <p class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">$125,000</p>
        <p class="text-purple-400/70 text-xs mt-2">+$12,500 bulan ini</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-green-500/20 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-green-500/10">
        <p class="text-green-300 text-xs md:text-sm mb-2">Active Staking</p>
        <p class="text-2xl md:text-3xl font-bold text-green-400">$98,500</p>
        <p class="text-green-400/70 text-xs mt-2">78.8% dari deposit</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-orange-500/20 rounded-lg md:rounded-xl p-4 md:p-6 shadow-lg shadow-orange-500/10">
        <p class="text-orange-300 text-xs md:text-sm mb-2">Pending Withdraws</p>
        <p class="text-2xl md:text-3xl font-bold text-orange-400">$2,500</p>
        <p class="text-orange-400/70 text-xs mt-2">12 requests</p>
      </div>
    </div>

    <!-- Main Content Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Left Column -->
      <div class="lg:col-span-2 space-y-4 md:space-y-6">
        <!-- Recent Deposits -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 mb-4">
            <h3 class="text-base md:text-lg font-semibold text-gray-100">Deposit Terkini</h3>
            <NuxtLink to="/cp7x9k2m/deposits" class="text-cyan-400 text-xs md:text-sm hover:text-cyan-300 hover:underline whitespace-nowrap transition-colors">
              Lihat Semua
            </NuxtLink>
          </div>
          <div class="space-y-2 md:space-y-3">
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-purple-500/20 border border-purple-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-purple-500/20">
                  <span class="text-purple-400 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">john@example.com</p>
                  <p class="text-xs text-gray-400">16 Jan 2024, 10:30</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-purple-400">+$1,000.00</p>
                <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                  Selesai
                </span>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-purple-500/20 border border-purple-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-purple-500/20">
                  <span class="text-purple-400 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">jane@example.com</p>
                  <p class="text-xs text-gray-400">16 Jan 2024, 09:15</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-purple-400">+$500.00</p>
                <span class="px-2 py-1 bg-yellow-500/20 border border-yellow-500/50 text-yellow-400 rounded text-xs font-medium">
                  Pending
                </span>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-purple-500/20 border border-purple-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-purple-500/20">
                  <span class="text-purple-400 font-semibold">+</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">bob@example.com</p>
                  <p class="text-xs text-gray-400">15 Jan 2024, 14:20</p>
                </div>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-sm text-purple-400">+$250.00</p>
                <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                  Selesai
                </span>
              </div>
            </div>
          </div>
        </div>

        <!-- Pending Withdraws -->
        <div class="bg-black/60 backdrop-blur-xl border border-orange-500/20 rounded-lg md:rounded-xl shadow-lg shadow-orange-500/10 p-4 md:p-6">
          <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 mb-4">
            <h3 class="text-base md:text-lg font-semibold text-gray-100">Withdraw Pending</h3>
            <NuxtLink to="/cp7x9k2m/withdraws" class="text-orange-400 text-xs md:text-sm hover:text-orange-300 hover:underline whitespace-nowrap transition-colors">
              Lihat Semua
            </NuxtLink>
          </div>
          <div class="space-y-2 md:space-y-3">
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-orange-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-orange-500/20 border border-orange-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-orange-500/20">
                  <span class="text-orange-400 font-semibold">-</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">alice@example.com</p>
                  <p class="text-xs text-gray-400">16 Jan 2024, 11:00</p>
                </div>
              </div>
              <div class="flex items-center gap-2">
                <div class="text-right">
                  <p class="font-semibold text-xs md:text-sm text-orange-400">-$200.00</p>
                  <p class="text-xs text-gray-400">TRC20</p>
                </div>
                <button class="px-3 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium hover:bg-green-500/30 transition-colors">
                  Approve
                </button>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 p-3 bg-black/40 backdrop-blur-sm border border-orange-500/20 rounded-lg">
              <div class="flex items-center space-x-3 flex-1">
                <div class="w-10 h-10 bg-orange-500/20 border border-orange-500/50 rounded-full flex items-center justify-center flex-shrink-0 shadow-lg shadow-orange-500/20">
                  <span class="text-orange-400 font-semibold">-</span>
                </div>
                <div class="min-w-0">
                  <p class="font-medium text-xs md:text-sm text-gray-100 truncate">charlie@example.com</p>
                  <p class="text-xs text-gray-400">15 Jan 2024, 16:45</p>
                </div>
              </div>
              <div class="flex items-center gap-2">
                <div class="text-right">
                  <p class="font-semibold text-xs md:text-sm text-orange-400">-$150.00</p>
                  <p class="text-xs text-gray-400">ERC20</p>
                </div>
                <button class="px-3 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium hover:bg-green-500/30 transition-colors">
                  Approve
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Right Column -->
      <div class="space-y-4 md:space-y-6">
        <!-- Quick Actions -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Quick Actions</h3>
          <div class="space-y-2 md:space-y-3">
            <NuxtLink
              to="/cp7x9k2m/users"
              class="block w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30"
            >
              Manage Users
            </NuxtLink>
            <NuxtLink
              to="/cp7x9k2m/deposits"
              class="block w-full bg-black/40 backdrop-blur-sm border border-cyan-500/30 text-cyan-400 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200"
            >
              Approve Deposits
            </NuxtLink>
            <NuxtLink
              to="/cp7x9k2m/withdraws"
              class="block w-full bg-black/40 backdrop-blur-sm border border-cyan-500/30 text-cyan-400 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200"
            >
              Process Withdraws
            </NuxtLink>
            <NuxtLink
              to="/cp7x9k2m/settings"
              class="block w-full bg-black/40 backdrop-blur-sm border border-cyan-500/30 text-cyan-400 py-2 md:py-3 rounded-lg font-medium text-sm md:text-base text-center hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200"
            >
              Platform Settings
            </NuxtLink>
          </div>
        </div>

        <!-- Platform Stats -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Platform Stats</h3>
          <div class="space-y-3 md:space-y-4">
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-400">Total Coins</span>
                <span class="text-base md:text-lg font-bold text-cyan-400">112,500.00</span>
              </div>
              <div class="w-full bg-black/60 rounded-full h-2 border border-cyan-500/20">
                <div class="bg-gradient-to-r from-cyan-500 to-blue-600 h-2 rounded-full shadow-lg shadow-cyan-500/50" style="width: 90%"></div>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-400">Total Tokens</span>
                <span class="text-base md:text-lg font-bold text-purple-400">12,500.00</span>
              </div>
              <div class="w-full bg-black/60 rounded-full h-2 border border-purple-500/20">
                <div class="bg-gradient-to-r from-purple-500 to-pink-600 h-2 rounded-full shadow-lg shadow-purple-500/50" style="width: 10%"></div>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-400">Daily Rewards Paid</span>
                <span class="text-base md:text-lg font-bold text-green-400">$492.50</span>
              </div>
            </div>
            <div>
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs md:text-sm text-gray-400">Active Referrals</span>
                <span class="text-base md:text-lg font-bold text-orange-400">850</span>
              </div>
            </div>
          </div>
        </div>

        <!-- System Status -->
        <div class="bg-black/60 backdrop-blur-xl border border-green-500/20 rounded-lg md:rounded-xl shadow-lg shadow-green-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">System Status</h3>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-400">API Status</span>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                Online
              </span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-400">Database</span>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                Connected
              </span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-400">Staking Engine</span>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                Active
              </span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-400">Last Backup</span>
              <span class="text-xs text-gray-400">16 Jan 2024, 00:00</span>
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

