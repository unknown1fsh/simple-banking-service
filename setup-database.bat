@echo off
REM MySQL Veritabanı Kurulum Scripti (Windows)
REM MySQL path: C:\Program Files\MySQL\MySQL Server 8.0

echo MySQL Veritabanı kurulumu başlatılıyor...
echo.

REM Proje dizinini al
set PROJECT_DIR=%~dp0

REM MySQL bin klasörüne git
cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"

REM SQL scriptini çalıştır
mysql.exe -u root -p12345 < "%PROJECT_DIR%setup-database.sql"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Veritabanı başarıyla oluşturuldu!
) else (
    echo.
    echo HATA: Veritabanı oluşturulurken bir hata oluştu.
    echo Lütfen MySQL'in çalıştığından ve şifrenin doğru olduğundan emin olun.
)

pause

