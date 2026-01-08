<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Manajemen Pengguna</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola semua user di platform</p>
    </div>

    <!-- Filters & Search -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Cari</label>
          <input
            type="text"
            placeholder="Email atau nama"
            class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all"
          />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
            <option value="">Semua</option>
            <option value="active">Aktif</option>
            <option value="inactive">Tidak Aktif</option>
            <option value="banned">Diblokir</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Urutkan</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
            <option value="newest">Terbaru</option>
            <option value="oldest">Terlama</option>
            <option value="balance">Saldo Tertinggi</option>
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
      <EasyDataTable
        :headers="headers"
        :items="items"
        :search-value="searchValue"
        :loading="loading"
        buttons-pagination
        show-index
        :rows-per-page="10"
        :rows-items="[10, 20, 50, 100]"
        table-class-name="customize-table"
        header-text-direction="left"
        body-text-direction="left"
      >
        <template #item-user="{ name, email, avatar }">
                <div class="flex items-center space-x-3">
                  <div class="w-10 h-10 bg-cyan-100 rounded-full flex items-center justify-center">
              <span class="text-cyan-600 font-semibold text-xs">{{ avatar }}</span>
                  </div>
                  <div>
              <p class="text-xs md:text-sm font-medium text-gray-900">{{ name }}</p>
              <p class="text-xs text-gray-500">{{ email }}</p>
                  </div>
                </div>
        </template>
        <template #item-status="{ status }">
          <span :class="getStatusClass(status)">{{ status }}</span>
        </template>
        <template #item-actions>
                <div class="flex items-center gap-2">
                  <button class="px-2 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium hover:bg-cyan-200 transition-colors">
                    Lihat
                  </button>
                  <button class="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs font-medium hover:bg-gray-200 transition-colors">
                    Edit
                  </button>
                </div>
        </template>
      </EasyDataTable>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'admin'
})

const searchValue = ref('')
const loading = ref(false)

const headers = [
  { text: 'Pengguna', value: 'user', sortable: true },
  { text: 'Saldo', value: 'balance', sortable: true },
  { text: 'Coins', value: 'coins', sortable: true },
  { text: 'Tokens', value: 'tokens', sortable: true },
  { text: 'Status', value: 'status', sortable: true },
  { text: 'Bergabung', value: 'joined', sortable: true },
  { text: 'Aksi', value: 'actions', sortable: false }
]

const items = ref([
  {
    name: 'John Doe',
    email: 'john@example.com',
    avatar: 'JD',
    balance: '$1,250.00',
    coins: '1,125.00',
    tokens: '125.00',
    status: 'Aktif',
    joined: '10 Jan 2024'
  },
  {
    name: 'Jane Smith',
    email: 'jane@example.com',
    avatar: 'JS',
    balance: '$500.00',
    coins: '450.00',
    tokens: '50.00',
    status: 'Aktif',
    joined: '12 Jan 2024'
  },
  {
    name: 'Bob Johnson',
    email: 'bob@example.com',
    avatar: 'BJ',
    balance: '$300.00',
    coins: '270.00',
    tokens: '30.00',
    status: 'Tertunda',
    joined: '8 Jan 2024'
  },
  {
    name: 'Alice Williams',
    email: 'alice@example.com',
    avatar: 'AW',
    balance: '$2,000.00',
    coins: '1,800.00',
    tokens: '200.00',
    status: 'Aktif',
    joined: '15 Jan 2024'
  },
  {
    name: 'Charlie Brown',
    email: 'charlie@example.com',
    avatar: 'CB',
    balance: '$750.00',
    coins: '675.00',
    tokens: '75.00',
    status: 'Aktif',
    joined: '11 Jan 2024'
  },
  {
    name: 'David Lee',
    email: 'david@example.com',
    avatar: 'DL',
    balance: '$1,500.00',
    coins: '1,350.00',
    tokens: '150.00',
    status: 'Aktif',
    joined: '9 Jan 2024'
  },
  {
    name: 'Emma Davis',
    email: 'emma@example.com',
    avatar: 'ED',
    balance: '$900.00',
    coins: '810.00',
    tokens: '90.00',
    status: 'Tertunda',
    joined: '13 Jan 2024'
  },
  {
    name: 'Frank Miller',
    email: 'frank@example.com',
    avatar: 'FM',
    balance: '$600.00',
    coins: '540.00',
    tokens: '60.00',
    status: 'Aktif',
    joined: '7 Jan 2024'
  },
  {
    name: 'Grace Wilson',
    email: 'grace@example.com',
    avatar: 'GW',
    balance: '$1,100.00',
    coins: '990.00',
    tokens: '110.00',
    status: 'Aktif',
    joined: '14 Jan 2024'
  },
  {
    name: 'Henry Taylor',
    email: 'henry@example.com',
    avatar: 'HT',
    balance: '$400.00',
    coins: '360.00',
    tokens: '40.00',
    status: 'Diblokir',
    joined: '6 Jan 2024'
  }
])

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Aktif': 'px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium',
    'Tertunda': 'px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium',
    'Diblokir': 'px-2 py-1 bg-red-100 text-red-700 rounded text-xs font-medium'
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

