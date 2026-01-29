# Penganalisis Log Nginx

Skrip shell sederhana untuk menganalisis file log akses Nginx dan menghasilkan statistik dasar tentang permintaan yang masuk.

## Fitur

Skrip ini memberikan informasi berikut dari file log Nginx:
- 5 alamat IP teratas dengan permintaan terbanyak
- 5 jalur permintaan yang paling banyak diminta
- 5 kode status respons teratas
- 5 agen pengguna teratas

## Cara Penggunaan

1. Unduh file log akses Nginx dan simpan dengan nama `nginx-access.log` di direktori yang sama dengan skrip.

2. Berikan izin eksekusi pada skrip:
```bash
chmod +x analyze_log.sh
```

3. Jalankan skrip untuk melihat hasil analisis:
```bash
./analyze_log.sh
```

## Contoh Output

```
=== Analisis Log Nginx ===

Top 5 IP addresses with the most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
...

Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
...

Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
...

Top 5 User Agents:
DigitalOcean Uptime Probe - 4347 requests
Mozilla/5.0 Chrome - 513 requests
...

=== Analisis Selesai ===
```

## Persyaratan

- Skrip ini membutuhkan file log akses Nginx dengan format standar.
- Skrip menggunakan perintah `awk`, `sort`, `uniq`, `head` untuk memproses dan menganalisis log.