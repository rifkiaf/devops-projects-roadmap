# 🔍 Nginx Log Analyser

Script Bash untuk menganalisis log akses Nginx secara otomatis dan cepat.

## Fitur
- Top 5 IP addresses dengan permintaan terbanyak
- Top 5 jalur (paths) yang paling sering diakses
- Top 5 kode status respons (HTTP status codes)
- Top 5 User Agents terbanyak

## Cara Pakai

```bash
git clone https://github.com/rifkiaf.git
cd 03-nginx-log-analyser
chmod +x analyze_log.sh
./analyze_log.sh nginx-access.log
```