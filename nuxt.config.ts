export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: [
    // '@nuxtjs/supabase', // Disabled sementara - akan diaktifkan setelah setup database
    '@nuxtjs/tailwindcss'
  ],
  nitro: {
    preset: 'vercel'
  },
  // supabase: {
  //   redirectOptions: {
  //     login: '/login',
  //     callback: '/auth/callback',
  //     exclude: ['/']
  //   }
  // },
  css: ['~/assets/css/main.css', '~/assets/css/datatable-dark.css', '~/assets/css/input-dark.css', '~/assets/css/input-login.css'],
  runtimeConfig: {
    public: {
      // supabaseUrl: process.env.SUPABASE_URL,
      // supabaseKey: process.env.SUPABASE_ANON_KEY
    }
  }
})

