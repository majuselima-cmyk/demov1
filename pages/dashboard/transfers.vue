<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Transfer Token</h1>
      <p class="text-sm md:text-base text-gray-400">Transfer token ke referral di bawah Anda</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Transfer Form -->
      <div class="lg:col-span-2">
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Form Transfer</h2>
          <form @submit.prevent="handleTransfer" class="space-y-4 md:space-y-6">
            <div>
              <label for="recipient" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Penerima (Referral)
              </label>
              <select
                id="recipient"
                v-model="form.recipient"
                required
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
              >
                <option value="">Pilih referral</option>
                <option value="jane">Jane Smith (jane@example.com)</option>
                <option value="bob">Bob Johnson (bob@example.com)</option>
                <option value="charlie">Charlie Brown (charlie@example.com)</option>
              </select>
              <p class="mt-1 text-xs text-gray-400">Hanya referral yang sudah deposit dapat menerima token</p>
            </div>

            <div>
              <label for="amount" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Jumlah Token
              </label>
              <input
                id="amount"
                v-model="form.amount"
                type="number"
                min="0.01"
                step="0.01"
                required
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
                placeholder="0.00"
              />
            </div>

            <div class="bg-cyan-500/10 border border-cyan-500/30 rounded-lg p-3 md:p-4">
              <p class="text-xs md:text-sm text-cyan-400 mb-2">
                <strong>Informasi:</strong>
              </p>
              <ul class="text-xs md:text-sm text-gray-400 space-y-1 ml-4 list-disc">
                <li>Token hanya dapat ditransfer ke referral di bawah Anda</li>
                <li>Penerima harus sudah melakukan deposit</li>
                <li>Transfer tidak dapat dibatalkan</li>
              </ul>
            </div>

            <button
              type="submit"
              :disabled="loading"
              class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-3 rounded-lg font-semibold text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 shadow-lg shadow-cyan-500/30"
            >
              {{ loading ? 'Memproses...' : 'Transfer Token' }}
            </button>
          </form>
        </div>
      </div>

      <!-- Info Sidebar -->
      <div class="space-y-4 md:space-y-6">
        <!-- Token Balance -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Saldo Token</h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs md:text-sm text-gray-400 mb-1">Total Tokens</p>
              <p class="text-xl md:text-2xl font-bold text-gray-100">125.00</p>
            </div>
            <div class="pt-3 border-t border-cyan-500/20">
              <p class="text-xs md:text-sm text-gray-400 mb-1">Available</p>
              <p class="text-lg md:text-xl font-semibold text-green-400">75.00</p>
            </div>
            <div>
              <p class="text-xs md:text-sm text-gray-400 mb-1">Withdrawable</p>
              <p class="text-lg md:text-xl font-semibold text-orange-400">50.00</p>
            </div>
          </div>
        </div>

        <!-- Recent Transfers -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Transfer Terkini</h3>
          <div class="space-y-2 md:space-y-3">
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2 p-3 bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-lg">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm md:text-base text-gray-100">Ke: Jane Smith</p>
                <p class="text-xs text-gray-400">14 Jan 2024</p>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-base text-cyan-400">-10.00</p>
                <p class="text-xs text-gray-400">Tokens</p>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2 p-3 bg-black/40 backdrop-blur-sm border border-cyan-500/20 rounded-lg">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm md:text-base text-gray-100">Ke: Bob Johnson</p>
                <p class="text-xs text-gray-400">12 Jan 2024</p>
              </div>
              <div class="text-right">
                <p class="font-semibold text-xs md:text-base text-cyan-400">-5.00</p>
                <p class="text-xs text-gray-400">Tokens</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'dashboard'
})

const form = ref({
  recipient: '',
  amount: ''
})

const loading = ref(false)

const handleTransfer = () => {
  if (!form.value.recipient) {
    alert('Pilih penerima terlebih dahulu')
    return
  }

  if (parseFloat(form.value.amount) <= 0) {
    alert('Jumlah harus lebih dari 0')
    return
  }

  loading.value = true
  setTimeout(() => {
    loading.value = false
    alert('Transfer berhasil!')
    form.value.recipient = ''
    form.value.amount = ''
  }, 1500)
}
</script>
