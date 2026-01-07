<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Staking Management</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola semua staking aktif di platform</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Staking</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-600">$98,500</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Daily Rewards</p>
        <p class="text-2xl md:text-3xl font-bold text-green-600">$492.50</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Active Staking</p>
        <p class="text-2xl md:text-3xl font-bold text-purple-600">850</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Rewards Paid</p>
        <p class="text-2xl md:text-3xl font-bold text-blue-600">$24,625</p>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Search</label>
          <input
            type="text"
            placeholder="Email user"
            class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all"
          />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="">Semua</option>
            <option value="active">Aktif</option>
            <option value="completed">Selesai</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Sort By</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="newest">Terbaru</option>
            <option value="oldest">Terlama</option>
            <option value="amount">Amount Tertinggi</option>
          </select>
        </div>
      </div>
    </div>

    <!-- Staking Table -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50">
            <tr>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">User</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Principal</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Daily Reward</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Total Reward</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Durasi</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Status</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Actions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">john@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$1,000.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-green-600">$5.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-blue-600">$250.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">50 hari</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Aktif</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <button class="px-3 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
                  View
                </button>
              </td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">jane@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$500.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-green-600">$2.50</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-blue-600">$125.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">50 hari</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Aktif</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <button class="px-3 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
                  View
                </button>
              </td>
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

