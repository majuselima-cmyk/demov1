<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Staking</h1>
      <p class="text-sm md:text-base text-gray-400">Kelola staking Anda dan lihat reward harian</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Staking</p>
        <p class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$1,000.00</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-green-500/20 rounded-lg md:rounded-xl shadow-lg shadow-green-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Daily Reward</p>
        <p class="text-2xl md:text-3xl font-bold text-green-400">$5.00</p>
        <p class="text-xs text-gray-400 mt-1">0.5% per hari</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-blue-500/20 rounded-lg md:rounded-xl shadow-lg shadow-blue-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Reward</p>
        <p class="text-2xl md:text-3xl font-bold text-blue-400">$250.00</p>
      </div>
    </div>

    <!-- Active Staking List -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6 mb-4 md:mb-6">
      <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Staking Aktif</h2>
      <div class="space-y-4">
        <div class="bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-4 md:p-6 shadow-lg shadow-cyan-500/5">
          <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 mb-4">
            <div class="flex-1 min-w-0">
              <p class="font-semibold text-sm md:text-base text-gray-100">Staking #001</p>
              <p class="text-xs md:text-sm text-gray-400">Dimulai: 10 Jan 2024, 10:15</p>
            </div>
            <span class="px-3 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded-full text-xs font-medium w-fit shadow-lg shadow-green-500/20">
              Aktif
            </span>
          </div>
          <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4 mb-4">
            <div>
              <p class="text-xs text-gray-400 mb-1">Principal</p>
              <p class="text-base md:text-lg font-semibold text-gray-100">$1,000.00</p>
            </div>
            <div>
              <p class="text-xs text-gray-400 mb-1">Daily Rate</p>
              <p class="text-base md:text-lg font-semibold text-gray-100">0.5%</p>
            </div>
            <div>
              <p class="text-xs text-gray-400 mb-1">Daily Reward</p>
              <p class="text-base md:text-lg font-semibold text-green-400">$5.00</p>
            </div>
            <div>
              <p class="text-xs text-gray-400 mb-1">Total Reward</p>
              <p class="text-base md:text-lg font-semibold text-blue-400">$250.00</p>
            </div>
          </div>
          <div class="pt-3 md:pt-4 border-t border-cyan-500/20">
            <div class="flex items-center justify-between text-xs md:text-sm">
              <span class="text-gray-400">Durasi</span>
              <span class="font-semibold text-cyan-400">50 hari</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Reward History -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
      <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Riwayat Reward</h2>
      <div class="overflow-x-auto -mx-4 md:mx-0">
        <div class="inline-block min-w-full px-4 md:px-0">
          <table class="w-full">
            <thead>
              <tr class="border-b border-gray-600/40">
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Tanggal</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Reward</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Coins</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Tokens</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Status</th>
              </tr>
            </thead>
            <tbody>
              <tr class="border-b border-gray-600/40 hover:bg-black/40 transition-colors">
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-300">16 Jan, 08:00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-100">$5.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-green-400">+$4.50</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-blue-400">+$0.50</td>
                <td class="py-2 md:py-3 px-2 md:px-4">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                    Selesai
                  </span>
                </td>
              </tr>
              <tr class="border-b border-gray-600/40 hover:bg-black/40 transition-colors">
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-300">15 Jan, 08:00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-100">$5.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-green-400">+$4.50</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-blue-400">+$0.50</td>
                <td class="py-2 md:py-3 px-2 md:px-4">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                    Selesai
                  </span>
                </td>
              </tr>
              <tr class="border-b border-gray-600/40 hover:bg-black/40 transition-colors">
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-300">14 Jan, 08:00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-100">$5.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-green-400">+$4.50</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-blue-400">+$0.50</td>
                <td class="py-2 md:py-3 px-2 md:px-4">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                    Selesai
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
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
