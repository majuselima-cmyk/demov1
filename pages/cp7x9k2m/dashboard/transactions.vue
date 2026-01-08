<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Manajemen Transaksi</h1>
      <p class="text-sm md:text-base text-gray-600">Lihat semua transaksi di platform</p>
    </div>

    <!-- Filters -->
    <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl shadow-sm p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-700 mb-2">Tipe</label>
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
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
          <select class="w-full px-3 md:px-4 py-2 border border-gray-300 rounded-lg text-sm md:text-base focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-600 hover:border-cyan-400 transition-all bg-white">
            <option value="">Semua</option>
            <option value="completed">Selesai</option>
            <option value="pending">Tertunda</option>
            <option value="failed">Gagal</option>
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

    <!-- Transactions Table -->
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
        <template #item-type="{ type }">
          <span :class="getTypeClass(type)">{{ type }}</span>
        </template>
        <template #item-amount="{ amount }">
          <span :class="getAmountClass(amount)">{{ amount }}</span>
        </template>
        <template #item-status="{ status }">
          <span :class="getStatusClass(status)">{{ status }}</span>
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
  { text: 'Tipe', value: 'type', sortable: true },
  { text: 'Deskripsi', value: 'description', sortable: true },
  { text: 'Jumlah', value: 'amount', sortable: true },
  { text: 'Status', value: 'status', sortable: true },
  { text: 'Tanggal', value: 'date', sortable: true }
]

const items = ref([
  { user: 'john@example.com', type: 'Reward', description: 'Reward Harian', amount: '+$5.00', status: 'Selesai', date: '16 Jan, 08:00' },
  { user: 'jane@example.com', type: 'Referral', description: 'Token Referral', amount: '+$10.00', status: 'Selesai', date: '15 Jan, 14:30' },
  { user: 'bob@example.com', type: 'Deposit', description: 'Deposit USDT', amount: '+$1,000.00', status: 'Selesai', date: '10 Jan, 10:15' },
  { user: 'alice@example.com', type: 'Withdraw', description: 'Withdraw USDT', amount: '-$200.00', status: 'Selesai', date: '16 Jan, 11:00' },
  { user: 'charlie@example.com', type: 'Reward', description: 'Reward Harian', amount: '+$5.00', status: 'Selesai', date: '16 Jan, 08:00' },
  { user: 'david@example.com', type: 'Referral', description: 'Token Referral', amount: '+$15.00', status: 'Selesai', date: '15 Jan, 12:20' },
  { user: 'emma@example.com', type: 'Deposit', description: 'Deposit USDT', amount: '+$500.00', status: 'Tertunda', date: '16 Jan, 09:30' },
  { user: 'frank@example.com', type: 'Transfer', description: 'Transfer Token', amount: '-$50.00', status: 'Selesai', date: '15 Jan, 15:45' },
  { user: 'grace@example.com', type: 'Reward', description: 'Reward Harian', amount: '+$5.00', status: 'Selesai', date: '16 Jan, 08:00' },
  { user: 'henry@example.com', type: 'Withdraw', description: 'Withdraw USDT', amount: '-$100.00', status: 'Gagal', date: '14 Jan, 10:20' }
])

const getTypeClass = (type: string) => {
  const classes: Record<string, string> = {
    'Reward': 'px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium',
    'Referral': 'px-2 py-1 bg-blue-100 text-blue-700 rounded text-xs font-medium',
    'Deposit': 'px-2 py-1 bg-purple-100 text-purple-700 rounded text-xs font-medium',
    'Withdraw': 'px-2 py-1 bg-orange-100 text-orange-700 rounded text-xs font-medium',
    'Transfer': 'px-2 py-1 bg-cyan-100 text-cyan-700 rounded text-xs font-medium'
  }
  return classes[type] || 'px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs font-medium'
}

const getAmountClass = (amount: string) => {
  return amount.startsWith('+') 
    ? 'font-semibold text-xs md:text-sm text-green-600'
    : 'font-semibold text-xs md:text-sm text-red-600'
}

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Selesai': 'px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium',
    'Tertunda': 'px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium',
    'Gagal': 'px-2 py-1 bg-red-100 text-red-700 rounded text-xs font-medium'
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

