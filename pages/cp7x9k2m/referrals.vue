<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Referral Management</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola sistem referral dan komisi</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Referrals</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-600">850</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Active Referrals</p>
        <p class="text-2xl md:text-3xl font-bold text-green-600">680</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Komisi</p>
        <p class="text-2xl md:text-3xl font-bold text-purple-600">$4,250</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">This Month</p>
        <p class="text-2xl md:text-3xl font-bold text-blue-600">$850</p>
      </div>
    </div>

    <!-- Referral Tree Table -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50">
            <tr>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Referrer</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Referred User</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Total Deposit</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Komisi</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Status</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Tanggal</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">john@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm text-gray-900">jane@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$500.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-green-600">$50.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Aktif</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">12 Jan 2024</td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">john@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm text-gray-900">bob@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$300.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-green-600">$30.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Aktif</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">8 Jan 2024</td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm font-medium text-gray-900">jane@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <p class="text-xs md:text-sm text-gray-900">alice@example.com</p>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$200.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-green-600">$20.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium">Pending</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">5 Jan 2024</td>
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

