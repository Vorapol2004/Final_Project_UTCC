/**
 * ฟังก์ชันสำหรับกำหนดสีตามชื่อสถานะอุปกรณ์ (Equipment Status)
 * รองรับทั้งภาษาไทยและภาษาอังกฤษ
 */
export const getEquipmentStatusColor = (statusName: string | null | undefined): string => {
    if (!statusName) return 'bg-gray-100 text-gray-800';
    
    const name = statusName.trim().toLowerCase();
    
    // พร้อมใช้งาน = สีเขียว
    if (name.includes('พร้อมใช้งาน') || name.includes('available')) {
        return 'bg-green-100 text-green-800';
    }
    // กำลังยืม = สีน้ำเงิน
    else if (name.includes('กำลังยืม') || name.includes('in use') || name.includes('borrowed')) {
        return 'bg-blue-100 text-blue-800';
    }
    // เสียหาย = สีแดง
    else if (name.includes('เสียหาย') || name.includes('damaged')) {
        return 'bg-red-100 text-red-800';
    }
    // สูญหาย = สีแดงเข้ม
    else if (name.includes('สูญหาย') || name.includes('lost')) {
        return 'bg-red-100 text-red-800';
    }
    // Under Maintenance = สีเหลือง
    else if (name.includes('under maintenance') || name.includes('maintenance')) {
        return 'bg-yellow-100 text-yellow-800';
    }
    // default
    else {
        return 'bg-gray-100 text-gray-800';
    }
};

/**
 * ฟังก์ชันสำหรับกำหนดสีตามชื่อสถานะการยืม (Borrow Status)
 * รองรับทั้งภาษาไทยและภาษาอังกฤษ
 */
export const getBorrowStatusColor = (statusName: string | null | undefined): string => {
    if (!statusName) return 'bg-gray-100 text-gray-700 border-gray-300';
    
    const name = statusName.trim().toLowerCase();
    
    // เกินกำหนด = สีแดง
    if (name.includes('เกินกำหนด') || name.includes('overdue')) {
        return 'bg-red-100 text-red-800 border-red-300';
    }
    // ยืม = สีเหลือง
    else if (name.includes('ยืม') || name.includes('borrowed')) {
        return 'bg-yellow-100 text-yellow-800 border-yellow-300';
    }
    // คืน = สีเขียว
    else if (name.includes('คืน') && !name.includes('บางส่วน')) {
        return 'bg-green-100 text-green-800 border-green-300';
    }
    // คืนบางส่วน = สีน้ำเงิน
    else if (name.includes('คืนบางส่วน') || name.includes('การส่งคืนบางส่วน') || name.includes('partial')) {
        return 'bg-blue-100 text-blue-800 border-blue-300';
    }
    // default
    else {
        return 'bg-gray-100 text-gray-700 border-gray-300';
    }
};

/**
 * ฟังก์ชันสำหรับกำหนดสีตามชื่อประเภทอุปกรณ์ (Equipment Type)
 * รองรับทั้งภาษาไทยและภาษาอังกฤษ
 */
export const getEquipmentTypeColor = (typeName: string | null | undefined): string => {
    if (!typeName) return 'bg-gray-100 text-gray-800';
    
    const name = typeName.trim().toLowerCase();
    
    // Hardware = สีน้ำเงิน
    if (name === 'hardware' || name === 'ฮาร์ดแวร์') {
        return 'bg-blue-100 text-blue-800';
    }
    // Software = สีม่วง
    else if (name === 'software' || name === 'ซอฟต์แวร์') {
        return 'bg-purple-100 text-purple-800';
    }
    // Other = สีเทา
    else if (name === 'other' || name === 'อื่นๆ') {
        return 'bg-gray-100 text-gray-800';
    }
    // default
    else {
        return 'bg-gray-100 text-gray-800';
    }
};

