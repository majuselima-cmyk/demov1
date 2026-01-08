<template>
  <div class="min-h-screen bg-black relative overflow-hidden flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <!-- Animated Background -->
    <div class="fixed inset-0 overflow-hidden pointer-events-none">
      <div class="absolute -top-40 -right-40 w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl"></div>
      <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-blue-500/20 rounded-full blur-3xl"></div>
      <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-96 h-96 bg-purple-500/10 rounded-full blur-3xl"></div>
    </div>

    <div class="max-w-md w-full relative z-10">
      <!-- Logo/Header -->
      <div class="text-center mb-8">
        <NuxtLink to="/" class="inline-block">
          <h1 class="text-3xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent">Cuan Platform</h1>
        </NuxtLink>
        <p class="mt-2 text-gray-400">Buat akun baru untuk mulai staking</p>
      </div>

      <!-- Register Form -->
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/30 rounded-2xl shadow-2xl shadow-cyan-500/20 p-8">
        <form @submit.prevent="handleRegister" class="space-y-6">
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

          <div>
            <label for="password" class="block text-sm font-medium text-gray-300 mb-2">
              Password
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
                minlength="6"
                class="w-full pl-10 pr-10 py-3 bg-black/40 backdrop-blur-sm border-[0.5px] border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-[0.5px] hover:border-cyan-500/50 transition-all duration-200 outline-none"
                placeholder="Minimal 6 karakter"
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
              Konfirmasi Password
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
                placeholder="Ulangi password"
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

          <div>
            <label for="referralCode" class="block text-sm font-medium text-gray-300 mb-2">
              Kode Referral <span class="text-gray-500 text-xs">(Opsional)</span>
            </label>
            <input
              id="referralCode"
              v-model="form.referralCode"
              type="text"
              class="w-full px-4 py-3 bg-black/40 backdrop-blur-sm border-[0.5px] border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-[0.5px] hover:border-cyan-500/50 transition-all duration-200 outline-none"
              placeholder="Masukkan kode referral jika ada"
            />
          </div>

          <div class="flex items-center">
            <input
              id="terms"
              v-model="form.acceptTerms"
              type="checkbox"
              required
              class="w-4 h-4 text-cyan-500 bg-black/40 border-cyan-500/30 rounded focus:ring-cyan-500 focus:ring-2"
            />
            <label for="terms" class="ml-2 block text-sm text-gray-400">
              Saya menyetujui <NuxtLink to="/terms" class="text-cyan-400 hover:text-cyan-300 transition-colors duration-200" target="_blank">syarat dan ketentuan</NuxtLink>
            </label>
          </div>

          <button
            type="submit"
            :disabled="loading"
            class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-3 rounded-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed shadow-lg shadow-cyan-500/30"
          >
            {{ loading ? 'Mendaftar...' : 'Daftar' }}
          </button>
        </form>

        <div class="mt-6 text-center">
          <p class="text-sm text-gray-400">
            Sudah punya akun?
            <NuxtLink to="/login" class="text-cyan-400 font-semibold hover:text-cyan-300 transition-colors duration-200">
              Masuk di sini
            </NuxtLink>
          </p>
        </div>
      </div>

      <!-- Info Box -->
      <div class="mt-6 bg-cyan-500/10 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-4">
        <p class="text-sm text-cyan-400">
          <strong>Keuntungan mendaftar:</strong> Dapatkan reward staking 0.5% per hari dan keuntungan dari sistem referral.
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
  email: '',
  password: '',
  confirmPassword: '',
  referralCode: '',
  acceptTerms: false
})

const loading = ref(false)
const showPassword = ref(false)
const showConfirmPassword = ref(false)

const handleRegister = async () => {
  if (form.value.password !== form.value.confirmPassword) {
    alert('Password tidak cocok')
    return
  }

  loading.value = true
  
  // Simulasi register (akan diintegrasikan dengan Supabase nanti)
  setTimeout(() => {
    loading.value = false
    alert('Registrasi berhasil! Silakan login.')
    navigateTo('/login')
  }, 1500)
}
</script>


