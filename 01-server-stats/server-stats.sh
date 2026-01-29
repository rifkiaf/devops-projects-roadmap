#!/bin/bash

# Menampilkan Header
clear
echo "==============================="
echo "    Server Stats Report"
echo "==============================="
echo

# Menampilkan Total Penggunaan CPU
echo "### Total Penggunaan CPU ###"
echo "----------------------------"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "Penggunaan CPU: " 100 - $1"%"}'
echo

# Menampilkan Total Penggunaan Memori
echo "### Total Penggunaan Memori ###"
echo "-----------------------------"
free -h | awk '/Mem:/ {print "Terpakai: " $3 " | Tersisa: " $4 " | Total: " $2 " | Persentase Terpakai: " $3/$2*100 "%"}'
echo

# Menampilkan Total Penggunaan Disk
echo "### Total Penggunaan Disk ###"
echo "----------------------------"
df -h | awk '$NF=="/" {print "Terpakai: " $3 " | Tersisa: " $4 " | Total: " $2 " | Persentase Terpakai: " $5}'
echo

# Menampilkan 5 Proses Teratas Berdasarkan Penggunaan CPU
echo "### 5 Proses Teratas Berdasarkan Penggunaan CPU ###"
echo "-------------------------------------------------"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | awk 'NR>1 {print "PID: " $1 " | Command: " $2 " | CPU: " $3"%"}'
echo

# Menampilkan 5 Proses Teratas Berdasarkan Penggunaan Memori
echo "### 5 Proses Teratas Berdasarkan Penggunaan Memori ###"
echo "----------------------------------------------------"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | awk 'NR>1 {print "PID: " $1 " | Command: " $2 " | Mem: " $3"%"}'
echo

# Menampilkan Versi Sistem Operasi
echo "### Versi Sistem Operasi ###"
echo "----------------------------"
uname -a
echo

# Menampilkan Waktu Aktif (Uptime)
echo "### Waktu Aktif (Uptime) ###"
echo "----------------------------"
uptime -p
echo

# Menampilkan Rata-Rata Beban Sistem (Load Average)
echo "### Rata-Rata Beban Sistem (Load Average) ###"
echo "---------------------------------------------"
uptime | awk -F'load average:' '{ print "Load Average: " $2 }'
echo

# Menampilkan Pengguna yang Masuk
echo "### Pengguna yang Masuk ###"
echo "--------------------------"
who
echo

# Menampilkan Upaya Masuk yang Gagal
echo "### Upaya Masuk yang Gagal (Login Failures) ###"
echo "---------------------------------------------"
lastb | head -n 10
echo

# Opsional: Jika ingin menambahkan limit pada failed login yang dicatat
# Cek apakah `faillog` ada (tergantung distro dan konfigurasi)
if command -v faillog &> /dev/null
then
    echo "### Upaya Masuk yang Gagal (Menggunakan faillog) ###"
    echo "-----------------------------------------------"
    faillog -a | head -n 10
    echo
fi

echo "==============================="
echo "     End of Server Stats"
echo "==============================="
