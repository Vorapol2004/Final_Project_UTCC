# 🐳 คู่มือการใช้งาน Docker

คู่มือนี้จะอธิบายวิธีการรันโปรเจกต์ Final Project UTCC ด้วย Docker

## 📋 สิ่งที่ต้องเตรียม

1. **Docker Desktop** - ติดตั้งและรัน Docker Desktop
2. **Docker Compose** - มักจะมากับ Docker Desktop แล้ว

ตรวจสอบว่าติดตั้งแล้ว:
```bash
docker --version
docker-compose --version
```

## 🚀 วิธีการรันด้วย Docker

### วิธีที่ 1: ใช้ Makefile หรือ PowerShell Script (แนะนำ) ⚡

**Linux/Mac:**
```bash
make setup          # สร้าง .env file
make up-build       # Build และรันทั้งหมด
make logs           # ดู logs
```

**Windows:**
```powershell
.\docker.ps1 setup      # สร้าง .env file
.\docker.ps1 up-build   # Build และรันทั้งหมด
.\docker.ps1 logs       # ดู logs
```

**ดูคู่มือ Makefile: [MAKEFILE.md](./MAKEFILE.md)**

---

### วิธีที่ 2: รันทั้งหมดพร้อมกัน (Docker Compose โดยตรง)

#### ขั้นตอนที่ 1: ตั้งค่า Environment Variables

สร้างไฟล์ `.env` ที่ root ของโปรเจกต์ (คัดลอกจาก `env.example`):

```bash
# Windows PowerShell
Copy-Item env.example .env

# Linux/Mac
cp env.example .env
```

แก้ไขไฟล์ `.env` ตามต้องการ:
```env
# MySQL Configuration
MYSQL_ROOT_PASSWORD=your_secure_password
MYSQL_USER=asset_user
MYSQL_PASSWORD=asset_password
MYSQL_PORT=3306

# Spring Boot Configuration
SPRING_BOOT_PORT=8080
JWT_SECRET=your_jwt_secret_key_at_least_32_chars

# Next.js Configuration
NEXTJS_PORT=3000
NEXT_PUBLIC_API_URL=http://localhost:8080
```

#### ขั้นตอนที่ 2: Build และรัน Docker Compose

```bash
# Build และรันทั้งหมด
docker-compose up --build

# หรือรันในโหมด background (detached mode)
docker-compose up -d --build
```

#### ขั้นตอนที่ 3: ตรวจสอบว่า Services รันอยู่

```bash
# ดูสถานะของ containers
docker-compose ps

# ดู logs
docker-compose logs -f

# ดู logs ของ service เฉพาะ
docker-compose logs -f spring-boot
docker-compose logs -f nextjs
docker-compose logs -f mysql
```

#### ✅ ตรวจสอบการทำงาน

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8080
- **MySQL**: localhost:3306

---

### วิธีที่ 3: รันทีละ Service

#### 1. รัน MySQL ก่อน

```bash
docker-compose up mysql -d
```

รอให้ MySQL พร้อม (ประมาณ 10-20 วินาที)

#### 2. รัน Spring Boot

```bash
docker-compose up spring-boot -d
```

#### 3. รัน Next.js

```bash
docker-compose up nextjs -d
```

---

## 🛠️ คำสั่ง Docker ที่ใช้บ่อย

### การจัดการ Containers

```bash
# เริ่ม services
docker-compose up -d

# หยุด services
docker-compose stop

# หยุดและลบ containers
docker-compose down

# หยุดและลบ containers + volumes (ลบข้อมูล database)
docker-compose down -v

# Restart service
docker-compose restart spring-boot

# Rebuild และ restart
docker-compose up -d --build spring-boot
```

### ดู Logs

```bash
# ดู logs ทั้งหมด
docker-compose logs -f

# ดู logs ของ service เฉพาะ
docker-compose logs -f spring-boot
docker-compose logs -f nextjs
docker-compose logs -f mysql

# ดู logs ล่าสุด 100 บรรทัด
docker-compose logs --tail=100 spring-boot
```

### เข้าไปใน Container

```bash
# เข้าไปใน Spring Boot container
docker-compose exec spring-boot sh

# เข้าไปใน MySQL container
docker-compose exec mysql bash

# เข้าไปใน Next.js container
docker-compose exec nextjs sh
```

### ตรวจสอบสถานะ

```bash
# ดูสถานะ containers
docker-compose ps

# ดู resource usage
docker stats

# ตรวจสอบ network
docker network ls
docker network inspect final_project_utcc_app-network
```

---

## 🔧 การแก้ไขปัญหา

### 1. Port ถูกใช้งานแล้ว

**ปัญหา**: `Error: bind: address already in use`

**แก้ไข**:
- เปลี่ยน port ในไฟล์ `.env`
- หรือหยุด service ที่ใช้ port อยู่

```bash
# Windows - หา process ที่ใช้ port
netstat -ano | findstr :8080

# Linux/Mac
lsof -i :8080
```

### 2. Database Connection Error

**ปัญหา**: Spring Boot ไม่สามารถเชื่อมต่อ MySQL ได้

**แก้ไข**:
1. ตรวจสอบว่า MySQL container รันอยู่:
   ```bash
   docker-compose ps mysql
   ```
2. ตรวจสอบ logs:
   ```bash
   docker-compose logs mysql
   ```
3. ตรวจสอบ password ใน `.env` ตรงกับ `application-docker.properties`

### 3. Build Error

**ปัญหา**: Build Docker image ไม่สำเร็จ

**แก้ไข**:
```bash
# ลบ images เก่า
docker-compose down
docker system prune -a

# Build ใหม่
docker-compose build --no-cache
docker-compose up -d
```

### 4. Next.js Build Error (Standalone)

**ปัญหา**: `.next/standalone` ไม่มี

**แก้ไข**:
1. ตรวจสอบว่า `next.config.ts` มี `output: 'standalone'`
2. ลบ `.next` folder และ build ใหม่:
   ```bash
   cd asset_it_support_nextjs
   rm -rf .next
   npm run build
   ```

### 5. Database Data หาย

**ปัญหา**: ข้อมูลใน database หายหลังจาก `docker-compose down`

**แก้ไข**:
- ใช้ `docker-compose down` (ไม่ใช้ `-v`) เพื่อเก็บข้อมูลไว้
- ข้อมูลจะถูกเก็บใน Docker volume `mysql_data`

---

## 📊 Structure ของ Docker Setup

```
final_project_Utcc/
├── docker-compose.yml          # Main compose file
├── .env                        # Environment variables (สร้างเอง)
├── env.example                 # Example env file
│
├── asset_it_support_spring_boot/
│   ├── Dockerfile              # Spring Boot Dockerfile
│   ├── .dockerignore           # Files to ignore
│   └── src/main/resources/
│       └── application-docker.properties  # Docker config
│
└── asset_it_support_nextjs/
    ├── Dockerfile              # Next.js Dockerfile
    └── .dockerignore           # Files to ignore
```

---

## 🔐 Security Notes

1. **อย่า commit `.env` file** - ไฟล์นี้มี sensitive information
2. **เปลี่ยน default passwords** - เปลี่ยน `MYSQL_ROOT_PASSWORD` และ `JWT_SECRET`
3. **ใช้ strong JWT secret** - อย่างน้อย 32 characters

---

## 🚀 Production Deployment

สำหรับ production:

1. **เปลี่ยน environment variables**:
   ```env
   NODE_ENV=production
   NEXT_PUBLIC_API_URL=https://your-api-domain.com
   ```

2. **ใช้ reverse proxy** (nginx/traefik) สำหรับ HTTPS

3. **Backup database**:
   ```bash
   docker-compose exec mysql mysqldump -u root -p db_asset > backup.sql
   ```

4. **Monitor logs**:
   ```bash
   docker-compose logs -f > app.log
   ```

---

## 📚 ข้อมูลเพิ่มเติม

- Docker Documentation: https://docs.docker.com/
- Docker Compose: https://docs.docker.com/compose/
- Spring Boot Docker: https://spring.io/guides/gs/spring-boot-docker/
- Next.js Docker: https://nextjs.org/docs/deployment#docker-image

---

## ❓ FAQ

**Q: ต้องรัน MySQL แยกหรือไม่?**  
A: ไม่ต้อง Docker Compose จะรัน MySQL ให้อัตโนมัติ

**Q: ข้อมูล database จะอยู่ที่ไหน?**  
A: อยู่ใน Docker volume `mysql_data` จะไม่หายเมื่อ restart container

**Q: เปลี่ยน code แล้วต้อง rebuild หรือไม่?**  
A: ต้อง rebuild image: `docker-compose up -d --build`

**Q: ใช้ database ที่มีอยู่แล้วได้หรือไม่?**  
A: ได้ แต่ต้องแก้ไข connection string ใน `application-docker.properties`

