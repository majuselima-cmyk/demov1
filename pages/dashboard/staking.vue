<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Staking</h1>
      <p class="text-sm md:text-base text-gray-400">Kelola staking Anda dan lihat reward harian</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Staking</p>
        <p class="text-2xl md:text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$1,000.00</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-green-500/20 rounded-lg md:rounded-xl shadow-lg shadow-green-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Daily Reward</p>
        <p class="text-2xl md:text-3xl font-bold text-green-400">$5.00</p>
        <p class="text-xs text-gray-400 mt-1">0.5% per hari</p>
      </div>
      <div class="bg-black/60 backdrop-blur-xl border border-blue-500/20 rounded-lg md:rounded-xl shadow-lg shadow-blue-500/10 p-4 md:p-6">
        <p class="text-xs md:text-sm text-gray-400 mb-2">Total Reward</p>
        <p class="text-2xl md:text-3xl font-bold text-blue-400">$250.00</p>
      </div>
    </div>

    <!-- Active Staking List -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6 mb-4 md:mb-6">
      <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Staking Aktif</h2>
      <div class="space-y-4">
        <div class="bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-4 md:p-6 shadow-lg shadow-cyan-500/5">
          <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 mb-4">
            <div class="flex-1 min-w-0">
              <p class="font-semibold text-sm md:text-base text-gray-100">Staking #001</p>
              <p class="text-xs md:text-sm text-gray-400">Dimulai: 10 Jan 2024, 10:15</p>
            </div>
            <span class="px-3 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded-full text-xs font-medium w-fit shadow-lg shadow-green-500/20">
              Aktif
            </span>
          </div>
          <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4 mb-4">
            <div>
              <p class="text-xs text-gray-400 mb-1">Principal</p>
              <p class="text-base md:text-lg font-semibold text-gray-100">$1,000.00</p>
            </div>
            <div>
              <p class="text-xs text-gray-400 mb-1">Daily Rate</p>
              <p class="text-base md:text-lg font-semibold text-gray-100">0.5%</p>
            </div>
            <div>
              <p class="text-xs text-gray-400 mb-1">Daily Reward</p>
              <p class="text-base md:text-lg font-semibold text-green-400">$5.00</p>
            </div>
            <div>
              <p class="text-xs text-gray-400 mb-1">Total Reward</p>
              <p class="text-base md:text-lg font-semibold text-blue-400">$250.00</p>
            </div>
          </div>
          <div class="pt-3 md:pt-4 border-t border-cyan-500/20">
            <div class="flex items-center justify-between text-xs md:text-sm">
              <span class="text-gray-400">Durasi</span>
              <span class="font-semibold text-cyan-400">50 hari</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Reward History -->
    <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
      <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Riwayat Reward</h2>
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
        <template #item-reward="{ reward }">
          <span class="text-xs md:text-sm font-semibold text-gray-100">{{ reward }}</span>
        </template>
        <template #item-coins="{ coins }">
          <span class="text-xs md:text-sm text-green-400">{{ coins }}</span>
        </template>
        <template #item-tokens="{ tokens }">
          <span class="text-xs md:text-sm text-blue-400">{{ tokens }}</span>
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
  { text: 'Reward', value: 'reward', sortable: true },
  { text: 'Coins', value: 'coins', sortable: true },
  { text: 'Tokens', value: 'tokens', sortable: true },
  { text: 'Status', value: 'status', sortable: true }
]

const items = ref([
  { date: '16 Jan, 08:00', reward: '$5.00', coins: '+$4.50', tokens: '+$0.50', status: 'Selesai' },
  { date: '15 Jan, 08:00', reward: '$5.00', coins: '+$4.50', tokens: '+$0.50', status: 'Selesai' },
  { date: '14 Jan, 08:00', reward: '$5.00', coins: '+$4.50', tokens: '+$0.50', status: 'Selesai' },
  { date: '13 Jan, 08:00', reward: '$5.00', coins: '+$4.50', tokens: '+$0.50', status: 'Selesai' },
  { date: '12 Jan, 08:00', reward: '$5.00', coins: '+$4.50', tokens: '+$0.50', status: 'Selesai' },
  { date: '11 Jan, 08:00', reward: '$5.00', coins: '+$4.50', tokens: '+$0.50', status: 'Selesai' },
  { date: '10 Jan, 08:00', reward: '$5.00', coins: '+$4.50', tokens: '+$0.50', status: 'Selesai' },
  { date: '9 Jan, 08:00', reward: '$1.25', coins: '+$1.13', tokens: '+$0.12', status: 'Selesai' },
  { date: '8 Jan, 08:00', reward: '$1.25', coins: '+$1.13', tokens: '+$0.12', status: 'Selesai' },
  { date: '7 Jan, 08:00', reward: '$1.25', coins: '+$1.13', tokens: '+$0.12', status: 'Selesai' }
])

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Selesai': 'px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium',
    'Tertunda': 'px-2 py-1 bg-yellow-500/20 border border-yellow-500/50 text-yellow-400 rounded text-xs font-medium'
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
.customize-table-dark .easy-table-body tr:hover .text-blue-400,
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
.customize-table-dark tbody tr:hover .text-blue-400,
.customize-table-dark tbody tr:hover .text-gray-100 {
  opacity: 1 !important;
  filter: brightness(1.2) !important;
}
</style>
