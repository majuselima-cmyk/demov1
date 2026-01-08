<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">Manajemen Referral</h1>
      <p class="text-sm md:text-base text-gray-600">Kelola sistem referral dan komisi</p>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-4 md:mb-6">
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Referral</p>
        <p class="text-2xl md:text-3xl font-bold text-cyan-600">850</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Referral Aktif</p>
        <p class="text-2xl md:text-3xl font-bold text-green-600">680</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Total Komisi</p>
        <p class="text-2xl md:text-3xl font-bold text-purple-600">$4,250</p>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg md:rounded-xl p-4 md:p-6 shadow-sm">
        <p class="text-gray-600 text-xs md:text-sm mb-2">Bulan Ini</p>
        <p class="text-2xl md:text-3xl font-bold text-blue-600">$850</p>
      </div>
    </div>

    <!-- Referral Tree Table -->
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
        <template #item-commission="{ commission }">
          <span class="text-xs md:text-sm font-semibold text-green-600">{{ commission }}</span>
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
  { text: 'Pemberi Referral', value: 'referrer', sortable: true },
  { text: 'Pengguna Direferensikan', value: 'referred', sortable: true },
  { text: 'Total Deposit', value: 'totalDeposit', sortable: true },
  { text: 'Komisi', value: 'commission', sortable: true },
  { text: 'Status', value: 'status', sortable: true },
  { text: 'Tanggal', value: 'date', sortable: true }
]

const items = ref([
  { referrer: 'john@example.com', referred: 'jane@example.com', totalDeposit: '$500.00', commission: '$50.00', status: 'Aktif', date: '12 Jan 2024' },
  { referrer: 'john@example.com', referred: 'bob@example.com', totalDeposit: '$300.00', commission: '$30.00', status: 'Aktif', date: '8 Jan 2024' },
  { referrer: 'jane@example.com', referred: 'alice@example.com', totalDeposit: '$200.00', commission: '$20.00', status: 'Tertunda', date: '5 Jan 2024' },
  { referrer: 'bob@example.com', referred: 'charlie@example.com', totalDeposit: '$400.00', commission: '$40.00', status: 'Aktif', date: '10 Jan 2024' },
  { referrer: 'alice@example.com', referred: 'david@example.com', totalDeposit: '$600.00', commission: '$60.00', status: 'Aktif', date: '11 Jan 2024' },
  { referrer: 'charlie@example.com', referred: 'emma@example.com', totalDeposit: '$250.00', commission: '$25.00', status: 'Aktif', date: '9 Jan 2024' },
  { referrer: 'david@example.com', referred: 'frank@example.com', totalDeposit: '$350.00', commission: '$35.00', status: 'Tertunda', date: '7 Jan 2024' },
  { referrer: 'emma@example.com', referred: 'grace@example.com', totalDeposit: '$450.00', commission: '$45.00', status: 'Aktif', date: '13 Jan 2024' },
  { referrer: 'frank@example.com', referred: 'henry@example.com', totalDeposit: '$150.00', commission: '$15.00', status: 'Aktif', date: '6 Jan 2024' },
  { referrer: 'grace@example.com', referred: 'john@example.com', totalDeposit: '$800.00', commission: '$80.00', status: 'Aktif', date: '14 Jan 2024' }
])

const getStatusClass = (status: string) => {
  const classes: Record<string, string> = {
    'Aktif': 'px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium',
    'Tertunda': 'px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium'
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

