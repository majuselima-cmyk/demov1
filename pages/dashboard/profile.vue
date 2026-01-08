<template>
  <div>
    <div class="mb-4 md:mb-6">
      <h1 class="text-xl md:text-2xl font-bold text-gray-100 mb-2">Profile Saya</h1>
      <p class="text-sm md:text-base text-gray-400">Kelola informasi akun Anda</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
      <!-- Profile Info Card -->
      <div class="lg:col-span-1">
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <div class="text-center mb-6">
            <div class="w-24 h-24 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-full flex items-center justify-center text-white text-3xl font-bold mx-auto mb-4 shadow-lg shadow-cyan-500/50">
              {{ userInitials }}
            </div>
            <h2 class="text-lg md:text-xl font-bold text-gray-100 mb-1">{{ form.name || 'John Doe' }}</h2>
            <p class="text-sm text-cyan-400/70">{{ form.email || 'john@example.com' }}</p>
            <p class="text-xs text-gray-400 mt-2">Member sejak {{ memberSince }}</p>
          </div>

          <div class="space-y-3 pt-4 border-t border-cyan-500/20">
            <div class="flex items-center justify-between">
              <span class="text-xs text-gray-400">Status Akun</span>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                Aktif
              </span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs text-gray-400">Email Terverifikasi</span>
              <span class="px-2 py-1 bg-green-500/20 border border-green-500/50 text-green-400 rounded text-xs font-medium">
                ✓ Terverifikasi
              </span>
            </div>
          </div>
        </div>

        <!-- Security Info -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6 mt-4 md:mt-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4">Keamanan</h3>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-400">Password terakhir diubah</span>
              <span class="text-xs text-gray-300">30 hari lalu</span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-xs md:text-sm text-gray-400">2FA</span>
              <button 
                @click="show2FA = !show2FA"
                class="text-xs text-cyan-400 hover:text-cyan-300 transition-colors"
              >
                {{ show2FA ? 'Aktif' : 'Nonaktif' }} - Atur
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Profile Form -->
      <div class="lg:col-span-2 space-y-4 md:space-y-6">
        <!-- Personal Information -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Informasi Pribadi</h3>
          <form @submit.prevent="handleUpdateProfile" class="space-y-4 md:space-y-6">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label for="name" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                  Nama Lengkap
                </label>
                <input
                  id="name"
                  v-model="form.name"
                  type="text"
                  required
                  class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                  placeholder="John Doe"
                />
              </div>
              <div>
                <label for="phone" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                  No. Telepon
                </label>
                <input
                  id="phone"
                  v-model="form.phone"
                  type="tel"
                  class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                  placeholder="+62 812 3456 7890"
                />
              </div>
            </div>

            <div>
              <label for="email" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Email
              </label>
              <input
                id="email"
                v-model="form.email"
                type="email"
                required
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                placeholder="john@example.com"
              />
              <p class="mt-1 text-xs text-gray-400">Email digunakan untuk login dan notifikasi</p>
            </div>

            <div>
              <label for="address" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Alamat
              </label>
              <textarea
                id="address"
                v-model="form.address"
                rows="3"
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200 resize-none"
                placeholder="Masukkan alamat lengkap"
              ></textarea>
            </div>

            <div class="flex items-center justify-end gap-3 pt-4 border-t border-cyan-500/20">
              <button
                type="button"
                @click="resetForm"
                class="px-4 md:px-6 py-2 md:py-3 bg-black/40 border border-cyan-500/30 text-cyan-400 rounded-lg font-medium text-sm md:text-base hover:bg-cyan-500/10 hover:border-cyan-500/50 transition-all duration-200"
              >
                Batal
              </button>
              <button
                type="submit"
                :disabled="loading || !isFormChanged"
                class="px-4 md:px-6 py-2 md:py-3 bg-gradient-to-r from-cyan-500 to-blue-600 text-white rounded-lg font-semibold text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed shadow-lg shadow-cyan-500/30"
              >
                {{ loading ? 'Menyimpan...' : 'Simpan Perubahan' }}
              </button>
            </div>
          </form>
        </div>

        <!-- Change Password -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Ubah Password</h3>
          <form @submit.prevent="handleChangePassword" class="space-y-4 md:space-y-6">
            <div>
              <label for="currentPassword" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                Password Saat Ini
              </label>
              <input
                id="currentPassword"
                v-model="passwordForm.currentPassword"
                type="password"
                required
                class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                placeholder="Masukkan password saat ini"
              />
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label for="newPassword" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                  Password Baru
                </label>
                <input
                  id="newPassword"
                  v-model="passwordForm.newPassword"
                  type="password"
                  required
                  minlength="8"
                  class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                  placeholder="Minimal 8 karakter"
                />
              </div>
              <div>
                <label for="confirmPassword" class="block text-xs md:text-sm font-medium text-gray-300 mb-2">
                  Konfirmasi Password Baru
                </label>
                <input
                  id="confirmPassword"
                  v-model="passwordForm.confirmPassword"
                  type="password"
                  required
                  class="w-full px-3 md:px-4 py-2 md:py-3 bg-black/40 backdrop-blur-sm border border-cyan-500/30 rounded-lg text-sm md:text-base text-gray-100 placeholder-gray-500 focus:ring-1 focus:ring-cyan-500/50 focus:border-cyan-500/60 hover:border-cyan-500/50 transition-all duration-200"
                  placeholder="Ulangi password baru"
                />
              </div>
            </div>

            <div v-if="passwordForm.newPassword && passwordForm.confirmPassword" class="p-3 bg-cyan-500/10 border border-cyan-500/30 rounded-lg">
              <ul class="text-xs md:text-sm text-gray-400 space-y-1">
                <li :class="passwordForm.newPassword.length >= 8 ? 'text-green-400' : ''">
                  {{ passwordForm.newPassword.length >= 8 ? '✓' : '•' }} Minimal 8 karakter
                </li>
                <li :class="passwordMatch ? 'text-green-400' : 'text-red-400'">
                  {{ passwordMatch ? '✓' : '✗' }} Password cocok
                </li>
              </ul>
            </div>

            <div class="flex items-center justify-end pt-4 border-t border-cyan-500/20">
              <button
                type="submit"
                :disabled="loading || !isPasswordFormValid"
                class="px-4 md:px-6 py-2 md:py-3 bg-gradient-to-r from-cyan-500 to-blue-600 text-white rounded-lg font-semibold text-sm md:text-base hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed shadow-lg shadow-cyan-500/30"
              >
                {{ loading ? 'Mengubah...' : 'Ubah Password' }}
              </button>
            </div>
          </form>
        </div>

        <!-- Account Settings -->
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-lg md:rounded-xl shadow-lg shadow-cyan-500/10 p-4 md:p-6">
          <h3 class="text-base md:text-lg font-semibold text-gray-100 mb-4 md:mb-6">Pengaturan Akun</h3>
          <div class="space-y-4">
            <div class="flex items-center justify-between py-3 border-b border-cyan-500/20">
              <div>
                <p class="text-sm md:text-base font-medium text-gray-100">Email Notifikasi</p>
                <p class="text-xs text-gray-400">Terima notifikasi melalui email</p>
              </div>
              <label class="relative inline-flex items-center cursor-pointer">
                <input
                  v-model="settings.emailNotifications"
                  type="checkbox"
                  class="sr-only peer"
                />
                <div class="w-11 h-6 bg-gray-700 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-cyan-500/50 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-cyan-500"></div>
              </label>
            </div>

            <div class="flex items-center justify-between py-3 border-b border-cyan-500/20">
              <div>
                <p class="text-sm md:text-base font-medium text-gray-100">SMS Notifikasi</p>
                <p class="text-xs text-gray-400">Terima notifikasi melalui SMS</p>
              </div>
              <label class="relative inline-flex items-center cursor-pointer">
                <input
                  v-model="settings.smsNotifications"
                  type="checkbox"
                  class="sr-only peer"
                />
                <div class="w-11 h-6 bg-gray-700 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-cyan-500/50 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-cyan-500"></div>
              </label>
            </div>

            <div class="flex items-center justify-between py-3">
              <div>
                <p class="text-sm md:text-base font-medium text-gray-100">Hapus Akun</p>
                <p class="text-xs text-red-400">Tindakan ini tidak dapat dibatalkan</p>
              </div>
              <button
                @click="showDeleteModal = true"
                class="px-4 py-2 bg-red-500/20 border border-red-500/50 text-red-400 rounded-lg font-medium text-sm hover:bg-red-500/30 hover:border-red-500/70 transition-all duration-200"
              >
                Hapus Akun
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Delete Account Modal -->
    <div
      v-if="showDeleteModal"
      class="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 flex items-center justify-center p-4"
      @click.self="showDeleteModal = false"
    >
      <div class="bg-black/90 backdrop-blur-xl border border-red-500/30 rounded-lg md:rounded-xl shadow-2xl shadow-red-500/20 p-6 md:p-8 max-w-md w-full">
        <h3 class="text-lg md:text-xl font-bold text-red-400 mb-4">Hapus Akun?</h3>
        <p class="text-sm md:text-base text-gray-300 mb-6">
          Apakah Anda yakin ingin menghapus akun? Tindakan ini tidak dapat dibatalkan dan semua data Anda akan dihapus secara permanen.
        </p>
        <div class="flex items-center justify-end gap-3">
          <button
            @click="showDeleteModal = false"
            class="px-4 py-2 bg-gray-700 text-gray-300 rounded-lg font-medium text-sm hover:bg-gray-600 transition-all duration-200"
          >
            Batal
          </button>
          <button
            @click="handleDeleteAccount"
            class="px-4 py-2 bg-red-500 text-white rounded-lg font-medium text-sm hover:bg-red-600 transition-all duration-200"
          >
            Ya, Hapus Akun
          </button>
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
  name: 'John Doe',
  email: 'john@example.com',
  phone: '+62 812 3456 7890',
  address: 'Jl. Example No. 123, Jakarta Selatan, DKI Jakarta 12345'
})

const originalForm = ref({ ...form.value })

const passwordForm = ref({
  currentPassword: '',
  newPassword: '',
  confirmPassword: ''
})

const settings = ref({
  emailNotifications: true,
  smsNotifications: false
})

const loading = ref(false)
const showDeleteModal = ref(false)
const show2FA = ref(false)

const memberSince = ref('Januari 2024')

const userInitials = computed(() => {
  const name = form.value.name || 'John Doe'
  return name
    .split(' ')
    .map((n: string) => n[0])
    .join('')
    .toUpperCase()
    .slice(0, 2)
})

const isFormChanged = computed(() => {
  return JSON.stringify(form.value) !== JSON.stringify(originalForm.value)
})

const passwordMatch = computed(() => {
  return passwordForm.value.newPassword === passwordForm.value.confirmPassword &&
         passwordForm.value.newPassword.length > 0
})

const isPasswordFormValid = computed(() => {
  return passwordForm.value.currentPassword.length > 0 &&
         passwordForm.value.newPassword.length >= 8 &&
         passwordMatch.value
})

const handleUpdateProfile = async () => {
  loading.value = true
  try {
    // Simulasi API call
    await new Promise(resolve => setTimeout(resolve, 1500))
    originalForm.value = { ...form.value }
    alert('Profile berhasil diperbarui!')
  } catch (error) {
    alert('Gagal memperbarui profile. Silakan coba lagi.')
  } finally {
    loading.value = false
  }
}

const handleChangePassword = async () => {
  loading.value = true
  try {
    // Simulasi API call
    await new Promise(resolve => setTimeout(resolve, 1500))
    passwordForm.value = {
      currentPassword: '',
      newPassword: '',
      confirmPassword: ''
    }
    alert('Password berhasil diubah!')
  } catch (error) {
    alert('Gagal mengubah password. Silakan coba lagi.')
  } finally {
    loading.value = false
  }
}

const resetForm = () => {
  form.value = { ...originalForm.value }
}

const handleDeleteAccount = async () => {
  loading.value = true
  try {
    // Simulasi API call
    await new Promise(resolve => setTimeout(resolve, 1500))
    alert('Akun berhasil dihapus')
    navigateTo('/login')
  } catch (error) {
    alert('Gagal menghapus akun. Silakan coba lagi.')
  } finally {
    loading.value = false
    showDeleteModal.value = false
  }
}
</script>

