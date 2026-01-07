<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Withdraw Management</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola dan approve withdraw user</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Pending</p>
        <p class="text-2xl md:text-3xl font-bold text-orange-600">$2,500</p>
        <p class="text-gray-500 text-xs mt-2">12 requests</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Today</p>
        <p class="text-2xl md:text-3xl font-bold text-green-600">$1,800</p>
        <p class="text-gray-500 text-xs mt-2">8 processed</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">This Month</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-600">$18,500</p>
        <p class="text-gray-500 text-xs mt-2">95 withdraws</p>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="">Semua</option>
            <option value="pending">Pending</option>
            <option value="processing">Processing</option>
            <option value="completed">Selesai</option>
            <option value="rejected">Ditolak</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Network</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="">Semua</option>
            <option value="tron">TRON (TRC20)</option>
            <option value="erc20">Ethereum (ERC20)</option>
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

    <!-- Withdraws Table -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50">
            <tr>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">User</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Amount</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Wallet</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Network</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Status</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Tanggal</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Actions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">alice@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$200.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs text-gray-600 font-mono">Txxxxxxxxxxxxx</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">TRC20</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium">Pending</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">16 Jan 2024, 11:00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <div class="flex items-center gap-2">
                  <button class="px-3 py-1 bg-green-100 text-green-700 rounded text-xs font-medium hover:bg-green-200 transition-colors">
                    Approve
                  </button>
                  <button class="px-3 py-1 bg-red-100 text-red-700 rounded text-xs font-medium hover:bg-red-200 transition-colors">
                    Reject
                  </button>
                </div>
              </td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">charlie@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$150.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs text-gray-600 font-mono">0xxxxxxxxxxxxx</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">ERC20</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs font-medium">Processing</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">15 Jan 2024, 16:45</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <button class="px-3 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
                  View
                </button>
              </td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">david@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$100.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs text-gray-600 font-mono">Txxxxxxxxxxxxx</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">TRC20</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Selesai</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">14 Jan 2024, 09:30</td>
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

