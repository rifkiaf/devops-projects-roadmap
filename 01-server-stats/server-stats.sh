#!/bin/bash

# =================================================================
# Script Name   : server-stats.sh
# Description   : Linux Server Performance Analysis Tool
# Author        : Rifki Ahmad Fahreizi
# Date          : 2026
# =================================================================

# Variabel Warna untuk Tampilan Terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color (Reset)

echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}       SERVER PERFORMANCE STATISTICS       ${NC}"
echo -e "${BLUE}===========================================${NC}"

# 1. Total CPU Usage
echo -e "\n${YELLOW}[ CPU USAGE ]${NC}"
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
cpu_usage=$(awk "BEGIN {print 100 - $cpu_idle}")
echo -e "Total CPU Usage: ${GREEN}${cpu_usage}%${NC}"

# 2. Total Memory Usage (Free vs Used with %)
echo -e "\n${YELLOW}[ MEMORY USAGE ]${NC}"
# Menggunakan 'free -m' untuk perhitungan integer yang akurat
free -m | awk 'NR==2{printf "Used: %sMB | Free: %sMB | Total: %sMB\nUsage Rate: %.2f%%\n", $3, $4, $2, $3*100/$2}'

# 3. Total Disk Usage (Free vs Used with %)
echo -e "\n${YELLOW}[ DISK USAGE ]${NC}"
df -h / | awk 'NR==2{printf "Used: %s | Free: %s | Total: %s\nUsage Rate: %s\n", $3, $4, $2, $5}'

# 4. Top 5 Processes by CPU Usage
echo -e "\n${YELLOW}[ TOP 5 PROCESSES BY CPU ]${NC}"
printf "%-7s %-20s %s\n" "PID" "COMMAND" "CPU(%)"
# Logika AWK di bawah menangani nama proses yang mengandung spasi agar kolom tetap lurus
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | tail -n 5 | awk '{
    pid=$1; cpu=$NF; $1=$NF=""; 
    sub(/^ +/, "", $0); sub(/ +$/, "", $0);
    printf "%-7s %-20s %s%%\n", pid, substr($0, 1, 20), cpu
}'

# 5. Top 5 Processes by Memory Usage
echo -e "\n${YELLOW}[ TOP 5 PROCESSES BY MEMORY ]${NC}"
printf "%-7s %-20s %s\n" "PID" "COMMAND" "MEM(%)"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | tail -n 5 | awk '{
    pid=$1; mem=$NF; $1=$NF=""; 
    sub(/^ +/, "", $0); sub(/ +$/, "", $0);
    printf "%-7s %-20s %s%%\n", pid, substr($0, 1, 20), mem
}'

# --- STRETCH GOALS (Tambahan) ---
echo -e "\n${BLUE}===========================================${NC}"
echo -e "${BLUE}           SYSTEM INFORMATION              ${NC}"
echo -e "${BLUE}===========================================${NC}"

# OS Version
echo -ne "${GREEN}OS Version:${NC} "
[ -f /etc/os-release ] && grep "PRETTY_NAME" /etc/os-release | cut -d'"' -f2 || uname -sr

# Uptime
echo -ne "${GREEN}Uptime:${NC} " && uptime -p

# Load Average
echo -ne "${GREEN}Load Average:${NC} " && cat /proc/loadavg | awk '{print $1, $2, $3}'

# Logged in Users
echo -ne "${GREEN}Logged in Users:${NC} " && who | wc -l

# Failed Login Attempts (Hanya jika dijalankan dengan sudo)
echo -ne "${GREEN}Failed Logins:${NC} "
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}(Run as sudo to see failed logins)${NC}"
else
    failed_count=$(lastb | grep -v "btmp begins" | grep -v "^$" | wc -l)
    echo -e "${RED}$failed_count attempts${NC}"
fi

echo -e "${BLUE}===========================================${NC}"