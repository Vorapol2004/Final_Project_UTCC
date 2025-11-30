# คู่มือการรันโปรเจกต์ Final Project UTCC

## 📋 สิ่งที่ต้องเตรียม

### 1. Database (MySQL/MariaDB)
- ติดตั้ง MySQL หรือ MariaDB
- สร้าง database ชื่อ `db_asset`
- ตั้งค่า username: `root` และ password (ถ้ามี)

### 2. IDE
- **IntelliJ IDEA** - สำหรับรัน Spring Boot Backend
- **WebStorm** หรือ **IntelliJ IDEA** - สำหรับรัน Next.js Frontend

---

## 🚀 วิธีการรันโปรเจกต์

### ส่วนที่ 1: รัน Spring Boot Backend (IntelliJ IDEA)

#### ขั้นตอนที่ 1: เปิดโปรเจกต์
1. เปิด **IntelliJ IDEA**
2. เลือก **File → Open**
3. ไปที่โฟลเดอร์ `asset_it_support_spring_boot`
4. คลิก **OK**

#### ขั้นตอนที่ 2: ตั้งค่า Database
1. ตรวจสอบไฟล์ `src/main/resources/application.properties`
2. แก้ไขการตั้งค่าถ้าจำเป็น:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/db_asset
   spring.datasource.username=root
   spring.datasource.password=your_password  # ใส่ password ถ้ามี
   ```

#### ขั้นตอนที่ 3: รันโปรเจกต์
**วิธีที่ 1: รันผ่าน Main Class**
1. เปิดไฟล์ `AssetItSupportApplication.java`
2. คลิกขวาที่ไฟล์ → เลือก **Run 'AssetItSupportApplication.main()'**
   หรือกด **Shift + F10**

**วิธีที่ 2: รันผ่าน Maven**
1. เปิด **Maven** tool window (View → Tool Windows → Maven)
2. ขยาย `asset_it_support → Plugins → spring-boot`
3. Double-click ที่ **spring-boot:run**

**วิธีที่ 3: รันผ่าน Terminal ใน IntelliJ**
```bash
./mvnw spring-boot:run
# หรือ Windows
mvnw.cmd spring-boot:run
```

#### ✅ ตรวจสอบว่า Backend รันสำเร็จ
- เปิดเบราว์เซอร์ไปที่: `http://localhost:8080`
- ควรเห็น Spring Boot application รันอยู่
- ตรวจสอบ Console log ว่าไม่มี error

---

### ส่วนที่ 2: รัน Next.js Frontend (WebStorm/IntelliJ IDEA)

#### ขั้นตอนที่ 1: เปิดโปรเจกต์
1. เปิด **WebStorm** หรือ **IntelliJ IDEA**
2. เลือก **File → Open**
3. ไปที่โฟลเดอร์ `asset_it_support_nextjs`
4. คลิก **OK**

#### ขั้นตอนที่ 2: ติดตั้ง Dependencies
**วิธีที่ 1: ผ่าน Terminal ใน IDE**
1. เปิด Terminal (Alt + F12 หรือ View → Tool Windows → Terminal)
2. รันคำสั่ง:
   ```bash
   npm install
   ```
   หรือ
   ```bash
   npm ci
   ```

**วิธีที่ 2: ผ่าน Package.json**
1. เปิดไฟล์ `package.json`
2. คลิกขวาที่ไฟล์ → เลือก **Show npm Scripts**
3. คลิกขวาที่ **install** → เลือก **Run 'install'**

#### ขั้นตอนที่ 3: รันโปรเจกต์
**วิธีที่ 1: ผ่าน Terminal**
1. เปิด Terminal ใน IDE
2. รันคำสั่ง:
   ```bash
   npm run dev
   ```

**วิธีที่ 2: ผ่าน npm Scripts**
1. เปิดไฟล์ `package.json`
2. คลิกขวาที่ไฟล์ → เลือก **Show npm Scripts**
3. คลิกขวาที่ **dev** → เลือก **Run 'dev'**

**วิธีที่ 3: สร้าง Run Configuration (แนะนำ)**
1. ไปที่ **Run → Edit Configurations...**
2. คลิก **+** → เลือก **npm**
3. ตั้งค่า:
   - **Name**: `Next.js Dev Server`
   - **Command**: `run`
   - **Scripts**: `dev`
   - **Working directory**: `$PROJECT_DIR$/asset_it_support_nextjs`
4. คลิก **OK**
5. กด **Shift + F10** เพื่อรัน

#### ✅ ตรวจสอบว่า Frontend รันสำเร็จ
- เปิดเบราว์เซอร์ไปที่: `http://localhost:3000`
- ควรเห็นหน้าเว็บ Next.js

---

## 🔧 การตั้งค่าเพิ่มเติม

### ตั้งค่า Environment Variables (ถ้าจำเป็น)

#### Next.js (.env.local)
สร้างไฟล์ `.env.local` ในโฟลเดอร์ `asset_it_support_nextjs`:
```env
NEXT_PUBLIC_API_URL=http://localhost:8080
```

#### Spring Boot
แก้ไขไฟล์ `application.properties` ตามที่ต้องการ

---

## 📝 สรุป Port ที่ใช้

- **Spring Boot Backend**: `http://localhost:8080`
- **Next.js Frontend**: `http://localhost:3000`
- **MySQL Database**: `localhost:3306`

---

## ⚠️ ปัญหาที่อาจพบ

### 1. Database Connection Error
- ตรวจสอบว่า MySQL รันอยู่
- ตรวจสอบว่า database `db_asset` ถูกสร้างแล้ว
- ตรวจสอบ username/password ใน `application.properties`

### 2. Port Already in Use
- เปลี่ยน port ใน `application.properties` (Spring Boot)
- เปลี่ยน port ใน `package.json` scripts (Next.js)

### 3. Dependencies ไม่ติดตั้ง
- ลบ `node_modules` และ `package-lock.json` แล้วรัน `npm install` ใหม่
- สำหรับ Maven: ลบ `target` folder แล้วรัน `mvn clean install`

---

## 🎯 ลำดับการรันที่แนะนำ

1. **รัน MySQL Database** ก่อน
2. **รัน Spring Boot Backend** (port 8080)
3. **รัน Next.js Frontend** (port 3000)

---

## 📚 ข้อมูลเพิ่มเติม

- Spring Boot: https://spring.io/projects/spring-boot
- Next.js: https://nextjs.org/docs
- IntelliJ IDEA: https://www.jetbrains.com/idea/
- WebStorm: https://www.jetbrains.com/webstorm/

