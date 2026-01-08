<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Pengaturan Platform</h1>
      <p class="text-sm md:text-base text-gray-600">Konfigurasi platform dan sistem</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Main Settings -->
      <div class="lg:col-span-2 space-y-4 md:space-y-6">
        <!-- Staking Settings -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Pengaturan Staking</h3>
          <div class="space-y-4">
            <div>
              <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Tingkat Reward Harian (%)</label>
              <input
                type="number"
                step="0.01"
                value="0.5"
                class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all"
              />
            </div>
            <div>
              <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Deposit Minimum (USDT)</label>
              <input
                type="number"
                step="0.01"
                value="10"
                class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all"
              />
            </div>
            <button class="w-full bg-cyan-600 text-white py-2 rounded-lg font-medium text-sm md:text-base hover:bg-cyan-700 transition-colors shadow-md">
              Simpan Perubahan
            </button>
          </div>
        </div>

        <!-- Allocation Settings -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Pengaturan Alokasi</h3>
          <div class="space-y-4">
            <div>
              <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Alokasi Coins (%)</label>
              <input
                type="number"
                step="0.1"
                value="90"
                class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all"
              />
            </div>
            <div>
              <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Alokasi Tokens (%)</label>
              <input
                type="number"
                step="0.1"
                value="10"
                class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all"
              />
            </div>
            <button class="w-full bg-cyan-600 text-white py-2 rounded-lg font-medium text-sm md:text-base hover:bg-cyan-700 transition-colors shadow-md">
              Simpan Perubahan
            </button>
          </div>
        </div>

        <!-- Referral Settings -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Pengaturan Referral</h3>
          <div class="space-y-4">
            <div>
              <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Komisi Referral (%)</label>
              <input
                type="number"
                step="0.1"
                value="10"
                class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all"
              />
            </div>
            <div class="flex items-center">
              <input
                type="checkbox"
                id="referralActive"
                checked
                class="w-4 h-4 text-cyan-600 border-gray-300 rounded focus:ring-cyan-500"
              />
              <label for="referralActive" class="ml-2 block text-sm text-gray-700">
                Aktifkan sistem referral
              </label>
            </div>
            <button class="w-full bg-cyan-600 text-white py-2 rounded-lg font-medium text-sm md:text-base hover:bg-cyan-700 transition-colors shadow-md">
              Simpan Perubahan
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar -->
      <div class="space-y-4 md:space-y-6">
        <!-- System Info -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Info Sistem</h3>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Platform Version</span>
              <span class="text-xs md:text-sm font-medium text-gray-900">v1.0.0</span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Last Update</span>
              <span class="text-xs md:text-sm text-gray-900">16 Jan 2024</span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Database</span>
              <span class="text-xs md:text-sm text-gray-900">MySQL 8.0</span>
            </div>
          </div>
        </div>

        <!-- Maintenance Mode -->
        <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-900 mb-4">Pemeliharaan</h3>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-600">Mode Pemeliharaan</span>
              <label class="relative inline-flex items-center cursor-pointer">
                <input type="checkbox" class="sr-only peer" />
                <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-cyan-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-cyan-600"></div>
              </label>
            </div>
            <button class="w-full bg-red-600 text-white py-2 rounded-lg font-medium text-sm md:text-base hover:bg-red-700 transition-colors shadow-md">
              Aktifkan Pemeliharaan
            </button>
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

