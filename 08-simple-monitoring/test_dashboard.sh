#!/bin/bash
echo "🔥 Memulai Stress Test CPU (Beban 90%+)..."
echo "Silakan pantau dashboard Grafana di http://localhost:3000"

# Stress selama 60 detik di semua core
stress --cpu $(nproc) --timeout 60s

echo "✅ Stress test selesai. Grafik di Grafana seharusnya menunjukkan penurunan sekarang."