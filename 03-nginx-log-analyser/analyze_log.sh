#!/bin/bash

# Nama file log
LOG_FILE="nginx-access.log"

# Cek apakah file log ada
if [ ! -f "$LOG_FILE" ]; then
  echo "File log tidak ditemukan: $LOG_FILE"
  exit 1
fi

echo "=== Analisis Log Nginx ==="
echo

# Top 5 IP dengan permintaan terbanyak
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{print $2 " - " $1 " requests"}'
echo

# Top 5 jalur yang paling banyak diminta
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{print $2 " - " $1 " requests"}'
echo

# Top 5 kode status respons
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{print $2 " - " $1 " requests"}'
echo

# Top 5 User Agent
echo "Top 5 User Agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{$1=$1; print $0 " requests"}'
echo

echo "=== Analisis Selesai ==="
