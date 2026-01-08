<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Referral</h1>
      <p class="text-sm md:text-base text-gray-400">Kelola referral Anda dan dapatkan komisi</p>
    </div>

    <!-- Referral Code Card -->
    <div class="bg-gradient-to-br from-cyan-500/20 to-blue-600/20 backdrop-blur-xl border border-cyan-500/30 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/20 p-6 md:p-8 mb-4 md:mb-6">
      <h2 class="text-base md:text-xl font-semibold text-gray-100 mb-4">Kode Referral Anda</h2>
      <div class="bg-black/60 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-4 md:p-6 mb-4 shadow-lg shadow-cyan-500/10">
        <p class="text-3xl md:text-4xl font-bold text-center bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent tracking-wider">ABC123XY</p>
      </div>
      <div class="grid grid-cols-2 gap-3 md:gap-4 md:flex md:space-x-4">
        <button class="col-span-1 md:flex-1 bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-3 rounded-lg font-semibold text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30">
          Salin Kode
        </button>
        <button class="col-span-1 md:flex-1 bg-black/40 backdrop-blur-sm border border-cyan-500/30 text-cyan-400 py-2 md:py-3 rounded-lg font-semibold text-sm md:text-base hover:bg-cyan-500/10 hover:border-cyan-400 transition-all duration-200">
          Bagikan Link
        </button>
      </div>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-6 mb-4 md:mb-6">
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Referral</p>
        <p class="text-xl md:text-3xl font-bold text-cyan-400">12</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-green-500/20 rounded-lg md:rounded-xl shadow-lg shadow-green-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Aktif Deposit</p>
        <p class="text-xl md:text-3xl font-bold text-green-400">8</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-blue-500/20 rounded-lg md:rounded-xl shadow-lg shadow-blue-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Komisi</p>
        <p class="text-xl md:text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$50.00</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-orange-500/20 rounded-lg md:rounded-xl shadow-lg shadow-orange-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Withdrawable</p>
        <p class="text-xl md:text-3xl font-bold text-orange-400">$50.00</p>
      </div>
    </div>

    <!-- Referral List -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
      <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Daftar Referral</h2>
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
        <template #item-email="{ email }">
          <span class="text-xs md:text-sm text-gray-400">{{ email }}</span>
        </template>
        <template #item-status="{ status }">
          <span :class="getStatusClass(status)">{{ status }}</span>
        </template>
        <template #item-deposit="{ deposit }">
          <span :class="deposit === '-' ? 'text-xs md:text-sm font-semibold text-gray-400' : 'text-xs md:text-sm font-semibold text-gray-100'">{{ deposit }}</span>
        </template>
        <template #item-commission="{ commission }">
          <span :class="commission === '-' ? 'text-xs md:text-sm font-semibold text-gray-400' : 'text-xs md:text-sm font-semibold text-green-400'">{{ commission }}</span>
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
  { text: 'Nama', value: 'name', sortable: true },
  { text: 'Email', value: 'email', sortable: true },
  { text: 'Status', value: 'status', sortable: true },
  { text: 'Deposit', value: 'deposit', sortable: true },
  { text: 'Komisi', value: 'commission', sortable: true },
  { text: 'Tanggal', value: 'date', sortable: true }
]

const items = ref([
  { name: 'Jane Smith', email: 'jane@example.com', status: 'Aktif', deposit: '$500.00', commission: '$50.00', date: '12 Jan 2024' },
  { name: 'Bob Johnson', email: 'bob@example.com', status: 'Aktif', deposit: '$300.00', commission: '$30.00', date: '8 Jan 2024' },
  { name: 'Alice Williams', email: 'alice@example.com', status: 'Pending', deposit: '-', commission: '-', date: '5 Jan 2024' },
  { name: 'Charlie Brown', email: 'charlie@example.com', status: 'Aktif', deposit: '$200.00', commission: '$20.00', date: '3 Jan 2024' },
  { name: 'David Lee', email: 'david@example.com', status: 'Aktif', deposit: '$400.00', commission: '$40.00', date: '10 Jan 2024' },
  { name: 'Emma Davis', email: 'emma@example.com', status: 'Aktif', deposit: '$150.00', commission: '$15.00', date: '7 Jan 2024' },
  { name: 'Frank Miller', email: 'frank@example.com', status: 'Pending', deposit: '-', commission: '-', date: '6 Jan 2024' },
  { name: 'Grace Wilson', email: 'grace@example.com', status: 'Aktif', deposit: '$250.00', commission: '$25.00', date: '9 Jan 2024' }
])

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Aktif': 'px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium',
    'Pending': 'px-2 py-1 bg-yellow-500/20 border border-yellow-500/50 text-yellow-400 rounded text-xs font-medium'
  }
  return classes[status] || 'px-2 py-1 bg-gray-500/20 border border-gray-500/50 text-gray-400 rounded text-xs font-medium'
}
</script>

<style>
/* Global dark theme override untuk vue3-easy-data-table */
.customize-table-dark {
  --easy-table-header-font-size: 0.875rem;
  --easy-table-header-height: 3rem;
  --easy-table-header-item-padding: 0 1.5rem;
  --easy-table-body-row-height: 3.5rem;
  --easy-table-body-row-font-size: 0.875rem;
  --easy-table-body-item-padding: 0 1.5rem;
  --easy-table-header-background-color: rgba(0, 0, 0, 0.6);
  --easy-table-header-font-color: #d1d5db;
  --easy-table-body-row-font-color: #f3f4f6;
  --easy-table-body-row-hover-background-color: rgba(0, 0, 0, 0.6);
  --easy-table-body-row-background-color: rgba(0, 0, 0, 0.4) !important;
  --easy-table-border-color: rgba(6, 182, 212, 0.2) !important;
  --easy-table-border-width: 0.5px !important;
  background-color: transparent !important;
}

.customize-table-dark * {
  background-color: transparent !important;
}

.customize-table-dark table,
.customize-table-dark table *,
.customize-table-dark th,
.customize-table-dark td,
.customize-table-dark tr,
.customize-table-dark .easy-table-wrapper,
.customize-table-dark .easy-table-wrapper * {
  border-color: rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark .easy-table-header {
  background-color: rgba(0, 0, 0, 0.6) !important;
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
.customize-table-dark .easy-table-body tr:hover .text-gray-400,
.customize-table-dark .easy-table-body tr:hover .text-gray-100 {
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

.customize-table-dark table {
  background-color: transparent !important;
  border: none !important;
  border-collapse: collapse !important;
}

.customize-table-dark thead {
  background-color: rgba(0, 0, 0, 0.6) !important;
  border: none !important;
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

.customize-table-dark tbody td {
  border: none !important;
  border-right: 0.5px solid rgba(6, 182, 212, 0.2) !important;
}

.customize-table-dark tbody td:last-child {
  border-right: none !important;
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
.customize-table-dark tbody tr:hover .text-gray-400,
.customize-table-dark tbody tr:hover .text-gray-100 {
  opacity: 1 !important;
  filter: brightness(1.2) !important;
}
</style>
