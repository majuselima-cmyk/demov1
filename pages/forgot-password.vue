<template>
  <div class="min-h-screen bg-black relative overflow-hidden flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <!-- Animated Background -->
    <div class="fixed inset-0 overflow-hidden pointer-events-none">
      <div class="absolute -top-40 -right-40 w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl"></div>
      <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-blue-500/20 rounded-full blur-3xl"></div>
    </div>

    <div class="max-w-md w-full relative z-10">
      <!-- Logo/Header -->
      <div class="text-center mb-8">
        <NuxtLink to="/" class="inline-block">
          <h1 class="text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent">Cuan Platform</h1>
        </NuxtLink>
        <p class="mt-2 text-gray-400">Reset password Anda</p>
      </div>

      <!-- Forgot Password Form -->
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/30 rounded-2xl shadow-2xl shadow-cyan-500/20 p-8">
        <div v-if="!emailSent && !resetSuccess">
          <h2 class="text-xl font-bold text-gray-100 mb-2">Lupa Password?</h2>
          <p class="text-sm text-gray-400 mb-6">
            Masukkan email Anda dan kami akan mengirimkan link untuk reset password ke email tersebut.
          </p>

          <form @submit.prevent="handleForgotPassword" class="space-y-6">
            <div>
              <label for="email" class="block text-sm font-medium text-gray-300 mb-2">
                Email
              </label>
              <div class="relative">
                <!-- Email Icon -->
                <div class="absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-cyan-400/70">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                  </svg>
                </div>
                <input
                  id="email"
                  v-model="form.email"
                  type="email"
                  required
                  class="w-full pl-10 pr-4 py-3 bg-black/40 backdrop-blur-sm border-[0.5px] border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-[0.5px] hover:border-cyan-500/50 transition-all duration-200 outline-none"
                  placeholder="nama@email.com"
                />
              </div>
            </div>

            <button
              type="submit"
              :disabled="loading"
              class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-3 rounded-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed shadow-lg shadow-cyan-500/30"
            >
              {{ loading ? 'Mengirim...' : 'Kirim Link Reset' }}
            </button>
          </form>

          <div class="mt-6 text-center">
            <NuxtLink to="/login" class="text-sm text-cyan-400 hover:text-cyan-300 transition-colors duration-200 flex items-center justify-center gap-2">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
              </svg>
              Kembali ke Login
            </NuxtLink>
          </div>
        </div>

        <!-- Email Sent Success -->
        <div v-if="emailSent && !resetSuccess" class="text-center">
          <div class="w-16 h-16 bg-green-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 text-green-400">
              <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
            </svg>
          </div>
          <h2 class="text-xl font-bold text-gray-100 mb-2">Email Terkirim!</h2>
          <p class="text-sm text-gray-400 mb-4">
            Kami telah mengirimkan link reset password ke <strong class="text-cyan-400">{{ form.email }}</strong>. 
            Silakan cek inbox email Anda.
          </p>
          <p class="text-xs text-gray-500 mb-6">
            Jika email tidak muncul di inbox, cek folder spam atau junk mail.
          </p>
          <button
            @click="resendEmail"
            :disabled="resendLoading || countdown > 0"
            class="w-full bg-black/40 border border-cyan-500/30 text-cyan-400 py-3 rounded-lg font-semibold hover:bg-cyan-500/10 hover:border-cyan-500/50 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {{ countdown > 0 ? `Kirim ulang (${countdown}s)` : resendLoading ? 'Mengirim...' : 'Kirim Ulang Email' }}
          </button>
          <div class="mt-4 text-center">
            <NuxtLink to="/login" class="text-sm text-cyan-400 hover:text-cyan-300 transition-colors duration-200">
              Kembali ke Login
            </NuxtLink>
          </div>
        </div>
      </div>

      <!-- Info Box -->
      <div class="mt-6 bg-blue-500/10 backdrop-blur-sm border border-blue-500/30 rounded-lg p-4">
        <p class="text-sm text-blue-400">
          <strong>Tips:</strong> Link reset password berlaku selama 1 jam. Pastikan email Anda aktif.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'default'
})

const form = ref({
  email: ''
})

const loading = ref(false)
const emailSent = ref(false)
const resetSuccess = ref(false)
const resendLoading = ref(false)
const countdown = ref(0)

const handleForgotPassword = async () => {
  loading.value = true
  try {
    // Simulasi API call
    await new Promise(resolve => setTimeout(resolve, 1500))
    emailSent.value = true
    startCountdown()
  } catch (error) {
    alert('Gagal mengirim email. Silakan coba lagi.')
  } finally {
    loading.value = false
  }
}

const resendEmail = async () => {
  if (countdown.value > 0) return
  
  resendLoading.value = true
  try {
    // Simulasi API call
    await new Promise(resolve => setTimeout(resolve, 1000))
    startCountdown()
    alert('Email berhasil dikirim ulang!')
  } catch (error) {
    alert('Gagal mengirim ulang email. Silakan coba lagi.')
  } finally {
    resendLoading.value = false
  }
}

const startCountdown = () => {
  countdown.value = 60
  const interval = setInterval(() => {
    countdown.value--
    if (countdown.value <= 0) {
      clearInterval(interval)
    }
  }, 1000)
}
</script>

