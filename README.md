# Laundry Management System (Matrix Algorithm) 🧺

Aplikasi manajemen operasional laundry sederhana yang dibangun menggunakan bahasa pemrograman **Pascal**. Proyek ini menerapkan konsep **Algoritma Matriks** untuk mengelola data transaksi dan pemetaan status layanan secara efisien.

## 👤 Identitas Pengembang
- **Nama** : Rizkya Gusnaldy Kalia
- **NIM** : 10124190

## 🧠 Konsep Algoritma
Berbeda dengan sistem laundry biasa, program ini menggunakan struktur data **Matriks (Array 2 Dimensi)** untuk:
- **Pemetaan Data**: Menyimpan informasi pelanggan, berat cucian, dan status dalam baris dan kolom matriks.
- **Kalkulasi Tarif**: Melakukan operasi aritmatika pada elemen matriks untuk menghitung total biaya berdasarkan kategori layanan.
- **Manajemen Slot**: (Jika ada) Mengelola penempatan rak cucian menggunakan koordinat matriks.

## 🚀 Fitur Utama
- ✅ **Input Data Pelanggan**: Nama, berat (kg), dan jenis layanan.
- ✅ **Kalkulasi Biaya Otomatis**: Menghitung tarif berdasarkan bobot dan jenis layanan (Reguler/Ekspres).
- ✅ **Cetak Nota**: Menampilkan ringkasan transaksi dari penyimpanan matriks.
- ✅ **Laporan Sederhana**: Menampilkan semua daftar transaksi aktif dalam format tabel.

## 🛠️ Persyaratan Sistem
- **Free Pascal Compiler (FPC)** atau IDE Turbo Pascal.
- Terminal/Command Prompt untuk menjalankan aplikasi.

## 📥 Cara Menjalankan
1. Clone repositori ini:
 ```bash
 git clone [https://github.com/username/laundry-matrix-pascal.git](https://github.com/username/laundry-matrix-pascal.git)

```

2. Buka file `laundry.pas` di compiler Pascal kamu.
3. *Compile* dan jalankan:
```bash
fpc laundry.pas
./laundry

```



## 📝 Contoh Logika Kode

```pascal
{ Contoh representasi matriks untuk data laundry }
var
  dataLaundry : array[1..100, 1..5] of string; 
  { Baris: ID Pelanggan, Kolom: Nama, Berat, Harga, Status }

```

---

© 2025 Rizkya Gusnaldy Kalia


**Apakah kamu ingin saya buatkan satu "Bio Profile" atau "About Me" yang merangkum semua keahlian ini agar orang yang mengunjungi GitHub-mu langsung kagum?**

```
