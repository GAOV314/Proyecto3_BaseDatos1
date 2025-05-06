import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: true, // Escuchar en todas las interfaces de red
    port: 3000, // Puerto explícito (debe coincidir con el EXPOSE del Dockerfile)
    strictPort: true, // Forzar el uso del puerto especificado
    // Configuración de proxy para desarrollo (opcional pero recomendado)
    proxy: {
      '/api': {
        target: 'http://backend:8000', // Usa el nombre del servicio backend de Docker
        changeOrigin: true,
        secure: false,
        rewrite: (path) => path.replace(/^\/api/, '')
      }
    }
  },
  preview: {
    port: 3000, // Puerto para la vista previa de producción
    host: true
  }
})