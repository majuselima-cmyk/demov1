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

      <!-- Reset Password Form -->
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/30 rounded-2xl shadow-2xl shadow-cyan-500/20 p-8">
        <div v-if="!resetSuccess">
          <h2 class="text-xl font-bold text-gray-100 mb-2">Buat Password Baru</h2>
          <p class="text-sm text-gray-400 mb-6">
            Masukkan password baru Anda. Pastikan password minimal 8 karakter.
          </p>

          <form @submit.prevent="handleResetPassword" class="space-y-6">
            <div>
              <label for="password" class="block text-sm font-medium text-gray-300 mb-2">
                Password Baru
              </label>
              <div class="relative">
                <!-- Password Icon -->
                <div class="absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-cyan-400/70">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" />
                  </svg>
                </div>
                <input
                  id="password"
                  v-model="form.password"
                  :type="showPassword ? 'text' : 'password'"
                  required
                  minlength="8"
                  class="w-full pl-10 pr-10 py-3 bg-black/40 backdrop-blur-sm border-[0.5px] border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-[0.5px] hover:border-cyan-500/50 transition-all duration-200 outline-none"
                  placeholder="Minimal 8 karakter"
                />
                <!-- Eye Toggle Button -->
                <button
                  type="button"
                  @click="showPassword = !showPassword"
                  class="absolute right-3 top-1/2 -translate-y-1/2 text-cyan-400/70 hover:text-cyan-400 transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-cyan-500/50 rounded"
                  tabindex="-1"
                >
                  <svg v-if="!showPassword" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                  <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 01-4.243-4.243m4.242 4.242L9.88 9.88" />
                  </svg>
                </button>
              </div>
            </div>

            <div>
              <label for="confirmPassword" class="block text-sm font-medium text-gray-300 mb-2">
                Konfirmasi Password Baru
              </label>
              <div class="relative">
                <!-- Password Icon -->
                <div class="absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-cyan-400/70">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" />
                  </svg>
                </div>
                <input
                  id="confirmPassword"
                  v-model="form.confirmPassword"
                  :type="showConfirmPassword ? 'text' : 'password'"
                  required
                  class="w-full pl-10 pr-10 py-3 bg-black/40 backdrop-blur-sm border-[0.5px] border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-[0.5px] hover:border-cyan-500/50 transition-all duration-200 outline-none"
                  placeholder="Ulangi password baru"
                />
                <!-- Eye Toggle Button -->
                <button
                  type="button"
                  @click="showConfirmPassword = !showConfirmPassword"
                  class="absolute right-3 top-1/2 -translate-y-1/2 text-cyan-400/70 hover:text-cyan-400 transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-cyan-500/50 rounded"
                  tabindex="-1"
                >
                  <svg v-if="!showConfirmPassword" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                  <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 01-4.243-4.243m4.242 4.242L9.88 9.88" />
                  </svg>
                </button>
              </div>
            </div>

            <div v-if="form.password && form.confirmPassword" class="p-3 bg-cyan-500/10 border border-cyan-500/30 rounded-lg">
              <ul class="text-xs md:text-sm text-gray-400 space-y-1">
                <li :class="form.password.length >= 8 ? 'text-green-400' : ''">
                  {{ form.password.length >= 8 ? '✓' : '•' }} Minimal 8 karakter
                </li>
                <li :class="passwordMatch ? 'text-green-400' : 'text-red-400'">
                  {{ passwordMatch ? '✓' : '✗' }} Password cocok
                </li>
              </ul>
            </div>

            <button
              type="submit"
              :disabled="loading || !isFormValid"
              class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-3 rounded-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed shadow-lg shadow-cyan-500/30"
            >
              {{ loading ? 'Mereset...' : 'Reset Password' }}
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

        <!-- Success State -->
        <div v-if="resetSuccess" class="text-center">
          <div class="w-16 h-16 bg-green-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 text-green-400">
              <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <h2 class="text-xl font-bold text-gray-100 mb-2">Password Berhasil Direset!</h2>
          <p class="text-sm text-gray-400 mb-6">
            Password Anda telah berhasil diubah. Silakan login dengan password baru Anda.
          </p>
          <NuxtLink
            to="/login"
            class="block w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-3 rounded-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30"
          >
            Masuk ke Akun
          </NuxtLink>
        </div>
      </div>

      <!-- Info Box -->
      <div class="mt-6 bg-green-500/10 backdrop-blur-sm border border-green-500/30 rounded-lg p-4">
        <p class="text-sm text-green-400">
          <strong>Keamanan:</strong> Pastikan password Anda kuat dan jangan bagikan kepada siapapun.
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
  password: '',
  confirmPassword: ''
})

const loading = ref(false)
const resetSuccess = ref(false)
const showPassword = ref(false)
const showConfirmPassword = ref(false)

const passwordMatch = computed(() => {
  return form.value.password === form.value.confirmPassword &&
         form.value.password.length > 0
})

const isFormValid = computed(() => {
  return form.value.password.length >= 8 &&
         passwordMatch.value
})

const handleResetPassword = async () => {
  loading.value = true
  try {
    // Simulasi API call
    await new Promise(resolve => setTimeout(resolve, 1500))
    resetSuccess.value = true
  } catch (error) {
    alert('Gagal reset password. Silakan coba lagi.')
  } finally {
    loading.value = false
  }
}
</script>

