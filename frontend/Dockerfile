# Usa la imagen oficial de Bun
FROM oven/bun:1

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY . .

# Instala las dependencias
RUN bun install

# Expone el puerto por defecto de Vite
EXPOSE 5173

# Usa bun para correr el servidor de desarrollo
CMD ["bun", "run", "dev"]
