<template>
  <div class="min-h-screen bg-black relative overflow-hidden">
    <!-- Animated Background -->
    <div class="fixed inset-0 overflow-hidden pointer-events-none">
      <div class="absolute -top-40 -right-40 w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl"></div>
      <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-blue-500/20 rounded-full blur-3xl"></div>
    </div>

    <div class="relative z-10">
      <!-- Header -->
      <header class="bg-black/60 backdrop-blur-xl border-b border-cyan-500/20 sticky top-0 z-20">
        <div class="max-w-4xl mx-auto px-4 md:px-6 py-4">
          <NuxtLink to="/" class="inline-flex items-center gap-2 text-cyan-400 hover:text-cyan-300 transition-colors duration-200">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
              <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
            </svg>
            <span class="font-medium">Kembali ke Beranda</span>
          </NuxtLink>
        </div>
      </header>

      <!-- Content -->
      <main class="max-w-4xl mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="bg-black/60 backdrop-blur-xl border border-cyan-500/20 rounded-2xl shadow-2xl shadow-cyan-500/10 p-6 md:p-10">
          <!-- Title -->
          <div class="text-center mb-8 md:mb-12">
            <h1 class="text-3xl md:text-4xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent mb-4">
              Syarat dan Ketentuan
            </h1>
            <p class="text-sm md:text-base text-gray-400">
              Terakhir diperbarui: {{ lastUpdated }}
            </p>
          </div>

          <!-- Terms Content -->
          <div class="prose prose-invert max-w-none space-y-8">
            <!-- Section 1 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">1. Penerimaan Syarat</h2>
              <p class="text-gray-300 leading-relaxed mb-4">
                Dengan mengakses dan menggunakan platform Cuan Platform, Anda menyetujui untuk terikat oleh syarat dan ketentuan ini. 
                Jika Anda tidak setuju dengan syarat dan ketentuan ini, mohon untuk tidak menggunakan layanan kami.
              </p>
              <p class="text-gray-300 leading-relaxed">
                Kami berhak untuk mengubah, memodifikasi, atau memperbarui syarat dan ketentuan ini kapan saja tanpa pemberitahuan sebelumnya. 
                Perubahan akan berlaku efektif setelah dipublikasikan di platform ini.
              </p>
            </section>

            <!-- Section 2 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">2. Akun Pengguna</h2>
              <div class="space-y-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">2.1. Pendaftaran</h3>
                  <p class="text-gray-300 leading-relaxed">
                    Untuk menggunakan layanan kami, Anda harus mendaftar dan membuat akun. Anda bertanggung jawab untuk:
                  </p>
                  <ul class="list-disc list-inside text-gray-300 space-y-2 mt-2 ml-4">
                    <li>Menyediakan informasi yang akurat, lengkap, dan terkini</li>
                    <li>Menjaga kerahasiaan kata sandi dan informasi akun Anda</li>
                    <li>Memberitahu kami segera jika ada aktivitas mencurigakan pada akun Anda</li>
                    <li>Memastikan bahwa Anda berusia minimal 18 tahun</li>
                  </ul>
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">2.2. Keamanan Akun</h3>
                  <p class="text-gray-300 leading-relaxed">
                    Anda bertanggung jawab penuh atas semua aktivitas yang terjadi di bawah akun Anda. 
                    Kami tidak bertanggung jawab atas kerugian yang disebabkan oleh penggunaan akun Anda yang tidak sah.
                  </p>
                </div>
              </div>
            </section>

            <!-- Section 3 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">3. Layanan Staking</h2>
              <div class="space-y-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">3.1. Konsep Staking</h3>
                  <p class="text-gray-300 leading-relaxed">
                    Platform kami menyediakan layanan staking dengan tingkat reward harian tertentu. 
                    Reward yang diberikan bersifat variabel dan dapat berubah sesuai kebijakan platform.
                  </p>
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">3.2. Deposito dan Penarikan</h3>
                  <ul class="list-disc list-inside text-gray-300 space-y-2 ml-4">
                    <li>Deposit minimum ditentukan oleh platform dan dapat berubah sewaktu-waktu</li>
                    <li>Penarikan dana dapat dilakukan sesuai dengan ketentuan yang berlaku</li>
                    <li>Biaya network fee akan dikurangi dari jumlah penarikan</li>
                    <li>Waktu pemrosesan deposit dan penarikan dapat bervariasi</li>
                  </ul>
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">3.3. Risiko</h3>
                  <p class="text-gray-300 leading-relaxed">
                    <strong class="text-yellow-400">PENTING:</strong> Semua investasi mengandung risiko. 
                    Nilai investasi dapat naik atau turun. Hasil masa lalu tidak menjamin hasil masa depan. 
                    Pastikan Anda memahami risiko yang terkait sebelum melakukan investasi.
                  </p>
                </div>
              </div>
            </section>

            <!-- Section 4 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">4. Sistem Referral</h2>
              <div class="space-y-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">4.1. Program Referral</h3>
                  <p class="text-gray-300 leading-relaxed">
                    Platform menyediakan sistem referral yang memungkinkan pengguna untuk mendapatkan reward 
                    dengan mengajak pengguna lain bergabung. Reward referral ditentukan sesuai dengan kebijakan yang berlaku.
                  </p>
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">4.2. Ketentuan Referral</h3>
                  <ul class="list-disc list-inside text-gray-300 space-y-2 ml-4">
                    <li>Kode referral harus digunakan saat pendaftaran</li>
                    <li>Reward hanya diberikan setelah referral melakukan deposit</li>
                    <li>Penyalahgunaan sistem referral akan mengakibatkan pembekuan akun</li>
                    <li>Platform berhak mengubah ketentuan referral tanpa pemberitahuan sebelumnya</li>
                  </ul>
                </div>
              </div>
            </section>

            <!-- Section 5 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">5. Pembayaran dan Transaksi</h2>
              <div class="space-y-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">5.1. Metode Pembayaran</h3>
                  <p class="text-gray-300 leading-relaxed">
                    Platform menerima pembayaran melalui cryptocurrency (USDT) dengan berbagai network. 
                    Pastikan Anda menggunakan network yang sesuai saat melakukan transfer.
                  </p>
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-200 mb-2">5.2. Konfirmasi Transaksi</h3>
                  <p class="text-gray-300 leading-relaxed">
                    Transaksi akan diproses setelah konfirmasi di blockchain. 
                    Waktu konfirmasi dapat bervariasi tergantung kondisi network.
                  </p>
                </div>
              </div>
            </section>

            <!-- Section 6 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">6. Larangan</h2>
              <p class="text-gray-300 leading-relaxed mb-4">
                Anda dilarang untuk:
              </p>
              <ul class="list-disc list-inside text-gray-300 space-y-2 ml-4">
                <li>Menggunakan platform untuk tujuan ilegal atau melanggar hukum</li>
                <li>Mencoba mengakses akun pengguna lain tanpa izin</li>
                <li>Melakukan aktivitas yang dapat merusak atau mengganggu sistem platform</li>
                <li>Menggunakan bot, script, atau alat otomatis lainnya untuk memanipulasi sistem</li>
                <li>Menyebarkan malware, virus, atau kode berbahaya lainnya</li>
                <li>Melakukan money laundering atau aktivitas pencucian uang</li>
                <li>Menggunakan platform jika Anda berasal dari yurisdiksi yang dilarang</li>
              </ul>
            </section>

            <!-- Section 7 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">7. Pembekuan dan Penutupan Akun</h2>
              <p class="text-gray-300 leading-relaxed mb-4">
                Kami berhak untuk membekukan atau menutup akun Anda jika:
              </p>
              <ul class="list-disc list-inside text-gray-300 space-y-2 ml-4">
                <li>Anda melanggar syarat dan ketentuan ini</li>
                <li>Terjadi aktivitas mencurigakan atau penipuan</li>
                <li>Diminta oleh pihak berwenang</li>
                <li>Akun tidak aktif dalam periode yang ditentukan</li>
              </ul>
            </section>

            <!-- Section 8 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">8. Batasan Tanggung Jawab</h2>
              <p class="text-gray-300 leading-relaxed mb-4">
                Platform ini disediakan "sebagaimana adanya" tanpa jaminan apapun. Kami tidak bertanggung jawab atas:
              </p>
              <ul class="list-disc list-inside text-gray-300 space-y-2 ml-4">
                <li>Kerugian finansial yang timbul dari penggunaan platform</li>
                <li>Fluktuasi nilai cryptocurrency</li>
                <li>Gangguan teknis di luar kendali kami</li>
                <li>Kehilangan data akibat kesalahan pengguna</li>
                <li>Masalah yang timbul dari penggunaan wallet pihak ketiga</li>
              </ul>
            </section>

            <!-- Section 9 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">9. Kekayaan Intelektual</h2>
              <p class="text-gray-300 leading-relaxed">
                Semua konten, logo, merek dagang, dan materi lainnya di platform ini adalah milik Cuan Platform atau 
                pemberi lisensi kami. Anda tidak diperbolehkan untuk menggunakan, menyalin, atau mendistribusikan 
                materi tersebut tanpa izin tertulis dari kami.
              </p>
            </section>

            <!-- Section 10 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">10. Privasi dan Data</h2>
              <p class="text-gray-300 leading-relaxed">
                Penggunaan data pribadi Anda diatur oleh Kebijakan Privasi kami. 
                Dengan menggunakan platform ini, Anda menyetujui pengumpulan dan penggunaan data sesuai dengan kebijakan tersebut.
              </p>
            </section>

            <!-- Section 11 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">11. Perubahan Layanan</h2>
              <p class="text-gray-300 leading-relaxed">
                Kami berhak untuk mengubah, menangguhkan, atau menghentikan layanan atau bagian dari layanan 
                kapan saja tanpa pemberitahuan sebelumnya. Kami tidak bertanggung jawab jika layanan tidak tersedia 
                atau tidak dapat diakses.
              </p>
            </section>

            <!-- Section 12 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">12. Hukum yang Berlaku</h2>
              <p class="text-gray-300 leading-relaxed mb-4">
                Syarat dan ketentuan ini diatur oleh hukum yang berlaku. Setiap sengketa yang timbul akan diselesaikan 
                melalui arbitrase atau pengadilan yang berwenang sesuai dengan hukum yang berlaku.
              </p>
            </section>

            <!-- Section 13 -->
            <section>
              <h2 class="text-xl md:text-2xl font-bold text-cyan-400 mb-4">13. Kontak</h2>
              <p class="text-gray-300 leading-relaxed mb-4">
                Jika Anda memiliki pertanyaan tentang syarat dan ketentuan ini, silakan hubungi kami melalui:
              </p>
              <ul class="list-disc list-inside text-gray-300 space-y-2 ml-4">
                <li>Email: support@cuanplatform.com</li>
                <li>Telegram: @cuanplatform_support</li>
              </ul>
            </section>

            <!-- Warning Box -->
            <div class="mt-8 p-6 bg-yellow-500/10 border border-yellow-500/30 rounded-lg">
              <div class="flex items-start gap-3">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 text-yellow-400 flex-shrink-0 mt-0.5">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
                </svg>
                <div>
                  <h3 class="font-semibold text-yellow-400 mb-2">Peringatan Penting</h3>
                  <p class="text-gray-300 text-sm leading-relaxed">
                    Investasi dalam cryptocurrency dan layanan staking memiliki risiko tinggi. 
                    Nilai investasi dapat turun drastis dan Anda dapat kehilangan seluruh investasi Anda. 
                    Pastikan Anda memahami risiko yang terkait dan hanya berinvestasi dengan dana yang Anda 
                    sanggup untuk kehilangan. Platform ini tidak memberikan saran investasi atau jaminan return.
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Footer Actions -->
          <div class="mt-12 pt-8 border-t border-cyan-500/20 flex flex-col sm:flex-row gap-4 justify-between items-center">
            <NuxtLink
              to="/register"
              class="w-full sm:w-auto px-6 py-3 bg-gradient-to-r from-cyan-500 to-blue-600 text-white rounded-lg font-semibold hover:from-cyan-400 hover:to-blue-500 transition-all duration-200 shadow-lg shadow-cyan-500/30 text-center"
            >
              Setuju dan Daftar
            </NuxtLink>
            <NuxtLink
              to="/"
              class="w-full sm:w-auto px-6 py-3 bg-black/40 border border-cyan-500/30 text-cyan-400 rounded-lg font-semibold hover:bg-cyan-500/10 hover:border-cyan-500/50 transition-all duration-200 text-center"
            >
              Kembali ke Beranda
            </NuxtLink>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'default'
})

const lastUpdated = ref('15 Januari 2024')
</script>

<style scoped>
.prose ul {
  margin-top: 0.5rem;
  margin-bottom: 0.5rem;
}
</style>

