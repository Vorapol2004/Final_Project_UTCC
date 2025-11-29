# 📝 สรุปการตั้งค่า Deploy

## ✅ สิ่งที่ต้องแก้ไข

### 1. ไฟล์ Properties (แก้ไขแล้ว ✅)

#### `application.properties` (Development)
```properties
app.cors.allowed-origins=http://localhost:3000,https://asset-it-utcc.vercel.app
```
- รองรับทั้ง localhost (development) และ Vercel (production)

#### `application-prod.properties` (Production)
```properties
app.cors.allowed-origins=${CORS_ORIGINS:https://asset-it-utcc.vercel.app,https://www.asset-it-utcc.vercel.app}
```
- รองรับ Vercel domain
- ใช้ Environment Variable `CORS_ORIGINS` ได้

### 2. ไฟล์ Java (ไม่ต้องแก้ไข ✅)

#### `CorsConfig.java`
- **ไม่ต้องแก้ไข domain** เพราะอ่านค่าจาก properties file อัตโนมัติ
- ใช้ `@Value("${app.cors.allowed-origins:...}")` เพื่ออ่านค่าจาก properties
- รองรับหลาย domain (split ด้วย comma)

---

## 🎯 วิธีทำงาน

### Development (ใช้ `application.properties`)
```bash
# Start application (default)
mvn spring-boot:run

# CORS จะอ่านจาก: app.cors.allowed-origins=http://localhost:3000,https://asset-it-utcc.vercel.app
```

### Production (ใช้ `application-prod.properties`)
```bash
# Start with production profile
java -jar app.jar --spring.profiles.active=prod

# CORS จะอ่านจาก: app.cors.allowed-origins ใน application-prod.properties
# หรือ Environment Variable: CORS_ORIGINS
```

---

## 🔧 Environment Variables (Production)

เมื่อ deploy สามารถตั้งค่า Environment Variable:

```bash
CORS_ORIGINS=https://asset-it-utcc.vercel.app,https://www.asset-it-utcc.vercel.app
```

Spring Boot จะอ่านค่าจาก Environment Variable ก่อน properties file

---

## ✅ Checklist

- [x] แก้ไข `application.properties` - รองรับ Vercel domain
- [x] แก้ไข `application-prod.properties` - รองรับ Vercel domain
- [x] `CorsConfig.java` - ไม่ต้องแก้ไข (อ่านค่าจาก properties อัตโนมัติ)
- [ ] Deploy backend
- [ ] ทดสอบ CORS จาก frontend

---

## 🧪 ทดสอบ CORS

### 1. Development
```bash
# Start application
mvn spring-boot:run

# ทดสอบจาก browser console ที่ localhost:3000
fetch('http://localhost:8080/auth/login', {
  method: 'POST',
  headers: {'Content-Type': 'application/json'},
  body: JSON.stringify({email: 'admin@example.com', password: 'admin123'})
})
```

### 2. Production
```bash
# ทดสอบจาก browser console ที่ asset-it-utcc.vercel.app
fetch('https://your-backend-api.com/auth/login', {
  method: 'POST',
  headers: {'Content-Type': 'application/json'},
  body: JSON.stringify({email: 'admin@example.com', password: 'admin123'})
})
```

---

## 📝 สรุป

**สิ่งที่ต้องแก้ไข:**
- ✅ `application.properties` - แก้ไขแล้ว
- ✅ `application-prod.properties` - แก้ไขแล้ว

**สิ่งที่ไม่ต้องแก้ไข:**
- ✅ `CorsConfig.java` - อ่านค่าจาก properties อัตโนมัติ

**การทำงาน:**
1. `CorsConfig.java` อ่านค่าจาก `app.cors.allowed-origins` ใน properties file
2. Development: ใช้ `application.properties`
3. Production: ใช้ `application-prod.properties` (เมื่อรันด้วย `--spring.profiles.active=prod`)

---

**🎉 พร้อม Deploy แล้ว!**

