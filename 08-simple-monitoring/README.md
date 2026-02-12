# 📊 Simple System Monitoring

Proyek monitoring sederhana menggunakan Docker untuk memantau kesehatan CPU, RAM, dan Disk secara real-time.

## 🛠️ Stack

- **Prometheus**: Database metrik
- **Grafana**: Dashboard visualisasi
- **Node Exporter**: Pengumpul data sistem

## 🚀 Cara Menjalankan

### 1. Persiapan

Beri izin eksekusi pada semua skrip:

```bash
chmod +x *.sh
```

### 2. Jalankan Monitoring

```bash
./setup.sh
```

Buka browser: `http://localhost:3000` (User/Pass: **admin/admin**)

### 3. Setup Grafana Dashboard

Setelah login ke Grafana, ikuti langkah berikut:

#### a. Tambah Data Source

1. Klik **☰ Menu** → **Connections** → **Data Sources**
2. Klik **Add data source**
3. Pilih **Prometheus**
4. Isi konfigurasi:
   - **Name**: `Prometheus`
   - **URL**: `http://prometheus:9090`
5. Klik **Save & Test** (harus muncul "Data source is working")

#### b. Import Dashboard

1. Klik **☰ Menu** → **Dashboards**
2. Klik **New** → **Import**
3. Masukkan ID Dashboard: `1860` (Node Exporter Full)
4. Klik **Load**
5. Pilih **Prometheus** sebagai data source
6. Klik **Import**

Dashboard siap digunakan! Anda akan melihat metrik CPU, RAM, Disk, Network secara real-time.

### 4. Uji Coba (Stress Test)

Gunakan skrip ini untuk melihat grafik CPU naik di Grafana:

```bash
./test_dashboard.sh
```

### 5. Hapus/Bersihkan

```bash
./cleanup.sh
```

## 📍 Akses Cepat

- **Grafana**: http://localhost:3000
- **Prometheus**: http://localhost:9090
- **Node Exporter**: http://localhost:9100/metrics

---

## 📝 Catatan

Pastikan Docker dan Docker Compose sudah terinstall di sistem Anda sebelum menjalankan proyek ini.