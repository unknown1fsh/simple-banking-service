# BankApp

Basit bir bankacılık uygulaması. Hesap oluşturma, bakiye kontrolü ve para transferi işlemlerini destekler.

## Özellikler
- Hesap oluşturma
- Para yatırma (Kredi)
- Para çekme (Debit)
- Bakiye görüntüleme
- İşlem geçmişi

## Gereksinimler
- Java 17
- Spring Boot
- MySQL
- Gradle
- IDE (NetBeans 22 önerilir)

## Kurulum

1. **Projeyi klonlayın:**
   ```bash
   git clone https://github.com/kullaniciadi/bankapp.git

    MySQL veritabanını oluşturun:

    sql

CREATE DATABASE bankapp;

Veritabanı ayarlarını yapılandırın: src/main/resources/application.properties dosyasını düzenleyin:

properties

spring.datasource.url=jdbc:mysql://localhost:3306/bankapp
spring.datasource.username=root
spring.datasource.password=12345

Gradle bağımlılıklarını indirin: Proje dizininde aşağıdaki komutu çalıştırın:

bash

gradle build

Uygulamayı çalıştırın:

bash

    gradle bootRun

MySQL Yedeği

Veritabanı yedeğini almak için:

bash

mysqldump -u root -p bankapp > C:\Users\selim\Desktop\bankapp_full.sql

API Testleri

API’leri test etmek için Postman Collection dosyasını kullanabilirsiniz.
