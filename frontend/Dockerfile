# Dockerfile del frontend (./frontend/Dockerfile)
FROM oven/bun:1.1.5-slim AS builder

WORKDIR /app
COPY package.json .
RUN bun install --frozen-lockfile

COPY . .
RUN bun run build

FROM oven/bun:1.1.5-slim
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY package.json .

EXPOSE 3000
CMD ["bun", "run", "preview"]