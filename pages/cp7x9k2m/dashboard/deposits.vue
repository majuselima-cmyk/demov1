<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Manajemen Deposit</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola dan approve deposit user</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Tertunda</p>
        <p class="text-2xl md:text-3xl font-bold text-yellow-600">$2,500</p>
        <p class="text-gray-500 text-xs mt-2">15 permintaan</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Hari Ini</p>
        <p class="text-2xl md:text-3xl font-bold text-green-600">$5,200</p>
        <p class="text-gray-500 text-xs mt-2">12 deposit</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Bulan Ini</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-600">$45,000</p>
        <p class="text-gray-500 text-xs mt-2">180 deposit</p>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
            <option value="">Semua</option>
            <option value="pending">Tertunda</option>
            <option value="completed">Selesai</option>
            <option value="rejected">Ditolak</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Jaringan</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
            <option value="">Semua</option>
            <option value="tron">TRON (TRC20)</option>
            <option value="erc20">Ethereum (ERC20)</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Dari Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all" />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Sampai Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all" />
        </div>
      </div>
    </div>

    <!-- Deposits Table -->
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
        <template #item-status="{ status }">
          <span :class="getStatusClass(status)">{{ status }}</span>
        </template>
        <template #item-actions="{ status }">
          <div v-if="status === 'Tertunda'" class="flex items-center gap-2">
            <button class="px-3 py-1 bg-green-100 text-green-700 rounded text-xs font-medium hover:bg-green-200 transition-colors">
              Setujui
            </button>
            <button class="px-3 py-1 bg-red-100 text-red-700 rounded text-xs font-medium hover:bg-red-200 transition-colors">
              Tolak
            </button>
          </div>
          <button v-else class="px-3 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
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
  { text: 'Jumlah', value: 'amount', sortable: true },
  { text: 'Jaringan', value: 'network', sortable: true },
  { text: 'Status', value: 'status', sortable: true },
  { text: 'Tanggal', value: 'date', sortable: true },
  { text: 'Aksi', value: 'actions', sortable: false }
]

const items = ref([
  { user: 'john@example.com', amount: '$1,000.00', network: 'TRC20', status: 'Tertunda', date: '16 Jan 2024, 10:30' },
  { user: 'jane@example.com', amount: '$500.00', network: 'ERC20', status: 'Selesai', date: '16 Jan 2024, 09:15' },
  { user: 'bob@example.com', amount: '$250.00', network: 'TRC20', status: 'Selesai', date: '15 Jan 2024, 14:20' },
  { user: 'alice@example.com', amount: '$750.00', network: 'TRC20', status: 'Tertunda', date: '16 Jan 2024, 11:45' },
  { user: 'charlie@example.com', amount: '$300.00', network: 'ERC20', status: 'Selesai', date: '15 Jan 2024, 16:30' },
  { user: 'david@example.com', amount: '$1,200.00', network: 'TRC20', status: 'Ditolak', date: '14 Jan 2024, 09:20' },
  { user: 'emma@example.com', amount: '$400.00', network: 'ERC20', status: 'Selesai', date: '15 Jan 2024, 13:15' },
  { user: 'frank@example.com', amount: '$600.00', network: 'TRC20', status: 'Tertunda', date: '16 Jan 2024, 08:00' },
  { user: 'grace@example.com', amount: '$900.00', network: 'ERC20', status: 'Selesai', date: '14 Jan 2024, 15:45' },
  { user: 'henry@example.com', amount: '$350.00', network: 'TRC20', status: 'Selesai', date: '15 Jan 2024, 10:30' }
])

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Selesai': 'px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium',
    'Tertunda': 'px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium',
    'Ditolak': 'px-2 py-1 bg-red-100 text-red-700 rounded text-xs font-medium'
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

