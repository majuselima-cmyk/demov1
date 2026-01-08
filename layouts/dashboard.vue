<template>
  <div class="min-h-screen bg-black">
    <!-- Mobile Menu Button -->
    <button
      @click="isMobileSidebarOpen = !isMobileSidebarOpen"
      class="fixed top-4 right-4 z-50 md:hidden bg-cyan-500/20 backdrop-blur-md border border-cyan-500/50 text-cyan-400 p-3 rounded-lg shadow-lg shadow-cyan-500/20 hover:bg-cyan-500/30 hover:border-cyan-400 transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:ring-offset-2 focus:ring-offset-black"
      aria-label="Toggle menu"
    >
      <div class="w-6 h-6 flex flex-col justify-center items-center space-y-1.5">
        <span
          :class="[
            'block w-6 h-0.5 bg-white transition-all duration-300 ease-in-out',
            isMobileSidebarOpen ? 'rotate-45 translate-y-2' : ''
          ]"
        ></span>
        <span
          :class="[
            'block w-6 h-0.5 bg-white transition-all duration-300 ease-in-out',
            isMobileSidebarOpen ? 'opacity-0' : 'opacity-100'
          ]"
        ></span>
        <span
          :class="[
            'block w-6 h-0.5 bg-white transition-all duration-300 ease-in-out',
            isMobileSidebarOpen ? '-rotate-45 -translate-y-2' : ''
          ]"
        ></span>
      </div>
    </button>

    <!-- Sidebar Overlay (Mobile) -->
    <div
      v-if="isMobileSidebarOpen"
      @click="isMobileSidebarOpen = false"
      class="fixed inset-0 bg-black/80 backdrop-blur-sm z-30 md:hidden"
    ></div>

    <!-- Sidebar -->
    <aside
      :class="[
        'fixed inset-y-0 left-0 w-64 bg-black/80 backdrop-blur-xl border-r border-cyan-500/20 shadow-2xl shadow-cyan-500/10 z-40 transition-transform duration-300 md:translate-x-0',
        isMobileSidebarOpen ? 'translate-x-0' : '-translate-x-full md:translate-x-0'
      ]"
    >
      <div class="flex flex-col h-full">
        <!-- Logo -->
        <div class="p-6 border-b border-cyan-500/20">
          <h1 class="text-2xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent">Cuan Platform</h1>
        </div>

        <!-- Navigation -->
        <nav class="flex-1 px-4 py-6 space-y-2 overflow-y-auto">
          <NuxtLink
            to="/dashboard"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard' }"
          >
            <span class="font-medium">Dashboard</span>
          </NuxtLink>
          <NuxtLink
            to="/dashboard/deposit"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard/deposit' }"
          >
            <span class="font-medium">Deposit</span>
          </NuxtLink>
          <NuxtLink
            to="/dashboard/withdraw"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard/withdraw' }"
          >
            <span class="font-medium">Withdraw</span>
          </NuxtLink>
          <NuxtLink
            to="/dashboard/staking"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard/staking' }"
          >
            <span class="font-medium">Staking</span>
          </NuxtLink>
          <NuxtLink
            to="/dashboard/referral"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard/referral' }"
          >
            <span class="font-medium">Referral</span>
          </NuxtLink>
          <NuxtLink
            to="/dashboard/transfers"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard/transfers' }"
          >
            <span class="font-medium">Transfer Token</span>
          </NuxtLink>
          <NuxtLink
            to="/dashboard/history"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard/history' }"
          >
            <span class="font-medium">Riwayat</span>
          </NuxtLink>
          <NuxtLink
            to="/dashboard/profile"
            class="flex items-center px-4 py-3 text-gray-300 rounded-lg hover:bg-cyan-500/10 hover:text-cyan-400 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-500/20 text-cyan-400 border-l-2 border-cyan-500 shadow-lg shadow-cyan-500/20': $route.path === '/dashboard/profile' }"
          >
            <span class="font-medium">Profile</span>
          </NuxtLink>
        </nav>

        <!-- User Section -->
        <div class="p-4 border-t border-cyan-500/20">
          <NuxtLink
            to="/dashboard/profile"
            class="flex items-center justify-between mb-4 p-2 rounded-lg hover:bg-cyan-500/10 transition-all duration-200 cursor-pointer"
          >
            <div class="flex items-center space-x-3">
              <div class="w-10 h-10 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-full flex items-center justify-center text-white font-semibold shadow-lg shadow-cyan-500/50">
                JD
              </div>
              <div>
                <p class="text-sm font-medium text-gray-100">John Doe</p>
                <p class="text-xs text-cyan-400/70">Member</p>
              </div>
            </div>
          </NuxtLink>
          <button
            @click="handleLogout"
            class="w-full bg-cyan-500/10 border border-cyan-500/30 text-cyan-400 py-2 rounded-lg font-medium hover:bg-cyan-500/20 hover:border-cyan-500/50 transition-all duration-200 shadow-lg shadow-cyan-500/10"
          >
            Keluar
          </button>
        </div>
      </div>
    </aside>

    <!-- Main Content -->
    <div class="md:pl-64 transition-all duration-300">
      <!-- Top Bar -->
      <header class="bg-black/60 backdrop-blur-xl border-b border-cyan-500/20 shadow-lg shadow-cyan-500/5 sticky top-0 z-30">
        <div class="px-4 md:px-6 py-4">
          <div class="flex items-center justify-end gap-4">
            <div class="flex items-center space-x-4">
              <div class="text-right hidden sm:block bg-cyan-500/10 border border-cyan-500/30 rounded-lg px-4 py-2 backdrop-blur-sm">
                <p class="text-xs text-cyan-400/70">Saldo Total</p>
                <p class="text-base md:text-lg font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">$1,250.00</p>
              </div>
            </div>
          </div>
        </div>
      </header>

      <!-- Page Content -->
      <main class="p-4 md:p-6 bg-black">
        <slot />
      </main>
    </div>
  </div>
</template>

<script setup lang="ts">
const route = useRoute()
const isMobileSidebarOpen = ref(false)

const pageTitle = computed(() => {
  const titles: Record<string, string> = {
    '/dashboard': 'Dashboard',
    '/dashboard/deposit': 'Deposit',
    '/dashboard/withdraw': 'Withdraw',
    '/dashboard/staking': 'Staking',
    '/dashboard/referral': 'Referral',
    '/dashboard/transfers': 'Transfer Token',
    '/dashboard/history': 'Riwayat',
    '/dashboard/profile': 'Profile'
  }
  return titles[route.path] || 'Dashboard'
})

const handleLogout = () => {
  // Simulasi logout (akan diintegrasikan dengan Supabase nanti)
  navigateTo('/login')
}

// Close sidebar when route changes (mobile)
watch(() => route.path, () => {
  isMobileSidebarOpen.value = false
})
</script>


