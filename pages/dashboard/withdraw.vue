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
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                placeholder="10.00"
              />
              <p class="mt-1 text-xs text-gray-400">Minimum withdraw: $10.00 USDT</p>
            </div>

            <div>
              <label for="walletAddress" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Alamat Wallet USDT
              </label>
              <div class="relative">
                <!-- Wallet Icon -->
                <div class="absolute left-3 md:left-4 top-1/2 -translate-y-1/2 pointer-events-none">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-cyan-400/70">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 00-2.25-2.25H15a3 3 0 11-6 0H5.25A2.25 2.25 0 003 12m18 0v6a2.25 2.25 0 01-2.25 2.25H5.25A2.25 2.25 0 013 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 00-2.25-2.25H5.25A2.25 2.25 0 003 9m18 0V6a2.25 2.25 0 00-2.25-2.25H5.25A2.25 2.25 0 003 6v3" />
                  </svg>
                </div>
                <!-- Input with left padding for icon -->
                <input
                  id="walletAddress"
                  v-model="form.walletAddress"
                  type="text"
                  required
                  class="w-full pl-10 md:pl-12 pr-24 md:pr-28 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                  placeholder="Masukkan alamat wallet USDT"
                />
                <!-- Paste Button -->
                <button
                  type="button"
                  @click="handlePaste"
                  class="absolute right-2 top-1/2 -translate-y-1/2 flex items-center gap-1.5 px-2 md:px-3 py-1.5 md:py-2 bg-cyan-500/10 border border-cyan-500/30 text-cyan-400 rounded-lg text-xs md:text-sm font-medium hover:bg-cyan-500/20 hover:border-cyan-500/50 transition-all duration-200 focus:outline-none focus:ring-1 focus:ring-cyan-500/50"
                  :disabled="pasting"
                >
                  <svg 
                    v-if="!pasting"
                    xmlns="http://www.w3.org/2000/svg" 
                    fill="none" 
                    viewBox="0 0 24 24" 
                    stroke-width="1.5" 
                    stroke="currentColor" 
                    class="w-4 h-4"
                  >
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.666 3.888A2.25 2.25 0 0013.5 2.25h-3c-1.03 0-1.9.693-2.166 1.638m7.332 0c.055.194.084.4.084.612v0a.75.75 0 01-.75.75H9a.75.75 0 01-.75-.75v0c0-.212.03-.418.084-.612m7.332 0c.646.049 1.288.11 1.927.184 1.1.128 1.907 1.077 1.907 2.185V19.5a2.25 2.25 0 01-2.25 2.25H6.75A2.25 2.25 0 014.5 19.5V6.257c0-1.108.806-2.057 1.907-2.185a48.208 48.208 0 011.927-.184" />
                  </svg>
                  <svg 
                    v-else
                    class="animate-spin h-4 w-4" 
                    xmlns="http://www.w3.org/2000/svg" 
                    fill="none" 
                    viewBox="0 0 24 24"
                  >
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  <span class="hidden sm:inline">{{ pasting ? 'Pasting...' : 'Paste' }}</span>
                </button>
              </div>
              <p v-if="pasteSuccess" class="mt-1 text-xs text-green-400 flex items-center gap-1">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                Alamat wallet berhasil dipaste!
              </p>
              <p v-if="pasteError" class="mt-1 text-xs text-red-400 flex items-center gap-1">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z" />
                </svg>
                Gagal paste alamat wallet
              </p>
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
const pasting = ref(false)
const pasteSuccess = ref(false)
const pasteError = ref(false)

const handlePaste = async () => {
  pasting.value = true
  pasteSuccess.value = false
  pasteError.value = false

  try {
    // Check if Clipboard API is available
    if (!navigator.clipboard || !navigator.clipboard.readText) {
      // Fallback for older browsers
      const textArea = document.createElement('textarea')
      textArea.style.position = 'fixed'
      textArea.style.opacity = '0'
      textArea.value = ''
      document.body.appendChild(textArea)
      textArea.focus()
      
      const success = document.execCommand('paste')
      if (success) {
        const pastedText = textArea.value.trim()
        if (pastedText.length > 0) {
          form.value.walletAddress = pastedText
          pasteSuccess.value = true
          setTimeout(() => {
            pasteSuccess.value = false
          }, 3000)
        } else {
          pasteError.value = true
          setTimeout(() => {
            pasteError.value = false
          }, 3000)
        }
      } else {
        pasteError.value = true
        setTimeout(() => {
          pasteError.value = false
        }, 3000)
      }
      document.body.removeChild(textArea)
    } else {
      // Modern Clipboard API
      const text = await navigator.clipboard.readText()
      if (text && text.trim().length > 0) {
        form.value.walletAddress = text.trim()
        pasteSuccess.value = true
        setTimeout(() => {
          pasteSuccess.value = false
        }, 3000)
      } else {
        pasteError.value = true
        setTimeout(() => {
          pasteError.value = false
        }, 3000)
      }
    }
  } catch (error) {
    console.error('Error pasting:', error)
    pasteError.value = true
    setTimeout(() => {
      pasteError.value = false
    }, 3000)
  } finally {
    pasting.value = false
  }
}

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

