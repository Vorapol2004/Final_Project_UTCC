# 📋 คู่มือการใช้ Makefile

Makefile ช่วยให้การรันคำสั่ง Docker และคำสั่งอื่นๆ ง่ายขึ้น

## 🚀 การติดตั้ง

### Linux / Mac
Makefile มักจะติดตั้งมาพร้อมกับระบบแล้ว

### Windows
**วิธีที่ 1: ใช้ Git Bash** (แนะนำ)
- Git Bash มี make มาพร้อมแล้ว
- หรือใช้ `Makefile.windows`

**วิธีที่ 2: ติดตั้ง Make**
- ดาวน์โหลดจาก: https://www.gnu.org/software/make/
- หรือใช้ Chocolatey: `choco install make`

**วิธีที่ 3: ใช้ PowerShell Scripts**
- ดูที่ `scripts/` directory (ถ้ามี)

---

## 📖 คำสั่งทั้งหมด

### Docker Commands

#### เริ่มต้นใช้งาน
```bash
make help          # แสดงคำสั่งทั้งหมด
make setup         # Setup ครั้งแรก (สร้าง .env)
make up-build      # Build และรันทั้งหมด
```

#### การจัดการ Services
```bash
make up            # เริ่ม services (detached mode)
make down          # หยุดและลบ containers
make restart       # Restart services ทั้งหมด
make ps            # ดูสถานะ containers
make status        # ดูสถานะ + URLs
```

#### Build
```bash
make build         # Build Docker images
make rebuild       # Rebuild (no cache)
make up-build      # Build และรันพร้อมกัน
```

#### Logs
```bash
make logs          # ดู logs ทั้งหมด
make logs-spring   # ดู Spring Boot logs
make logs-next     # ดู Next.js logs
make logs-mysql    # ดู MySQL logs
```

#### Shell Access
```bash
make shell-spring  # เข้า Spring Boot container
make shell-next    # เข้า Next.js container
make shell-mysql   # เข้า MySQL container
```

#### Cleanup
```bash
make clean         # ลบ containers และ volumes
```

---

### Development Commands

```bash
make dev           # แสดงคำสั่งสำหรับ development mode
make install-frontend   # ติดตั้ง Next.js dependencies
make install-backend    # Download Maven dependencies
```

---

### Database Commands

```bash
make db-backup     # Backup database
make db-restore FILE=backup.sql   # Restore database
```

---

## 🎯 ตัวอย่างการใช้งาน

### Setup ครั้งแรก

```bash
# 1. สร้าง .env file
make setup

# 2. แก้ไข .env file ตามต้องการ
# (แก้ไข password, JWT secret, etc.)

# 3. Build และรัน
make up-build

# 4. ตรวจสอบสถานะ
make status
```

### การพัฒนา (Development)

```bash
# เริ่ม services
make up

# ดู logs
make logs-spring

# Restart service เฉพาะ
make restart-spring

# เข้าไปใน container
make shell-spring
```

### การแก้ปัญหา

```bash
# ดู logs เพื่อหาปัญหา
make logs

# Rebuild ใหม่
make rebuild
make up-build

# Clean และเริ่มใหม่
make clean
make up-build
```

---

## 🔧 Customization

### เพิ่มคำสั่งใหม่

แก้ไข `Makefile` และเพิ่ม target ใหม่:

```makefile
my-command:
	@echo "Running my custom command..."
	docker-compose exec spring-boot some-command
```

### ใช้ Environment Variables

```bash
# ตั้งค่าใน Makefile
MYSQL_PASSWORD ?= default_password

# หรือส่งผ่าน command line
make up-build MYSQL_PASSWORD=my_password
```

---

## ⚠️ หมายเหตุ

1. **Windows Users**: 
   - ใช้ `Makefile.windows` หรือ Git Bash
   - หรือใช้ PowerShell scripts แทน

2. **.env file**: 
   - ต้องสร้างก่อนรัน `make up`
   - ใช้ `make setup` เพื่อสร้างอัตโนมัติ

3. **Permissions**:
   - บางคำสั่งอาจต้องใช้ `sudo` (Linux)
   - หรือรัน Docker Desktop ในโหมด Administrator (Windows)

---

## 📚 ข้อมูลเพิ่มเติม

- Docker Compose: https://docs.docker.com/compose/
- Makefile Documentation: https://www.gnu.org/software/make/

