#!/bin/bash

# --- 1. Validasi Input ---
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_nginx_log>"
    exit 1
fi

LOG_FILE="$1"

# Cek apakah file ada dan bisa dibaca
if [ ! -r "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' tidak ditemukan atau tidak dapat dibaca."
    exit 1
fi

echo -e "Analysing logs from: ${LOG_FILE}\n"

# Fungsi helper agar kode tidak repetitif
analyze_top_5() {
    local title=$1
    local column=$2
    
    echo "Top 5 $title:"
    awk "{print \$$column}" "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
    awk '{print $2 " - " $1 " requests"}'
    echo ""
}

# --- 2. Eksekusi Analisis ---

# Top 5 IP
analyze_top_5 "IP addresses with the most requests" 1

# Top 5 Paths
analyze_top_5 "most requested paths" 7

# Top 5 Status Codes
analyze_top_5 "response status codes" 9

# --- 3. Top 5 User Agent ---
echo "Top 5 User Agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk -F' ' '{
    count=$1; 
    $1=""; 
    sub(/^ +/, ""); 
    print $0 " - " count " requests"
}'

echo "=== Analisis Selesai ==="