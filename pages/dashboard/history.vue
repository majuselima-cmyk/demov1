<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Riwayat Transaksi</h1>
      <p class="text-sm md:text-base text-gray-400">Lihat semua transaksi Anda</p>
    </div>

    <!-- Filters -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6 mb-4 md:mb-6">
      <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Tipe</label>
          <select class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200 appearance-none cursor-pointer">
            <option value="" class="bg-gray-900 text-gray-300">Semua</option>
            <option value="deposit" class="bg-gray-900 text-gray-100">Deposit</option>
            <option value="reward" class="bg-gray-900 text-gray-100">Reward</option>
            <option value="referral" class="bg-gray-900 text-gray-100">Referral</option>
            <option value="transfer" class="bg-gray-900 text-gray-100">Transfer</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Status</label>
          <select class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200 appearance-none cursor-pointer">
            <option value="" class="bg-gray-900 text-gray-300">Semua</option>
            <option value="completed" class="bg-gray-900 text-gray-100">Selesai</option>
            <option value="pending" class="bg-gray-900 text-gray-100">Pending</option>
            <option value="failed" class="bg-gray-900 text-gray-100">Gagal</option>
          </select>
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Dari Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200" />
        </div>
        <div>
          <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">Sampai Tgl</label>
          <input type="date" class="w-full px-3 md:px-4 py-2 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200" />
        </div>
      </div>
    </div>

    <!-- Transactions Table -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 overflow-hidden">
      <EasyDataTable
        :headers="headers"
        :items="items"
        :loading="loading"
        buttons-pagination
        show-index
        :rows-per-page="10"
        :rows-items="[10, 20, 50, 100]"
        table-class-name="customize-table-dark"
        header-text-direction="left"
        body-text-direction="left"
        theme-color="#06b6d4"
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
  layout: 'dashboard'
})

const loading = ref(false)

const headers = [
  { text: 'Tanggal', value: 'date', sortable: true },
  { text: 'Tipe', value: 'type', sortable: true },
  { text: 'Deskripsi', value: 'description', sortable: true },
  { text: 'Jumlah', value: 'amount', sortable: true },
  { text: 'Status', value: 'status', sortable: true }
]

const items = ref([
  { date: '16 Jan, 08:00', type: 'Reward', description: 'Daily Reward', amount: '+$5.00', status: 'Selesai' },
  { date: '15 Jan, 14:30', type: 'Referral', description: 'Referral Token', amount: '+$10.00', status: 'Selesai' },
  { date: '14 Jan, 10:20', type: 'Transfer', description: 'Transfer ke Jane', amount: '-$10.00', status: 'Selesai' },
  { date: '10 Jan, 10:15', type: 'Deposit', description: 'Deposit USDT', amount: '+$1,000.00', status: 'Selesai' },
  { date: '5 Jan, 09:30', type: 'Reward', description: 'Daily Reward', amount: '+$1.25', status: 'Selesai' },
  { date: '5 Jan, 08:00', type: 'Deposit', description: 'Deposit USDT', amount: '+$250.00', status: 'Selesai' },
  { date: '4 Jan, 08:00', type: 'Reward', description: 'Daily Reward', amount: '+$5.00', status: 'Selesai' },
  { date: '3 Jan, 14:20', type: 'Withdraw', description: 'Withdraw USDT', amount: '-$200.00', status: 'Selesai' },
  { date: '3 Jan, 08:00', type: 'Reward', description: 'Daily Reward', amount: '+$5.00', status: 'Selesai' },
  { date: '2 Jan, 16:30', type: 'Referral', description: 'Referral Token', amount: '+$15.00', status: 'Selesai' }
])

const getTypeClass = (type: string) => {
  const classes: Record<string, string> = {
    'Reward': 'px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium',
    'Referral': 'px-2 py-1 bg-blue-500/20 border border-blue-500/50 text-blue-400 rounded text-xs font-medium',
    'Deposit': 'px-2 py-1 bg-purple-500/20 border border-purple-500/50 text-purple-400 rounded text-xs font-medium',
    'Withdraw': 'px-2 py-1 bg-orange-500/20 border border-orange-500/50 text-orange-400 rounded text-xs font-medium',
    'Transfer': 'px-2 py-1 bg-purple-500/20 border border-purple-500/50 text-purple-400 rounded text-xs font-medium'
  }
  return classes[type] || 'px-2 py-1 bg-gray-500/20 border border-gray-500/50 text-gray-400 rounded text-xs font-medium'
}

const getAmountClass = (amount: string) => {
  return amount.startsWith('+') 
    ? 'font-semibold text-xs md:text-sm text-green-400'
    : 'font-semibold text-xs md:text-sm text-red-400'
}

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Selesai': 'px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium',
    'Tertunda': 'px-2 py-1 bg-yellow-500/20 border border-yellow-500/50 text-yellow-400 rounded text-xs font-medium',
    'Gagal': 'px-2 py-1 bg-red-500/20 border border-red-500/50 text-red-400 rounded text-xs font-medium'
  }
  return classes[status] || 'px-2 py-1 bg-gray-500/20 border border-gray-500/50 text-gray-400 rounded text-xs font-medium'
}
</script>

<style>
/* Global dark theme override untuk vue3-easy-data-table */
.customize-table-dark {
  --easy-table-header-font-size: 0.875rem !important;
  --easy-table-header-height: 3rem !important;
  --easy-table-header-item-padding: 0 1.5rem !important;
  --easy-table-body-row-height: 3.5rem !important;
  --easy-table-body-row-font-size: 0.875rem !important;
  --easy-table-body-item-padding: 0 1.5rem !important;
  --easy-table-header-background-color: rgba(0, 0, 0, 0.6) !important;
  --easy-table-header-font-color: #d1d5db !important;
  --easy-table-body-row-font-color: #f3f4f6 !important;
  --easy-table-body-row-background-color: rgba(0, 0, 0, 0.4) !important;
  --easy-table-body-row-hover-background-color: rgba(0, 0, 0, 0.6) !important;
  --easy-table-border-color: rgba(6, 182, 212, 0.2) !important;
  background-color: transparent !important;
}

.customize-table-dark * {
  background-color: transparent !important;
}

.customize-table-dark table {
  border: none !important;
  border-collapse: collapse !important;
}

/* Force remove all white borders */
.customize-table-dark table,
.customize-table-dark table *,
.customize-table-dark th,
.customize-table-dark td,
.customize-table-dark tr {
  border-color: rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark .easy-table-wrapper,
.customize-table-dark .easy-table-wrapper * {
  border-color: rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark .easy-table-header {
  background-color: rgba(0, 0, 0, 0.6) !important;
  border: none !important;
  border-bottom: 0.5px solid rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark .easy-table-header th {
  color: #d1d5db !important;
  font-weight: 600 !important;
  background-color: rgba(0, 0, 0, 0.6) !important;
  border: none !important;
  border-right: 0.5px solid rgba(6, 182, 212, 0.2) !important;
  border-bottom: 0.5px solid rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark .easy-table-header th:last-child {
  border-right: none !important;
}

.customize-table-dark .easy-table-body {
  background-color: transparent !important;
}

.customize-table-dark .easy-table-body tr {
  border-bottom: 0.5px solid rgba(6, 182, 212, 0.2) !important;
  background-color: rgba(0, 0, 0, 0.4) !important;
  border-left: 2px solid transparent !important;
  transition: all 0.2s ease !important;
}

.customize-table-dark .easy-table-body tr:nth-child(even) {
  background-color: rgba(0, 0, 0, 0.3) !important;
}

.customize-table-dark .easy-table-body tr:hover {
  background-color: rgba(6, 182, 212, 0.15) !important;
  border-left: 2px solid rgba(6, 182, 212, 0.5) !important;
  transition: all 0.2s ease !important;
}

.customize-table-dark .easy-table-body tr:hover td {
  color: #f3f4f6 !important;
}

.customize-table-dark .easy-table-body tr:hover td span,
.customize-table-dark .easy-table-body tr:hover td p {
  color: inherit !important;
}

/* Keep colored badges and text visible on hover */
.customize-table-dark .easy-table-body tr:hover td span.px-2 {
  opacity: 1 !important;
}

.customize-table-dark .easy-table-body tr:hover .text-green-400,
.customize-table-dark .easy-table-body tr:hover .text-red-400,
.customize-table-dark .easy-table-body tr:hover .text-blue-400 {
  opacity: 1 !important;
  filter: brightness(1.2) !important;
}

.customize-table-dark .easy-table-body td {
  color: #f3f4f6 !important;
  background-color: inherit !important;
  border: none !important;
  border-right: 0.5px solid rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark .easy-table-body td:last-child {
  border-right: none !important;
}

.customize-table-dark .easy-table-pagination {
  background-color: rgba(0, 0, 0, 0.6) !important;
  color: #d1d5db !important;
  border-top: 0.5px solid rgba(6, 182, 212, 0.2) !important;
  padding: 1rem !important;
}

.customize-table-dark .easy-table-pagination button {
  color: #d1d5db !important;
  background-color: rgba(0, 0, 0, 0.4) !important;
  border: 0.5px solid rgba(6, 182, 212, 0.3) !important;
  border-radius: 0.5rem !important;
}

.customize-table-dark .easy-table-pagination button:hover:not([disabled]) {
  background-color: rgba(6, 182, 212, 0.2) !important;
  border-color: rgba(6, 182, 212, 0.5) !important;
  color: #22d3ee !important;
}

.customize-table-dark .easy-table-pagination button[disabled] {
  opacity: 0.5 !important;
  cursor: not-allowed !important;
}

.customize-table-dark .easy-table-pagination select {
  background-color: rgba(0, 0, 0, 0.4) !important;
  color: #d1d5db !important;
  border: 0.5px solid rgba(6, 182, 212, 0.3) !important;
  border-radius: 0.5rem !important;
  padding: 0.5rem !important;
}

.customize-table-dark .easy-table-index {
  color: #9ca3af !important;
  background-color: transparent !important;
}

.customize-table-dark .easy-table-index-header {
  background-color: rgba(0, 0, 0, 0.6) !important;
  color: #9ca3af !important;
  border-right: 0.5px solid rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark .easy-table-sort-icon {
  color: #6b7280 !important;
}

.customize-table-dark .easy-table-sort-icon:hover {
  color: #22d3ee !important;
}

/* Override untuk semua elemen table */
.customize-table-dark table {
  background-color: transparent !important;
  border: none !important;
  border-collapse: collapse !important;
}

.customize-table-dark thead {
  background-color: rgba(0, 0, 0, 0.6) !important;
  border: none !important;
}

.customize-table-dark thead th {
  border: none !important;
  border-right: 0.5px solid rgba(6, 182, 212, 0.2) !important;
  border-bottom: 0.5px solid rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark thead th:last-child {
  border-right: none !important;
}

.customize-table-dark tbody {
  background-color: transparent !important;
  border: none !important;
}

.customize-table-dark tbody tr {
  background-color: rgba(0, 0, 0, 0.4) !important;
  border: none !important;
  border-bottom: 0.5px solid rgba(6, 182, 212, 0.2) !important;
  border-left: 2px solid transparent !important;
  transition: all 0.2s ease !important;
}

.customize-table-dark tbody tr:nth-child(even) {
  background-color: rgba(0, 0, 0, 0.3) !important;
}

.customize-table-dark tbody tr:hover {
  background-color: rgba(6, 182, 212, 0.15) !important;
  border-left: 2px solid rgba(6, 182, 212, 0.5) !important;
  transition: all 0.2s ease !important;
}

.customize-table-dark tbody tr:hover td {
  color: #f3f4f6 !important;
}

.customize-table-dark tbody tr:hover td span,
.customize-table-dark tbody tr:hover td p {
  color: inherit !important;
}

/* Keep colored badges and text visible on hover */
.customize-table-dark tbody tr:hover td span.px-2 {
  opacity: 1 !important;
}

.customize-table-dark tbody tr:hover .text-green-400,
.customize-table-dark tbody tr:hover .text-red-400,
.customize-table-dark tbody tr:hover .text-blue-400 {
  opacity: 1 !important;
  filter: brightness(1.2) !important;
}

.customize-table-dark tbody td {
  border: none !important;
  border-right: 0.5px solid rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark tbody td:last-child {
  border-right: none !important;
}
</style>
