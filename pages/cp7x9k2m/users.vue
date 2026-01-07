<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">User Management</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola semua user di platform</p>
    </div>

    <!-- Filters & Search -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Search</label>
          <input
            type="text"
            placeholder="Email atau nama"
            class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all"
          />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="">Semua</option>
            <option value="active">Aktif</option>
            <option value="inactive">Tidak Aktif</option>
            <option value="banned">Banned</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Sort By</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all">
            <option value="newest">Terbaru</option>
            <option value="oldest">Terlama</option>
            <option value="balance">Balance Tertinggi</option>
          </select>
        </div>
        <div class="flex items-end">
          <button class="w-full bg-cyan-600 text-white py-2 rounded-lg font-medium text-sm md:text-base hover:bg-cyan-700 transition-colors shadow-md">
            Filter
          </button>
        </div>
      </div>
    </div>

    <!-- Users Table -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50">
            <tr>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">User</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Balance</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Coins</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Tokens</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Status</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Joined</th>
              <th class="text-left py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-700">Actions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <div class="flex items-center space-x-3">
                  <div class="w-10 h-10 bg-cyan-100 rounded-full flex items-center justify-center">
                    <span class="text-cyan-600 font-semibold">JD</span>
                  </div>
                  <div>
                    <p class="text-xs md:text-sm font-medium text-gray-900">John Doe</p>
                    <p class="text-xs text-gray-500">john@example.com</p>
                  </div>
                </div>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$1,250.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-purple-600">1,125.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-green-600">125.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Aktif</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">10 Jan 2024</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <div class="flex items-center gap-2">
                  <button class="px-2 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
                    View
                  </button>
                  <button class="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs font-medium hover:bg-gray-200 transition-colors">
                    Edit
                  </button>
                </div>
              </td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <div class="flex items-center space-x-3">
                  <div class="w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center">
                    <span class="text-purple-600 font-semibold">JS</span>
                  </div>
                  <div>
                    <p class="text-xs md:text-sm font-medium text-gray-900">Jane Smith</p>
                    <p class="text-xs text-gray-500">jane@example.com</p>
                  </div>
                </div>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$500.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-purple-600">450.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-green-600">50.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium">Aktif</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">12 Jan 2024</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <div class="flex items-center gap-2">
                  <button class="px-2 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
                    View
                  </button>
                  <button class="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs font-medium hover:bg-gray-200 transition-colors">
                    Edit
                  </button>
                </div>
              </td>
            </tr>
            <tr class="hover:bg-gray-50 transition-colors">
              <td class="py-3 md:py-4 px-2 md:px-6">
                <div class="flex items-center space-x-3">
                  <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center">
                    <span class="text-blue-600 font-semibold">BJ</span>
                  </div>
                  <div>
                    <p class="text-xs md:text-sm font-medium text-gray-900">Bob Johnson</p>
                    <p class="text-xs text-gray-500">bob@example.com</p>
                  </div>
                </div>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm font-semibold text-gray-900">$300.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-purple-600">270.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-green-600">30.00</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <span class="px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium">Pending</span>
              </td>
              <td class="py-3 md:py-4 px-2 md:px-6 text-xs md:text-sm text-gray-600">8 Jan 2024</td>
              <td class="py-3 md:py-4 px-2 md:px-6">
                <div class="flex items-center gap-2">
                  <button class="px-2 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
                    View
                  </button>
                  <button class="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs font-medium hover:bg-gray-200 transition-colors">
                    Edit
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- Pagination -->
      <div class="px-4 md:px-6 py-4 border-t border-gray-200 flex items-center justify-between">
        <p class="text-xs md:text-sm text-gray-600">Menampilkan 1-10 dari 1,250 users</p>
        <div class="flex items-center gap-2">
          <button class="px-3 py-1 border border-gray-300 rounded text-xs font-medium text-gray-700 hover:bg-gray-50 transition-colors">Previous</button>
          <button class="px-3 py-1 bg-cyan-600 text-white rounded text-xs font-medium">1</button>
          <button class="px-3 py-1 border border-gray-300 rounded text-xs font-medium text-gray-700 hover:bg-gray-50 transition-colors">2</button>
          <button class="px-3 py-1 border border-gray-300 rounded text-xs font-medium text-gray-700 hover:bg-gray-50 transition-colors">Next</button>
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

