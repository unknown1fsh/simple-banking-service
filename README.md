# 🏦 Banking Service

[English](#english) | [Türkçe](#türkçe)

---

<a name="türkçe"></a>
# 🇹🇷 Türkçe

Modern bir Spring Boot tabanlı bankacılık servisi. RESTful API ile hesap yönetimi, para yatırma/çekme ve işlem geçmişi özelliklerini sunar.

## ✨ Özellikler

- ✅ **Hesap Yönetimi**: Hesap bilgilerini görüntüleme ve sorgulama
- 💰 **Para Yatırma**: Hesaba para yatırma işlemleri
- 💸 **Para Çekme**: Hesaptan para çekme işlemleri
- 📊 **İşlem Geçmişi**: Tüm işlemlerin detaylı geçmişi
- 🔒 **Güvenlik**: Validation ve merkezi hata yönetimi
- 🎨 **Modern Arayüz**: Kullanıcı dostu web test arayüzü
- ⚡ **Performans**: Hızlı ve güvenilir API yanıtları

## 📋 Gereksinimler

- **Java 17** veya üzeri
- **Spring Boot 3.3.4**
- **MySQL 8.0** veya üzeri
- **Gradle 7.x** veya üzeri

## 🚀 Hızlı Başlangıç

### 1. Projeyi Klonlayın

```bash
git clone https://github.com/unknown1fsh/bankapp.git
cd bankapp
```

### 2. Veritabanını Kurun

#### Windows:
```bash
.\setup-database.bat
```

#### Linux/Mac:
```bash
mysql -u root -p < setup-database.sql
```

Veya MySQL Workbench'te `setup-database.sql` dosyasını çalıştırın.

### 3. Veritabanı Ayarlarını Yapılandırın

`src/main/resources/application.properties` dosyasında MySQL bilgilerinizi güncelleyin:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bankapp
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD
```

### 4. Uygulamayı Çalıştırın

```bash
# Windows
.\gradlew.bat bootRun

# Linux/Mac
./gradlew bootRun
```

Uygulama `http://localhost:8080` adresinde çalışacaktır.

## 🧪 Test Arayüzü

Uygulama başlatıldıktan sonra tarayıcınızda şu adresi açın:

```
http://localhost:8080/
```

Modern web arayüzü ile tüm API'leri test edebilirsiniz:

- 📱 Responsive tasarım (mobil uyumlu)
- ⚡ Gerçek zamanlı işlemler
- 🔄 Otomatik bakiye güncelleme
- 💡 Kullanıcı dostu hata mesajları
- 📊 Detaylı işlem geçmişi görüntüleme

## 📡 API Dokümantasyonu

### Base URL
```
http://localhost:8080/account/v1
```

### Endpoint'ler

#### 1. Hesap Bilgilerini Getir
```http
GET /account/v1/{accountNumber}
```

**Örnek:**
```bash
curl http://localhost:8080/account/v1/BA123456789
```

**Yanıt:**
```json
{
  "accountNumber": "BA123456789",
  "owner": "Selim Yılmaz",
  "balance": 1899.00,
  "createDate": "15-01-2023 07:30:00",
  "transactions": [...]
}
```

#### 2. Para Yatırma
```http
POST /account/v1/credit/{accountNumber}
Content-Type: application/json

{
  "amount": 100.00
}
```

**Örnek:**
```bash
curl -X POST http://localhost:8080/account/v1/credit/BA123456789 \
  -H "Content-Type: application/json" \
  -d '{"amount": 100.00}'
```

#### 3. Para Çekme
```http
POST /account/v1/debit/{accountNumber}
Content-Type: application/json

{
  "amount": 50.00
}
```

**Örnek:**
```bash
curl -X POST http://localhost:8080/account/v1/debit/BA123456789 \
  -H "Content-Type: application/json" \
  -d '{"amount": 50.00}'
```

### Hata Kodları

| Kod | Açıklama |
|-----|----------|
| 200 | Başarılı |
| 400 | Geçersiz istek / Yetersiz bakiye |
| 404 | Hesap bulunamadı |
| 500 | Sunucu hatası |

## 🧪 Test

### Unit Testler
```bash
.\gradlew.bat test
```

### Postman Collection
`collection.json` dosyasını Postman'e import ederek API'leri test edebilirsiniz.

## 📁 Proje Yapısı

```
bankapp/
├── src/
│   ├── main/
│   │   ├── java/com/bankapp/
│   │   │   ├── controller/      # REST API Controller'ları
│   │   │   ├── service/         # İş mantığı
│   │   │   ├── repository/      # Veritabanı erişimi
│   │   │   ├── entity/          # JPA Entity sınıfları
│   │   │   ├── model/           # DTO ve Request/Response modelleri
│   │   │   ├── exception/       # Özel exception sınıfları
│   │   │   └── config/          # Yapılandırma sınıfları
│   │   └── resources/
│   │       ├── static/         # Web arayüzü (index.html)
│   │       └── application.properties
│   └── test/                    # Test dosyaları
├── setup-database.sql           # Veritabanı kurulum scripti
├── setup-database.bat           # Windows kurulum scripti
├── collection.json              # Postman collection
├── build.gradle                 # Gradle yapılandırması
└── README.md
```

## 🔧 Kullanılan Teknolojiler

- **Spring Boot 3.3.4** - Java framework
- **Spring Data JPA** - Veritabanı ORM
- **MySQL 8.0** - İlişkisel veritabanı
- **Lombok** - Kod tekrarını azaltma
- **Gradle** - Build ve dependency yönetimi
- **JUnit 5** - Unit test framework
- **Mockito** - Mock framework
- **Bootstrap 5** - Frontend framework

## 📝 Lisans

Bu proje eğitim amaçlıdır.

## 👤 Geliştirici

[unknown1fsh](https://github.com/unknown1fsh)

## 🤝 Katkıda Bulunma

1. Projeyi fork edin
2. Feature branch oluşturun (`git checkout -b feature/yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -m 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeni-ozellik`)
5. Pull Request açın

---

<a name="english"></a>
# 🇬🇧 English

A modern Spring Boot-based banking service. Provides account management, deposit/withdrawal, and transaction history features through RESTful API.

## ✨ Features

- ✅ **Account Management**: View and query account information
- 💰 **Deposit**: Deposit money to accounts
- 💸 **Withdrawal**: Withdraw money from accounts
- 📊 **Transaction History**: Detailed history of all transactions
- 🔒 **Security**: Validation and centralized error handling
- 🎨 **Modern Interface**: User-friendly web test interface
- ⚡ **Performance**: Fast and reliable API responses

## 📋 Requirements

- **Java 17** or higher
- **Spring Boot 3.3.4**
- **MySQL 8.0** or higher
- **Gradle 7.x** or higher

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/unknown1fsh/bankapp.git
cd bankapp
```

### 2. Setup Database

#### Windows:
```bash
.\setup-database.bat
```

#### Linux/Mac:
```bash
mysql -u root -p < setup-database.sql
```

Or run `setup-database.sql` in MySQL Workbench.

### 3. Configure Database Settings

Update your MySQL credentials in `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bankapp
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD
```

### 4. Run the Application

```bash
# Windows
.\gradlew.bat bootRun

# Linux/Mac
./gradlew bootRun
```

The application will run at `http://localhost:8080`.

## 🧪 Test Interface

After starting the application, open the following address in your browser:

```
http://localhost:8080/
```

Test all APIs with the modern web interface:

- 📱 Responsive design (mobile-friendly)
- ⚡ Real-time operations
- 🔄 Automatic balance updates
- 💡 User-friendly error messages
- 📊 Detailed transaction history view

## 📡 API Documentation

### Base URL
```
http://localhost:8080/account/v1
```

### Endpoints

#### 1. Get Account Details
```http
GET /account/v1/{accountNumber}
```

**Example:**
```bash
curl http://localhost:8080/account/v1/BA123456789
```

**Response:**
```json
{
  "accountNumber": "BA123456789",
  "owner": "Selim Yılmaz",
  "balance": 1899.00,
  "createDate": "15-01-2023 07:30:00",
  "transactions": [...]
}
```

#### 2. Deposit Money
```http
POST /account/v1/credit/{accountNumber}
Content-Type: application/json

{
  "amount": 100.00
}
```

**Example:**
```bash
curl -X POST http://localhost:8080/account/v1/credit/BA123456789 \
  -H "Content-Type: application/json" \
  -d '{"amount": 100.00}'
```

#### 3. Withdraw Money
```http
POST /account/v1/debit/{accountNumber}
Content-Type: application/json

{
  "amount": 50.00
}
```

**Example:**
```bash
curl -X POST http://localhost:8080/account/v1/debit/BA123456789 \
  -H "Content-Type: application/json" \
  -d '{"amount": 50.00}'
```

### Error Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 400 | Invalid request / Insufficient balance |
| 404 | Account not found |
| 500 | Server error |

## 🧪 Testing

### Unit Tests
```bash
.\gradlew.bat test
```

### Postman Collection
Import the `collection.json` file into Postman to test the APIs.

## 📁 Project Structure

```
bankapp/
├── src/
│   ├── main/
│   │   ├── java/com/bankapp/
│   │   │   ├── controller/      # REST API Controllers
│   │   │   ├── service/         # Business logic
│   │   │   ├── repository/      # Database access
│   │   │   ├── entity/          # JPA Entity classes
│   │   │   ├── model/           # DTO and Request/Response models
│   │   │   ├── exception/       # Custom exception classes
│   │   │   └── config/          # Configuration classes
│   │   └── resources/
│   │       ├── static/         # Web interface (index.html)
│   │       └── application.properties
│   └── test/                    # Test files
├── setup-database.sql           # Database setup script
├── setup-database.bat           # Windows setup script
├── collection.json              # Postman collection
├── build.gradle                 # Gradle configuration
└── README.md
```

## 🔧 Technologies Used

- **Spring Boot 3.3.4** - Java framework
- **Spring Data JPA** - Database ORM
- **MySQL 8.0** - Relational database
- **Lombok** - Reduce code boilerplate
- **Gradle** - Build and dependency management
- **JUnit 5** - Unit test framework
- **Mockito** - Mock framework
- **Bootstrap 5** - Frontend framework

## 📝 License

This project is for educational purposes.

## 👤 Developer

[unknown1fsh](https://github.com/unknown1fsh)

## 🤝 Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Open a Pull Request
