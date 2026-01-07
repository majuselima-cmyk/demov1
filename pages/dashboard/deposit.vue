<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Deposit</h1>
      <p class="text-sm md:text-base text-gray-400">Deposit minimal $10 USDT untuk mulai staking</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Deposit Form -->
      <div class="lg:col-span-2">
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Form Deposit</h2>
          <form @submit.prevent="handleDeposit" class="space-y-4 md:space-y-6">
            <div>
              <label for="amount" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Jumlah Deposit (USDT)
              </label>
              <input
                id="amount"
                v-model="form.amount"
                type="number"
                min="10"
                step="0.01"
                required
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
                placeholder="10.00"
              />
              <p class="mt-1 text-xs text-gray-400">Minimum deposit: $10.00 USDT</p>
            </div>

            <div>
              <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Metode Pembayaran
              </label>
              <div class="space-y-2">
                <label class="flex items-start md:items-center p-3 md:p-4 border-2 border-cyan-500/50 rounded-lg cursor-pointer bg-cyan-500/10 hover:bg-cyan-500/20 transition-all duration-200">
                  <input type="radio" v-model="form.paymentMethod" value="usdt-tron" class="mr-3 mt-1 md:mt-0 flex-shrink-0" checked />
                  <div class="flex-1">
                    <p class="font-medium text-sm md:text-base text-gray-100">USDT (TRON Network)</p>
                    <p class="text-xs text-gray-400">TRC20</p>
                  </div>
                </label>
                <label class="flex items-start md:items-center p-3 md:p-4 border border-cyan-500/30 rounded-lg cursor-pointer bg-black/20 hover:bg-cyan-500/10 transition-all duration-200">
                  <input type="radio" v-model="form.paymentMethod" value="usdt-erc20" class="mr-3 mt-1 md:mt-0 flex-shrink-0" />
                  <div class="flex-1">
                    <p class="font-medium text-sm md:text-base text-gray-100">USDT (Ethereum Network)</p>
                    <p class="text-xs text-gray-400">ERC20</p>
                  </div>
                </label>
              </div>
            </div>

            <div class="bg-cyan-500/10 border border-cyan-500/30 rounded-lg p-3 md:p-4">
              <p class="text-xs md:text-sm text-cyan-400 mb-2">
                <strong>Informasi:</strong> Setelah deposit dikonfirmasi, Anda akan mendapatkan:
              </p>
              <ul class="text-xs md:text-sm text-gray-400 space-y-1 ml-4 list-disc">
                <li>90% sebagai Coins</li>
                <li>10% sebagai Tokens</li>
                <li>Staking otomatis dimulai dengan rate 0.5% per hari</li>
              </ul>
            </div>

            <button
              type="submit"
              :disabled="loading"
              class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-3 rounded-lg font-semibold text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 shadow-lg shadow-cyan-500/30"
            >
              {{ loading ? 'Memproses...' : 'Lanjutkan Deposit' }}
            </button>
          </form>
        </div>
      </div>

      <!-- Deposit Info -->
      <div class="space-y-4 md:space-y-6">
        <!-- Current Balance -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Saldo Saat Ini</h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs md:text-sm text-gray-400 mb-1">Total Balance</p>
              <p class="text-xl md:text-2xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$1,250.00</p>
            </div>
            <div class="pt-3 border-t border-cyan-500/20">
              <p class="text-xs md:text-sm text-gray-400 mb-1">Coins</p>
              <p class="text-lg md:text-xl font-semibold text-purple-400">1,125.00</p>
            </div>
            <div>
              <p class="text-xs md:text-sm text-gray-400 mb-1">Tokens</p>
              <p class="text-lg md:text-xl font-semibold text-green-400">125.00</p>
            </div>
          </div>
        </div>

        <!-- Recent Deposits -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Deposit Terkini</h3>
          <div class="space-y-2 md:space-y-3">
            <div class="flex items-center justify-between p-3 bg-black/40 backdrop-blur-sm border border-green-500/20 rounded-lg">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm md:text-base text-gray-100">$1,000.00</p>
                <p class="text-xs text-gray-400">10 Jan 2024</p>
              </div>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium flex-shrink-0 ml-2">
                Selesai
              </span>
            </div>
            <div class="flex items-center justify-between p-3 bg-black/40 backdrop-blur-sm border border-green-500/20 rounded-lg">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm md:text-base text-gray-100">$250.00</p>
                <p class="text-xs text-gray-400">5 Jan 2024</p>
              </div>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium flex-shrink-0 ml-2">
                Selesai
              </span>
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
  amount: '',
  paymentMethod: 'usdt-tron'
})

const loading = ref(false)

const handleDeposit = () => {
  if (parseFloat(form.value.amount) < 10) {
    alert('Minimum deposit adalah $10')
    return
  }

  loading.value = true
  setTimeout(() => {
    loading.value = false
    alert('Deposit berhasil! Silakan lanjutkan pembayaran.')
  }, 1500)
}
</script>
