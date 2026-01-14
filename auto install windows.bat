@echo off
setlocal ENABLEDELAYEDEXPANSION

REM ===============================
REM Konfirmasi eksekusi
REM ===============================

echo =====================================
echo  NEOVIM INSTALLER
echo  Script ini akan:
echo  - Memindahkan konfigurasi Neovim
echo  - Membuat folder jika belum ada
echo  - Menghapus folder installer setelah selesai
echo =====================================
echo.
set /p CONFIRM=Ketik Y untuk melanjutkan: 

if /I not "%CONFIRM%"=="Y" (
    echo.
    echo Dibatalkan. Tidak ada perubahan yang dilakukan.
    pause
    exit /b
)

echo.
echo Konfirmasi diterima, melanjutkan...
echo.

REM ===============================
REM Ambil nama user Windows
REM ===============================

set USERNAME=%USERNAME%

REM Path tujuan
set NVIM_CONFIG=C:\Users\%USERNAME%\.config\nvim
set NVIM_LOCAL=C:\Users\%USERNAME%\AppData\Local\nvim

REM Path installer
set CURRENT_DIR=%~dp0
set BAT_FILE=%~f0

REM ===============================
REM Buat folder tujuan jika belum ada
REM ===============================

if not exist "%NVIM_CONFIG%" (
    echo Membuat folder: %NVIM_CONFIG%
    mkdir "%NVIM_CONFIG%"
)

if not exist "%NVIM_LOCAL%" (
    echo Membuat folder: %NVIM_LOCAL%
    mkdir "%NVIM_LOCAL%"
)

REM ===============================
REM Pindahkan folder ke .config\nvim
REM ===============================

for %%F in (configuration dll keymap) do (
    if exist "%%F" (
        echo Memindahkan folder %%F ke %NVIM_CONFIG%
        move "%%F" "%NVIM_CONFIG%"
    )
)

REM ===============================
REM Pindahkan autoload ke AppData\Local\nvim
REM ===============================

if exist "autoload" (
    echo Memindahkan folder autoload ke %NVIM_LOCAL%
    move "autoload" "%NVIM_LOCAL%"
)

REM ===============================
REM Pindahkan file init.vim & coc-settings.json
REM ===============================

for %%F in (init.vim coc-settings.json) do (
    if exist "%%F" (
        echo Memindahkan file %%F ke %NVIM_LOCAL%
        move "%%F" "%NVIM_LOCAL%"
    )
)

echo.
echo =====================================
echo Setup selesai.
echo Folder installer akan dihapus...
echo =====================================

REM ===============================
REM Hapus folder & file .bat itu sendiri
REM ===============================

cmd /c "timeout /t 2 >nul & del /f /q \"%BAT_FILE%\" & rmdir /s /q \"%CURRENT_DIR%\""
