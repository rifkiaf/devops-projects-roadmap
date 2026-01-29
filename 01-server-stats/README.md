# 📊 Server Stats Monitor (Bash CLI)

Script ini adalah alat pemantauan server berbasis baris perintah (CLI) yang ringan. Dirancang untuk memberikan ringkasan cepat tentang kesehatan server Linux tanpa perlu menginstal alat monitoring yang berat.

## 🌟 Fitur Utama
Script ini mengotomatiskan pengumpulan data dari berbagai perintah sistem Linux untuk menampilkan:
- **Analisis CPU**: Menghitung total penggunaan CPU (100% - idle).
- **Statistik Memori**: Detail RAM yang terpakai, bebas, dan persentasenya.
- **Monitoring Disk**: Status penyimpanan pada direktori root (`/`).
- **Analisis Proses**: Menampilkan 5 aplikasi teratas yang paling memakan sumber daya.
- **Informasi OS & Uptime**: Mengetahui identitas sistem dan sudah berapa lama server berjalan.
- **Audit Keamanan**: Melacak siapa yang sedang login dan mendeteksi upaya login ilegal (brute force) melalui `lastb`.