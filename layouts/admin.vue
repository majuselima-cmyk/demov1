<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Mobile Menu Button -->
    <button
      @click="isMobileSidebarOpen = !isMobileSidebarOpen"
      class="fixed top-4 right-4 z-50 md:hidden bg-cyan-600 text-white p-3 rounded-lg shadow-lg hover:bg-cyan-700 transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:ring-offset-2"
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
      class="fixed inset-0 bg-black/50 backdrop-blur-sm z-30 md:hidden"
    ></div>

    <!-- Sidebar -->
    <aside
      :class="[
        'fixed inset-y-0 left-0 w-64 bg-white border-r border-gray-200 shadow-xl z-40 transition-transform duration-300 md:translate-x-0',
        isMobileSidebarOpen ? 'translate-x-0' : '-translate-x-full md:translate-x-0'
      ]"
    >
      <div class="flex flex-col h-full">
        <!-- Logo -->
        <div class="p-6 border-b border-gray-200">
          <h1 class="text-2xl font-bold bg-gradient-to-r from-cyan-600 to-blue-600 bg-clip-text text-transparent">Admin Panel</h1>
          <p class="text-xs text-gray-500 mt-1">Cuan Platform</p>
        </div>

        <!-- Navigation -->
        <nav class="flex-1 px-4 py-6 space-y-2 overflow-y-auto">
          <NuxtLink
            to="/cp7x9k2m/dashboard"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard' }"
          >
            <span class="font-medium">Dashboard</span>
          </NuxtLink>
          <NuxtLink
            to="/cp7x9k2m/dashboard/users"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard/users' }"
          >
            <span class="font-medium">Users</span>
          </NuxtLink>
          <NuxtLink
            to="/cp7x9k2m/dashboard/deposits"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard/deposits' }"
          >
            <span class="font-medium">Deposits</span>
          </NuxtLink>
          <NuxtLink
            to="/cp7x9k2m/dashboard/withdraws"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard/withdraws' }"
          >
            <span class="font-medium">Withdraws</span>
          </NuxtLink>
          <NuxtLink
            to="/cp7x9k2m/dashboard/transactions"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard/transactions' }"
          >
            <span class="font-medium">Transactions</span>
          </NuxtLink>
          <NuxtLink
            to="/cp7x9k2m/dashboard/staking"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard/staking' }"
          >
            <span class="font-medium">Staking</span>
          </NuxtLink>
          <NuxtLink
            to="/cp7x9k2m/dashboard/referral"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard/referral' }"
          >
            <span class="font-medium">Referral</span>
          </NuxtLink>
          <NuxtLink
            to="/cp7x9k2m/dashboard/settings"
            class="flex items-center px-4 py-3 text-gray-700 rounded-lg hover:bg-cyan-50 hover:text-cyan-600 hover:border-l-2 hover:border-cyan-500 transition-all duration-200"
            :class="{ 'bg-cyan-50 text-cyan-600 border-l-2 border-cyan-500 shadow-sm': $route.path === '/cp7x9k2m/dashboard/settings' }"
          >
            <span class="font-medium">Settings</span>
          </NuxtLink>
        </nav>

        <!-- User Section -->
        <div class="p-4 border-t border-gray-200">
          <div class="flex items-center justify-between mb-4">
            <div class="flex items-center space-x-3">
              <div class="w-10 h-10 bg-gradient-to-br from-cyan-600 to-blue-600 rounded-full flex items-center justify-center text-white font-semibold shadow-lg">
                AD
              </div>
              <div>
                <p class="text-sm font-medium text-gray-900">Admin</p>
                <p class="text-xs text-gray-500">Super Admin</p>
              </div>
            </div>
          </div>
          <div class="space-y-2">
            <NuxtLink
              to="/dashboard"
              class="block w-full bg-gray-100 border border-gray-300 text-gray-700 py-2 rounded-lg font-medium hover:bg-gray-200 transition-all duration-200 text-center text-sm"
            >
              Tampilan User
            </NuxtLink>
            <button
              @click="handleLogout"
              class="w-full bg-cyan-600 text-white py-2 rounded-lg font-medium hover:bg-cyan-700 transition-all duration-200 shadow-md"
            >
              Keluar
            </button>
          </div>
        </div>
      </div>
    </aside>

    <!-- Main Content -->
    <div class="md:pl-64 transition-all duration-300">
      <!-- Top Bar -->
      <header class="bg-white border-b border-gray-200 shadow-sm sticky top-0 z-30">
        <div class="px-4 md:px-6 py-4">
          <div class="flex items-center justify-end gap-4">
            <div class="flex items-center space-x-4">
              <div class="text-right hidden sm:block bg-cyan-50 border border-cyan-200 rounded-lg px-4 py-2">
                <p class="text-xs text-gray-600">Total Saldo Platform</p>
                <p class="text-base md:text-lg font-bold text-cyan-600">$125,000.00</p>
              </div>
            </div>
          </div>
        </div>
      </header>

      <!-- Page Content -->
      <main class="p-4 md:p-6 bg-gray-50">
        <slot />
      </main>
    </div>
  </div>
</template>

<script setup lang="ts">
const route = useRoute()
const isMobileSidebarOpen = ref(false)

const handleLogout = () => {
  // Simulasi logout
  navigateTo('/cp7x9k2m/login')
}

// Close sidebar when route changes (mobile)
watch(() => route.path, () => {
  isMobileSidebarOpen.value = false
})
</script>
