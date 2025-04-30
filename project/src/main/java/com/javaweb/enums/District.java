package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum District {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4"),
    QUAN_6("Quận 6"),
    QUAN_5("Quận 5"),
    QUAN_BA_DINH("Quận Ba Đình"),
    QUAN_HOAN_KIEM("Quận Hoàn Kiếm"),
    QUAN_HAI_BA_TRUNG("Quận Hai Bà Trưng"),
    QUAN_DONG_DA("Quận Đống Đa"),
    QUAN_CAU_GIAY("Quận Cầu Giấy"),
    QUAN_THANH_XUAN("Quận Thanh Xuân"),
    QUAN_HOANG_MAI("Quận Hoàng Mai"),
    QUAN_LONG_BIEN("Quận Long Biên"),
    QUAN_TAY_HO("Quận Tây Hồ"),
    QUAN_NAM_TU_LIEM("Quận Nam Từ Liêm"),
    QUAN_BAC_TU_LIEM("Quận Bắc Từ Liêm"),
    QUAN_HA_DONG("Quận Hà Đông"),
    HUYEN_BA_VI("Huyện Ba Vì"),
    HUYEN_CHUONG_MY("Huyện Chương Mỹ"),
    HUYEN_DAN_PHUONG("Huyện Đan Phượng"),
    HUYEN_DONG_ANH("Huyện Đông Anh"),
    HUYEN_GIA_LAM("Huyện Gia Lâm"),
    HUYEN_HOAI_DUC("Huyện Hoài Đức"),
    HUYEN_ME_LINH("Huyện Mê Linh"),
    HUYEN_MY_DUC("Huyện Mỹ Đức"),
    HUYEN_PHUC_THO("Huyện Phúc Thọ"),
    HUYEN_QUOC_OAI("Huyện Quốc Oai"),
    HUYEN_SOC_SON("Huyện Sóc Sơn"),
    HUYEN_THACH_THAT("Huyện Thạch Thất"),
    HUYEN_THANH_OAI("Huyện Thanh Oai"),
    HUYEN_THANH_TRI("Huyện Thanh Trì"),
    HUYEN_THUONG_TIN("Huyện Thường Tín"),
    HUYEN_UNG_HOA("Huyện Ứng Hòa"),
    HUYEN_PHU_XUYEN("Huyện Phú Xuyên"),
    THI_XA_SON_TAY("Thị xã Sơn Tây");
    private final String districtName;

    public String getDistrictName() {
        return districtName;
    }

    District(String districtName) {
        this.districtName = districtName;
    }
    public  static Map<String,String> type(){
        Map<String,String> districts = new TreeMap<>();
        for (District it : District.values()){
            districts.put(it.toString(), it.districtName);
        }
        return districts;
    }

}
