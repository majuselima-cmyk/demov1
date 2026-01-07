<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Referral</h1>
      <p class="text-sm md:text-base text-gray-400">Kelola referral Anda dan dapatkan komisi</p>
    </div>

    <!-- Referral Code Card -->
    <div class="bg-gradient-to-br from-cyan-500/20 to-blue-600/20 backdrop-blur-xl border border-cyan-500/30 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/20 p-6 md:p-8 mb-4 md:mb-6">
      <h2 class="text-base md:text-xl font-semibold text-gray-100 mb-4">Kode Referral Anda</h2>
      <div class="bg-black/60 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-4 md:p-6 mb-4 shadow-lg shadow-cyan-500/10">
        <p class="text-3xl md:text-4xl font-bold text-center bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent tracking-wider">ABC123XY</p>
      </div>
      <div class="grid grid-cols-2 gap-3 md:gap-4 md:flex md:space-x-4">
        <button class="col-span-1 md:flex-1 bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-3 rounded-lg font-semibold text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30">
          Salin Kode
        </button>
        <button class="col-span-1 md:flex-1 bg-black/40 backdrop-blur-sm border border-cyan-500/30 text-cyan-400 py-2 md:py-3 rounded-lg font-semibold text-sm md:text-base hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200">
          Bagikan Link
        </button>
      </div>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-6 mb-4 md:mb-6">
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Referral</p>
        <p class="text-xl md:text-3xl font-bold text-cyan-400">12</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-green-500/20 rounded-lg md:rounded-xl shadow-lg shadow-green-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Aktif Deposit</p>
        <p class="text-xl md:text-3xl font-bold text-green-400">8</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-blue-500/20 rounded-lg md:rounded-xl shadow-lg shadow-blue-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Komisi</p>
        <p class="text-xl md:text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$50.00</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-orange-500/20 rounded-lg md:rounded-xl shadow-lg shadow-orange-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Withdrawable</p>
        <p class="text-xl md:text-3xl font-bold text-orange-400">$50.00</p>
      </div>
    </div>

    <!-- Referral List -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
      <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Daftar Referral</h2>
      <div class="overflow-x-auto -mx-4 md:mx-0">
        <div class="inline-block min-w-full px-4 md:px-0">
          <table class="w-full">
            <thead>
              <tr class="border-b border-gray-600/40">
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Nama</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300 hidden sm:table-cell">Email</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Status</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Deposit</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300">Komisi</th>
                <th class="text-left py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-300 hidden md:table-cell">Tanggal</th>
              </tr>
            </thead>
            <tbody>
              <tr class="border-b border-gray-600/40 hover:bg-black/40 transition-colors">
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-100 font-medium">Jane Smith</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden sm:table-cell">jane@example.com</td>
                <td class="py-2 md:py-3 px-2 md:px-4">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                    Aktif
                  </span>
                </td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-100">$500.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-green-400">$50.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden md:table-cell">12 Jan 2024</td>
              </tr>
              <tr class="border-b border-gray-600/40 hover:bg-black/40 transition-colors">
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-100 font-medium">Bob Johnson</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden sm:table-cell">bob@example.com</td>
                <td class="py-2 md:py-3 px-2 md:px-4">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                    Aktif
                  </span>
                </td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-100">$300.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-green-400">$30.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden md:table-cell">8 Jan 2024</td>
              </tr>
              <tr class="border-b border-gray-600/40 hover:bg-black/40 transition-colors">
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-100 font-medium">Alice Williams</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden sm:table-cell">alice@example.com</td>
                <td class="py-2 md:py-3 px-2 md:px-4">
                  <span class="px-2 py-1 bg-yellow-500/20 border border-yellow-500/50 text-yellow-400 rounded text-xs font-medium">
                    Pending
                  </span>
                </td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-400">-</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-400">-</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden md:table-cell">5 Jan 2024</td>
              </tr>
              <tr class="border-b border-gray-600/40 hover:bg-black/40 transition-colors">
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-100 font-medium">Charlie Brown</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden sm:table-cell">charlie@example.com</td>
                <td class="py-2 md:py-3 px-2 md:px-4">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                    Aktif
                  </span>
                </td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-gray-100">$200.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm font-semibold text-green-400">$20.00</td>
                <td class="py-2 md:py-3 px-2 md:px-4 text-xs md:text-sm text-gray-400 hidden md:table-cell">3 Jan 2024</td>
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
