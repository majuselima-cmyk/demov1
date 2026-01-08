<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Manajemen Staking</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola semua staking aktif di platform</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Staking</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-600">$98,500</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Reward Harian</p>
        <p class="text-2xl md:text-3xl font-bold text-green-600">$492.50</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Staking Aktif</p>
        <p class="text-2xl md:text-3xl font-bold text-purple-600">850</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Reward Dibayar</p>
        <p class="text-2xl md:text-3xl font-bold text-blue-600">$24,625</p>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Cari</label>
          <input
            type="text"
            placeholder="Email pengguna"
            class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all"
          />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
            <option value="">Semua</option>
            <option value="active">Aktif</option>
            <option value="completed">Selesai</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Urutkan</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
            <option value="newest">Terbaru</option>
            <option value="oldest">Terlama</option>
            <option value="amount">Jumlah Tertinggi</option>
          </select>
        </div>
      </div>
    </div>

    <!-- Staking Table -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm overflow-hidden">
      <EasyDataTable
        :headers="headers"
        :items="items"
        :loading="loading"
        buttons-pagination
        show-index
        :rows-per-page="10"
        :rows-items="[10, 20, 50, 100]"
        table-class-name="customize-table"
        header-text-direction="left"
        body-text-direction="left"
      >
        <template #item-dailyReward="{ dailyReward }">
          <span class="text-xs md:text-sm text-green-600">{{ dailyReward }}</span>
        </template>
        <template #item-totalReward="{ totalReward }">
          <span class="text-xs md:text-sm text-blue-600">{{ totalReward }}</span>
        </template>
        <template #item-status="{ status }">
          <span :class="getStatusClass(status)">{{ status }}</span>
        </template>
        <template #item-actions>
          <button class="px-3 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
            Lihat
          </button>
        </template>
      </EasyDataTable>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'admin'
})

const loading = ref(false)

const headers = [
  { text: 'Pengguna', value: 'user', sortable: true },
  { text: 'Pokok', value: 'principal', sortable: true },
  { text: 'Reward Harian', value: 'dailyReward', sortable: true },
  { text: 'Total Reward', value: 'totalReward', sortable: true },
  { text: 'Durasi', value: 'duration', sortable: true },
  { text: 'Status', value: 'status', sortable: true },
  { text: 'Aksi', value: 'actions', sortable: false }
]

const items = ref([
  { user: 'john@example.com', principal: '$1,000.00', dailyReward: '$5.00', totalReward: '$250.00', duration: '50 hari', status: 'Aktif' },
  { user: 'jane@example.com', principal: '$500.00', dailyReward: '$2.50', totalReward: '$125.00', duration: '50 hari', status: 'Aktif' },
  { user: 'bob@example.com', principal: '$2,000.00', dailyReward: '$10.00', totalReward: '$500.00', duration: '50 hari', status: 'Aktif' },
  { user: 'alice@example.com', principal: '$750.00', dailyReward: '$3.75', totalReward: '$187.50', duration: '50 hari', status: 'Aktif' },
  { user: 'charlie@example.com', principal: '$1,500.00', dailyReward: '$7.50', totalReward: '$375.00', duration: '50 hari', status: 'Aktif' },
  { user: 'david@example.com', principal: '$300.00', dailyReward: '$1.50', totalReward: '$75.00', duration: '50 hari', status: 'Aktif' },
  { user: 'emma@example.com', principal: '$900.00', dailyReward: '$4.50', totalReward: '$225.00', duration: '50 hari', status: 'Aktif' },
  { user: 'frank@example.com', principal: '$600.00', dailyReward: '$3.00', totalReward: '$150.00', duration: '50 hari', status: 'Aktif' },
  { user: 'grace@example.com', principal: '$1,200.00', dailyReward: '$6.00', totalReward: '$300.00', duration: '50 hari', status: 'Aktif' },
  { user: 'henry@example.com', principal: '$400.00', dailyReward: '$2.00', totalReward: '$100.00', duration: '50 hari', status: 'Selesai' }
])

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Aktif': 'px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium',
    'Selesai': 'px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs font-medium'
  }
  return classes[status] || 'px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs font-medium'
}
</script>

<style scoped>
:deep(.customize-table) {
  --easy-table-header-font-size: 0.875rem;
  --easy-table-header-height: 3rem;
  --easy-table-header-item-padding: 0 1.5rem;
  --easy-table-body-row-height: 3.5rem;
  --easy-table-body-row-font-size: 0.875rem;
  --easy-table-body-item-padding: 0 1.5rem;
}

:deep(.easy-table-header) {
  background-color: #f9fafb;
}

:deep(.easy-table-body tr:hover) {
  background-color: #f9fafb;
}
</style>

