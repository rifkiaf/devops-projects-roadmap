# Log Archive Tool

Alat Bash sederhana untuk mengarsipkan file log (.log) ke dalam file tar.gz dengan timestamp, sekaligus mengekstraknya ke folder unik.

## Fitur

- Mengarsipkan log dari direktori yang ditentukan
- Arsip tersimpan di folder `archives/`
- Folder ekstrak unik di `test-extract/`
- Mencatat aktivitas di `archives/archive.log`

## Cara Pakai

1. Pastikan script executable:
```bash
chmod +x log-archive.sh
```

2. Jalankan script:
```bash
./log-archive.sh sample-logs
```

3. Cek hasil:
   - Arsip di `archives/`
   - Ekstrak di `test-extract/<nama_arsip>/`
   - Log aktivitas di `archives/archive.log`

## Struktur Folder

```
02-log-archive-tool/
├── log-archive.sh
├── sample-logs/
├── archives/
└── test-extract/
```