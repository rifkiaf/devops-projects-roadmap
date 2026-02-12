#!/bin/bash
echo "🛑 Menghentikan semua layanan monitoring..."
docker compose down

echo "🗑️ Menghapus data volume (opsional)..."
# docker volume prune -f 

echo "✅ Sistem bersih!"