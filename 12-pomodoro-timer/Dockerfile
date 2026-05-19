# ==========================================
# STAGE 1: Build Environment (Node.js 22 LTS)
# ==========================================
FROM node:22-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci --silent

COPY . .

RUN npm run build

# ==========================================
# STAGE 2: Production Environment (Nginx Non-Root)
# ==========================================
FROM nginxinc/nginx-unprivileged:stable-alpine

USER root
RUN rm -f /etc/nginx/conf.d/*
USER 101

COPY --from=builder /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]