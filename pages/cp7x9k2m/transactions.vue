<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Transaction Management</h1>
      <p class="text-sm md:text-base text-gray-600">Lihat semua transaksi di platform</p>
    </div>

    <!-- Filters -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Tipe</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="">Semua</option>
            <option value="deposit">Deposit</option>
            <option value="withdraw">Withdraw</option>
            <option value="reward">Reward</option>
            <option value="referral">Referral</option>
            <option value="transfer">Transfer</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="">Semua</option>
            <option value="completed">Selesai</option>
            <option value="pending">Pending</option>
            <option value="failed">Gagal</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Dari Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all" />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Sampai Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all" />
        </div>
      </div>
    </div>

    <!-- Transactions Table -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50">
            <tr>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">User</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Tipe</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Deskripsi</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Jumlah</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Status</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Tanggal</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-900">john@example.com</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Reward</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-900">Daily Reward</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="font-semibold text-xs md:text-sm text-green-600">+$5.00</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Selesai</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">16 Jan, 08:00</td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-900">jane@example.com</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs font-medium">Referral</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-900">Referral Token</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="font-semibold text-xs md:text-sm text-blue-600">+$10.00</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Selesai</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">15 Jan, 14:30</td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-900">bob@example.com</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-purple-100 text-purple-700 rounded text-xs font-medium">Deposit</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-900">Deposit USDT</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="font-semibold text-xs md:text-sm text-green-600">+$1,000.00</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Selesai</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">10 Jan, 10:15</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'admin'
})
</script>

