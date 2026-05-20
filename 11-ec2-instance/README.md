# AWS EC2 Instance Setup

Panduan membuat server Ubuntu di AWS EC2 dan deploy website statis dengan Nginx.

---

## 1. Launch Instance di AWS Console

1. Buka **EC2** → **Instances** → klik **Launch instances**
2. **Name**: `ec2-instances`
3. **AMI**: Ubuntu Server 24.04 LTS *(Free Tier eligible)*
4. **Instance type**: `t2.micro` atau `t3.micro`
5. **Key pair** → klik **Create new key pair**:
   - Name: `nama-kunci`
   - Type: `RSA`
   - Format: `.pem`
   - Simpan file `nama-kunci.pem` di folder proyek lokal
6. **Security Group** — centang ketiganya:
   - ✅ Allow SSH from `Anywhere (0.0.0.0/0)`
   - ✅ Allow HTTP from the internet
   - ✅ Allow HTTPS from the internet
7. **Storage**: biarkan default `8 GiB gp3`
8. Klik **Launch instance**

---

## 2. Koneksi via SSH

Buka terminal di folder proyek, lalu atur izin file key pair:

```bash
chmod 400 nama-kunci.pem
```

Ambil **Public IP** dari dashboard EC2, lalu hubungkan ke server:

```bash
ssh -i nama-kunci.pem ubuntu@<PUBLIC_IP>
```

> Ketik `yes` saat muncul prompt konfirmasi, lalu tekan Enter.

---

## 3. Setup Server & Install Nginx

Update sistem:

```bash
sudo apt update && sudo apt upgrade -y
```

Install Nginx:

```bash
sudo apt install nginx -y
```

Cek status Nginx:

```bash
sudo systemctl status nginx
```

> Nginx aktif jika muncul `Active: active (running)`. Tekan `q` untuk keluar.

---

## 4. Deploy Website Statis

Jalankan perintah berikut untuk membuat halaman HTML:

```bash
sudo bash -c 'cat <<EOF> /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>EC2 Sukses Terdeploy!</title>
    <style>
        body { font-family: sans-serif; background: #0f172a; color: #f8fafc; text-align: center; padding-top: 50px; }
        .card { display: inline-block; background: #1e293b; padding: 30px; border-radius: 10px; }
        h1 { color: #f97316; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Server EC2 Berhasil Berjalan!</h1>
    </div>
</body>
</html>
EOF'
```

---

## 5. Verifikasi Hasil

Buka browser, akses IP publik server via HTTP:

```
http://<PUBLIC_IP>
```

> ✅ Jika halaman **"Server EC2 Berhasil Berjalan!"** muncul — deployment 100% sukses.