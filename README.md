# Final Project UTCC - Asset IT Support System

ระบบจัดการอุปกรณ์ IT สำหรับ UTCC

## 📁 โครงสร้างโปรเจกต์

```
final_project_Utcc/
├── asset_it_support_nextjs/      # Next.js Frontend
│   ├── src/                       # Source code
│   ├── public/                    # Static files
│   ├── package.json               # Dependencies
│   └── Dockerfile                 # Docker configuration
│
└── asset_it_support_spring_boot/  # Spring Boot Backend
    ├── src/main/java/             # Java source code
    ├── src/main/resources/        # Configuration files
    ├── pom.xml                    # Maven dependencies
    └── Dockerfile                 # Docker configuration (ถ้ามี)
```

## 🚀 เริ่มต้นใช้งาน

### สำหรับการรันบน IntelliJ IDEA / WebStorm

**ดูคู่มือการรันแบบละเอียดได้ที่: [RUN.md](./RUN.md)**

### สรุปแบบย่อ:

1. **เตรียม Database**
   - ติดตั้ง MySQL/MariaDB
   - สร้าง database ชื่อ `db_asset`

2. **รัน Spring Boot Backend** (IntelliJ IDEA)
   - เปิดโฟลเดอร์ `asset_it_support_spring_boot`
   - รัน `AssetItSupportApplication.java`
   - Backend จะรันที่ `http://localhost:8080`

3. **รัน Next.js Frontend** (WebStorm/IntelliJ IDEA)
   - เปิดโฟลเดอร์ `asset_it_support_nextjs`
   - รัน `npm install` เพื่อติดตั้ง dependencies
   - รัน `npm run dev`
   - Frontend จะรันที่ `http://localhost:3000`

## 🐳 Docker (สำหรับ Production)

โปรเจกต์นี้พร้อมสำหรับการทำ Docker containerization แล้ว!

**ดูคู่มือ Docker แบบละเอียดได้ที่: [DOCKER.md](./DOCKER.md)**

### วิธีที่ 1: ใช้ Makefile (Linux/Mac) หรือ PowerShell Script (Windows) ⚡

**Linux/Mac:**
```bash
# ดูคำสั่งทั้งหมด
make help

# Setup ครั้งแรก
make setup          # สร้าง .env file
make up-build       # Build และรันทั้งหมด

# คำสั่งที่ใช้บ่อย
make up             # เริ่ม services
make down           # หยุด services
make logs           # ดู logs
make ps             # ดูสถานะ containers
make restart        # Restart services
```

**Windows (PowerShell):**
```powershell
# ดูคำสั่งทั้งหมด
.\docker.ps1 help

# Setup ครั้งแรก
.\docker.ps1 setup      # สร้าง .env file
.\docker.ps1 up-build   # Build และรันทั้งหมด

# คำสั่งที่ใช้บ่อย
.\docker.ps1 up        # เริ่ม services
.\docker.ps1 down      # หยุด services
.\docker.ps1 logs      # ดู logs
.\docker.ps1 ps        # ดูสถานะ containers
.\docker.ps1 restart   # Restart services
```

### วิธีที่ 2: ใช้ Docker Compose โดยตรง

1. **สร้างไฟล์ `.env`** (คัดลอกจาก `env.example`)
2. **รัน Docker Compose**:
   ```bash
   docker-compose up -d --build
   ```
3. **เข้าถึงแอปพลิเคชัน**:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8080

### ไฟล์ Docker ที่มี:
- ✅ `docker-compose.yml` - รวม MySQL, Spring Boot, และ Next.js
- ✅ `asset_it_support_spring_boot/Dockerfile` - Spring Boot container
- ✅ `asset_it_support_nextjs/Dockerfile` - Next.js container
- ✅ `env.example` - ตัวอย่าง environment variables
- ✅ `Makefile` - คำสั่ง Docker แบบง่าย (Linux/Mac)
- ✅ `Makefile.windows` - คำสั่ง Docker สำหรับ Windows

## 📋 Requirements

- **Java**: 17+
- **Node.js**: 18+ (สำหรับ Next.js)
- **MySQL/MariaDB**: 8.0+
- **Maven**: 3.6+ (หรือใช้ Maven Wrapper ที่มากับโปรเจกต์)
- **npm**: 9+

## 🔗 Links

- GitHub Repository: https://github.com/Vorapol2004/Final_Project_UTCC.git
- Frontend: http://localhost:3000
- Backend API: http://localhost:8080

## 📝 License

This project is for educational purposes.

