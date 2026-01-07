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
        <p class="mt-2 text-gray-400">Masuk ke akun Anda</p>
      </div>

      <!-- Login Form -->
      <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/30 rounded-2xl shadow-2xl shadow-cyan-500/20 p-8">
        <form @submit.prevent="handleLogin" class="space-y-6">
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
              class="w-full px-4 py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-gray-100 placeholder-gray-500 focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200"
              placeholder="Masukkan password"
            />
          </div>

          <div class="flex items-center justify-between">
            <div class="flex items-center">
              <input
                id="remember"
                v-model="form.remember"
                type="checkbox"
                class="w-4 h-4 text-cyan-500 bg-black/40 border-cyan-500/30 rounded focus:ring-cyan-500 focus:ring-2"
              />
              <label for="remember" class="ml-2 block text-sm text-gray-400">
                Ingat saya
              </label>
            </div>
            <a href="#" class="text-sm text-cyan-400 hover:text-cyan-300 transition-colors duration-200">
              Lupa password?
            </a>
          </div>

          <button
            type="submit"
            :disabled="loading"
            class="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-3 rounded-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed shadow-lg shadow-cyan-500/30"
          >
            {{ loading ? 'Masuk...' : 'Masuk' }}
          </button>
        </form>

        <div class="mt-6">
          <div class="relative">
            <div class="absolute inset-0 flex items-center">
              <div class="w-full border-t border-cyan-500/20"></div>
            </div>
            <div class="relative flex justify-center text-sm">
              <span class="px-2 bg-black/60 text-gray-400">atau</span>
            </div>
          </div>

          <div class="mt-6 text-center">
            <p class="text-sm text-gray-400">
              Belum punya akun?
              <NuxtLink to="/register" class="text-cyan-400 font-semibold hover:text-cyan-300 transition-colors duration-200">
                Daftar di sini
              </NuxtLink>
            </p>
          </div>
        </div>
      </div>

      <!-- Info Box -->
      <div class="mt-6 bg-green-500/10 backdrop-blur-sm border border-green-500/30 rounded-lg p-4">
        <p class="text-sm text-green-400">
          <strong>Tips keamanan:</strong> Jangan bagikan kredensial login Anda kepada siapapun.
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
  remember: false
})

const loading = ref(false)

const handleLogin = async () => {
  loading.value = true
  
  // Simulasi login (akan diintegrasikan dengan Supabase nanti)
  setTimeout(() => {
    loading.value = false
    alert('Login berhasil!')
    navigateTo('/dashboard')
  }, 1500)
}
</script>


