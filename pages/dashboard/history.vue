<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Riwayat Transaksi</h1>
      <p class="text-sm md:text-base text-gray-400">Lihat semua transaksi Anda</p>
    </div>

    <!-- Filters -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Tipe</label>
          <select class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200">
            <option value="">Semua</option>
            <option value="deposit">Deposit</option>
            <option value="reward">Reward</option>
            <option value="referral">Referral</option>
            <option value="transfer">Transfer</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200">
            <option value="">Semua</option>
            <option value="completed">Selesai</option>
            <option value="pending">Pending</option>
            <option value="failed">Gagal</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Dari Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200" />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Sampai Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200" />
        </div>
      </div>
    </div>

    <!-- Transactions Table -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 overflow-hidden">
      <div class="overflow-x-auto -mx-4 md:mx-0">
        <div class="inline-block min-w-full px-4 md:px-0">
          <table class="w-full">
            <thead class="bg-black/40">
              <tr>
                <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-300">Tanggal</th>
                <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-300">Tipe</th>
                <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-300">Deskripsi</th>
                <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-300">Jumlah</th>
                <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-300 hidden sm:table-cell">Status</th>
              </tr>
            </thead>
            <tbody>
              <tr class="hover:bg-black/40 transition-colors border-b border-gray-600/40">
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-300">16 Jan, 08:00</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Reward</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-100">Daily Reward</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="font-semibold text-xs md:text-sm text-green-400">+$5.00</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 hidden sm:table-cell">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Selesai</span>
                </td>
              </tr>
              <tr class="hover:bg-black/40 transition-colors border-b border-gray-600/40">
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-300">15 Jan, 14:30</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="px-2 py-1 bg-blue-500/20 border border-blue-500/50 text-blue-400 rounded text-xs font-medium">Referral</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-100">Referral Token</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="font-semibold text-xs md:text-sm text-blue-400">+$10.00</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 hidden sm:table-cell">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Selesai</span>
                </td>
              </tr>
              <tr class="hover:bg-black/40 transition-colors border-b border-gray-600/40">
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-300">14 Jan, 10:20</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="px-2 py-1 bg-purple-500/20 border border-purple-500/50 text-purple-400 rounded text-xs font-medium">Transfer</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-100">Transfer ke Jane</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="font-semibold text-xs md:text-sm text-red-400">-$10.00</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 hidden sm:table-cell">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Selesai</span>
                </td>
              </tr>
              <tr class="hover:bg-black/40 transition-colors border-b border-gray-600/40">
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-300">10 Jan, 10:15</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="px-2 py-1 bg-purple-500/20 border border-purple-500/50 text-purple-400 rounded text-xs font-medium">Deposit</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-100">Deposit USDT</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="font-semibold text-xs md:text-sm text-green-400">+$1,000.00</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 hidden sm:table-cell">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Selesai</span>
                </td>
              </tr>
              <tr class="hover:bg-black/40 transition-colors border-b border-gray-600/40">
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-300">5 Jan, 09:30</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Reward</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-100">Daily Reward</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="font-semibold text-xs md:text-sm text-green-400">+$1.25</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 hidden sm:table-cell">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Selesai</span>
                </td>
              </tr>
              <tr class="hover:bg-black/40 transition-colors border-b border-gray-600/40">
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-300">5 Jan, 08:00</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="px-2 py-1 bg-purple-500/20 border border-purple-500/50 text-purple-400 rounded text-xs font-medium">Deposit</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-100">Deposit USDT</td>
                <td class="py-3 md:py-4 px-2 md:px-6">
                  <span class="font-semibold text-xs md:text-sm text-green-400">+$250.00</span>
                </td>
                <td class="py-3 md:py-4 px-2 md:px-6 hidden sm:table-cell">
                  <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">Selesai</span>
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
