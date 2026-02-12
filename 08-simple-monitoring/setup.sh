#!/bin/bash
set -e # Berhenti jika ada error

echo "🚀 [SETUP] Memulai infrastruktur monitoring..."

# Jalankan docker compose
docker compose up -d

echo "✅ [SUCCESS] Monitoring sudah jalan!"
echo "Akses Grafana: http://localhost:3000 (admin/admin)"