# 📋 ตัวเลือกการตั้งค่า Production Configuration

## ❓ คำถาม: `application-prod.properties` จำเป็นต้องมีหรือไม่?

**คำตอบ: ไม่จำเป็น แต่แนะนำให้มี**

---

## วิธีที่ 1: ใช้ `application-prod.properties` (แนะนำ) ⭐

### ข้อดี:
- ✅ แยก configuration ระหว่าง development และ production ชัดเจน
- ✅ ตั้งค่า production-specific settings ได้ (เช่น `ddl-auto=validate`, `show-sql=false`)
- ✅ ใช้ environment variables สำหรับความปลอดภัย
- ✅ ไม่ต้องแก้ไข `application.properties` เมื่อ deploy

### วิธีใช้:
```bash
# Development (default)
mvn spring-boot:run
# ใช้ application.properties

# Production
java -jar app.jar --spring.profiles.active=prod
# ใช้ application-prod.properties
```

### ไฟล์ที่ต้องมี:
- ✅ `application.properties` (Development)
- ✅ `application-prod.properties` (Production)

---

## วิธีที่ 2: ไม่ใช้ Profile (ใช้แค่ `application.properties`)

### ข้อดี:
- ✅ ไฟล์เดียว ง่าย
- ✅ ไม่ต้องระบุ profile เมื่อรัน

### ข้อเสีย:
- ❌ ต้องแก้ไข `application.properties` ทุกครั้งที่ deploy
- ❌ ไม่สามารถแยก config ระหว่าง dev และ prod
- ❌ ต้องใช้ environment variables ทั้งหมด

### วิธีใช้:
แก้ไข `application.properties` ให้รองรับทั้ง dev และ prod:

```properties
# ใช้ Environment Variables ทั้งหมด
spring.datasource.url=${DB_URL:jdbc:mysql://localhost:3306/db_asset}
spring.datasource.username=${DB_USERNAME:root}
spring.datasource.password=${DB_PASSWORD:}

# CORS - ใช้ Environment Variable
app.cors.allowed-origins=${CORS_ORIGINS:http://localhost:3000,https://asset-it-utcc.vercel.app}

# JWT - ใช้ Environment Variable
app.jwt.secret=${JWT_SECRET:THIS_IS_A_VERY_STRONG_SECRET_KEY_AT_LEAST_32_CHARS}

# JPA - ใช้ Environment Variable
spring.jpa.hibernate.ddl-auto=${DDL_AUTO:update}
spring.jpa.show-sql=${SHOW_SQL:true}
```

### ไฟล์ที่ต้องมี:
- ✅ `application.properties` (ใช้ทั้ง dev และ prod)
- ❌ ไม่ต้องมี `application-prod.properties`

---

## 🎯 แนะนำ

### ถ้า Deploy บน Cloud Platform (Railway, Render, Heroku):
**ใช้วิธีที่ 1** (มี `application-prod.properties`)
- ตั้งค่า Environment Variables ใน platform
- รันด้วย `--spring.profiles.active=prod`
- ง่ายและชัดเจน

### ถ้า Deploy บน VPS/Server:
**ใช้วิธีที่ 1 หรือ 2 ก็ได้**
- วิธีที่ 1: ตั้งค่า environment variables และรันด้วย prod profile
- วิธีที่ 2: ตั้งค่า environment variables และใช้ `application.properties` เดียว

---

## 📝 สรุป

| วิธี | ไฟล์ที่ต้องมี | ความซับซ้อน | แนะนำ |
|------|---------------|-------------|-------|
| **วิธีที่ 1** | `application.properties`<br>`application-prod.properties` | กลาง | ⭐⭐⭐⭐⭐ |
| **วิธีที่ 2** | `application.properties` เท่านั้น | ต่ำ | ⭐⭐⭐ |

---

## ✅ คำแนะนำ

**แนะนำให้ใช้ `application-prod.properties`** เพราะ:
1. แยก config ชัดเจน
2. ตั้งค่า production-specific ได้
3. ใช้ environment variables ได้
4. ไม่ต้องแก้ไข `application.properties` เมื่อ deploy

**ถ้าไม่ต้องการใช้ profile:**
- ลบ `application-prod.properties` ได้
- แก้ไข `application.properties` ให้ใช้ environment variables ทั้งหมด

---

**เลือกวิธีที่เหมาะกับคุณ!**

