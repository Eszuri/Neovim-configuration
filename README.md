# Neovim-configuration

Konfigurasi Neovim — koleksi pengaturan, plugin, keymap, dan skrip tambahan untuk meningkatkan pengalaman menggunakan Neovim.

---

## ⚙️ Fitur & Isi Konfigurasi

- Memuat plugin dan pengaturan terkait (melalui file dalam `configuration/`)  
- Key mappings khusus (file di `keymap/`)  
- Integrasi CoC untuk autocomplete & LSP (konfigurasi di `coc-settings.json`)  
- Struktur modular agar mudah diubah / diperluas  

---

## Requirement (persyaratan)
1. node js (LTS)
2. C compiler (gcc, cc, clang, zig)
   > untuk compile dari plugin treesitter

---
## 🛠️ Instalasi

> **Untuk Windows**

1. Clone repositori ini di directory mana saja
   ```bash
   git clone https://github.com/Eszuri/Neovim-Configuration.git
2. buka folder dan salin file **init.nvim** dan folder **autoload** dan tempel di directory berikut:
   > C:\\Users\Your_Account\AppData\Local\nvim
3. salin juga folder **configuration** dan **keymap** dan tempel di directory berikut:
   > C:\\Users\Your_Account\\.config\nvim

   ***jika belum ada folder maka new folder saja***

**NOTE:**
> compiler bisa gunakan dengan gcc, diinstal dengan chocolatey package manager (choco install mingw)

---

## GUI Neovim 
1. [Neovide](https://neovide.dev/)
2. [Nvy](https://github.com/RMichelsen/Nvy)
