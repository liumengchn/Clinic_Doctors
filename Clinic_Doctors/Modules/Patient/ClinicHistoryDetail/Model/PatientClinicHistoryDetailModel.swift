//
//  PatientClinicHistoryDetailModel.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/17.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientClinicHistoryDetailHeadModel: NSObject {

    /** 头像 */
    var history_detail_img:         String?
    
    /* 姓名 */
    var history_detail_name:        String?
    
    /* 性别 */
    var history_detail_sex:         String?
    
    /* 年龄 */
    var history_detail_year:        String?
    
    /* 体重 */
    var history_detail_weight:      String?
    
    init(img: String , name: String , sex: String , year: String , weight: String) {
        
        self.history_detail_img         = img
        self.history_detail_name        = name
        self.history_detail_sex         = sex
        self.history_detail_year        = year
        self.history_detail_weight      = weight
    }
}

class PatientClinicHistoryDetailInformationModel: NSObject {

    /* 就诊时间 */
    var history_detail_date:        String?
    
    /* 类型 */
    var history_detail_type:        String?
    
    /* 就诊类型 */
    var history_detail_clinic_type: String?
    
    /* 价格 */
    var history_detail_prices:      String?
    
    /* 病状描述 */
    var history_detail_description: String?
    
    init(date: String , type: String , clinic_type: String , price: String , description: String) {
        
        self.history_detail_date        = date
        self.history_detail_type        = type
        self.history_detail_clinic_type = clinic_type
        self.history_detail_prices      = price
        self.history_detail_description = description
    }
}

class PatientClinicHistoryDetailHospitalModel: NSObject {

    /* 所属医院 */
    var history_detail_hospital:    String?
    
    /* 医院地址 */
    var history_detail_address:     String?
    
    init( hospital: String , address: String) {
        
        self.history_detail_hospital    = hospital
        self.history_detail_address     = address
    }
}

class PatientClinicHistoryDetailDoctorModel: NSObject {
    
    /* 所属医生 */
    var history_detail_doctor:      String?
    
    /* 医生职称 */
    var history_detail_job:         String?
    
    init(doctor: String , job: String) {
        
        self.history_detail_doctor  = doctor
        self.history_detail_job     = job
    }
}
