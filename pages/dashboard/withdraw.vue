<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Withdraw USDT</h1>
      <p class="text-sm md:text-base text-gray-400">Tarik dana USDT ke wallet Anda</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Withdraw Form -->
      <div class="lg:col-span-2">
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h2 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Form Withdraw</h2>
          <form @submit.prevent="handleWithdraw" class="space-y-4 md:space-y-6">
            <div>
              <label for="amount" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Jumlah Withdraw (USDT)
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
              <p class="mt-1 text-xs text-gray-400">Minimum withdraw: $10.00 USDT</p>
            </div>

            <div>
              <label for="walletAddress" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Alamat Wallet USDT
              </label>
              <input
                id="walletAddress"
                v-model="form.walletAddress"
                type="text"
                required
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
                placeholder="Masukkan alamat wallet USDT"
              />
            </div>

            <div>
              <label class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Network
              </label>
              <div class="space-y-2">
                <label class="flex items-start md:items-center p-3 md:p-4 border-2 border-cyan-500/50 rounded-lg cursor-pointer bg-cyan-500/10 hover:bg-cyan-500/20 transition-all duration-200">
                  <input type="radio" v-model="form.network" value="tron" class="mr-3 mt-1 md:mt-0 flex-shrink-0" checked />
                  <div class="flex-1">
                    <p class="font-medium text-sm md:text-base text-gray-100">USDT (TRON Network)</p>
                    <p class="text-xs text-gray-400">TRC20</p>
                  </div>
                </label>
                <label class="flex items-start md:items-center p-3 md:p-4 border border-cyan-500/30 rounded-lg cursor-pointer bg-black/20 hover:bg-cyan-500/10 transition-all duration-200">
                  <input type="radio" v-model="form.network" value="erc20" class="mr-3 mt-1 md:mt-0 flex-shrink-0" />
                  <div class="flex-1">
                    <p class="font-medium text-sm md:text-base text-gray-100">USDT (Ethereum Network)</p>
                    <p class="text-xs text-gray-400">ERC20</p>
                  </div>
                </label>
              </div>
            </div>

            <div class="bg-cyan-500/10 border border-cyan-500/30 rounded-lg p-3 md:p-4">
              <p class="text-xs md:text-sm text-cyan-400 mb-2">
                <strong>Informasi:</strong>
              </p>
              <ul class="text-xs md:text-sm text-gray-400 space-y-1 ml-4 list-disc">
                <li>Withdraw akan diproses dalam 1-24 jam</li>
                <li>Biaya network fee akan dikurangi dari jumlah withdraw</li>
                <li>Pastikan alamat wallet sudah benar</li>
                <li>Minimum withdraw adalah $10 USDT</li>
              </ul>
            </div>

            <button
              type="submit"
              :disabled="loading"
              class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-2 md:py-3 rounded-lg font-semibold text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 shadow-lg shadow-cyan-500/30"
            >
              {{ loading ? 'Memproses...' : 'Lanjutkan Withdraw' }}
            </button>
          </form>
        </div>
      </div>

      <!-- Withdraw Info -->
      <div class="space-y-4 md:space-y-6">
        <!-- Current Balance -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Saldo Tersedia</h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs md:text-sm text-gray-400 mb-1">Total Balance</p>
              <p class="text-xl md:text-2xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$1,250.00</p>
            </div>
            <div class="pt-3 border-t border-cyan-500/20">
              <p class="text-xs md:text-sm text-gray-400 mb-1">Withdrawable</p>
              <p class="text-lg md:text-xl font-semibold text-green-400">$800.00</p>
            </div>
            <div>
              <p class="text-xs md:text-sm text-gray-400 mb-1">In Staking</p>
              <p class="text-lg md:text-xl font-semibold text-purple-400">$450.00</p>
            </div>
          </div>
        </div>

        <!-- Recent Withdraws -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Withdraw Terkini</h3>
          <div class="space-y-2 md:space-y-3">
            <div class="flex items-center justify-between p-3 bg-black/40 backdrop-blur-sm border border-green-500/20 rounded-lg">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm md:text-base text-gray-100">$200.00</p>
                <p class="text-xs text-gray-400">12 Jan 2024</p>
              </div>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium flex-shrink-0 ml-2">
                Selesai
              </span>
            </div>
            <div class="flex items-center justify-between p-3 bg-black/40 backdrop-blur-sm border border-yellow-500/20 rounded-lg">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm md:text-base text-gray-100">$150.00</p>
                <p class="text-xs text-gray-400">8 Jan 2024</p>
              </div>
              <span class="px-2 py-1 bg-yellow-500/20 border border-yellow-500/50 text-yellow-400 rounded text-xs font-medium flex-shrink-0 ml-2">
                Pending
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
  walletAddress: '',
  network: 'tron'
})

const loading = ref(false)

const handleWithdraw = () => {
  if (parseFloat(form.value.amount) < 10) {
    alert('Minimum withdraw adalah $10')
    return
  }

  if (!form.value.walletAddress || form.value.walletAddress.length < 10) {
    alert('Alamat wallet tidak valid')
    return
  }

  loading.value = true
  setTimeout(() => {
    loading.value = false
    alert('Withdraw berhasil! Permintaan Anda sedang diproses.')
  }, 1500)
}
</script>

