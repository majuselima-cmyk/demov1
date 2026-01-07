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
            <input
              id="email"
              v-model="form.email"
              type="email"
              required
              class="w-full px-4 py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
              placeholder="nama@email.com"
            />
          </div>

          <div>
            <label for="password" class="block text-sm font-medium text-gray-300 mb-2">
              Password
            </label>
            <input
              id="password"
              v-model="form.password"
              type="password"
              required
              minlength="6"
              class="w-full px-4 py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
              placeholder="Minimal 6 karakter"
            />
          </div>

          <div>
            <label for="confirmPassword" class="block text-sm font-medium text-gray-300 mb-2">
              Konfirmasi Password
            </label>
            <input
              id="confirmPassword"
              v-model="form.confirmPassword"
              type="password"
              required
              class="w-full px-4 py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
              placeholder="Ulangi password"
            />
          </div>

          <div>
            <label for="referralCode" class="block text-sm font-medium text-gray-300 mb-2">
              Kode Referral <span class="text-gray-500 text-xs">(Opsional)</span>
            </label>
            <input
              id="referralCode"
              v-model="form.referralCode"
              type="text"
              class="w-full px-4 py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
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
              Saya menyetujui <a href="#" class="text-cyan-400 hover:text-cyan-300 transition-colors duration-200">syarat dan ketentuan</a>
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


