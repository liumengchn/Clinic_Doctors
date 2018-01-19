//
//  PatientClinicParitiesCellModel.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/17.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

let cell_space_height: CGFloat = 17

class PatientClinicParitiesCellModel: NSObject {
    
    /** 数据模型_原数据 */
    var model: PatientClinicParitiesModel?
    
    /** 高度_诊所名 */
    var patient_clinic_name_height:         CGFloat = 0
    
    /** 高度_星级 */
    var patient_clinic_star_height:         CGFloat = 0
    
    /** 高度_分数 */
    var patient_clinic_score_height:        CGFloat = 0
    
    /** 高度_地址 */
    var patient_clinic_address_height:      CGFloat = 0
    
    /** 高度_cell */
    var patient_clinic_cell_height:         CGFloat = 0
    
    /** 当前cell的所处位置 */
    var patient_ClinicParities_indexPath:   IndexPath?
    
    init(model: PatientClinicParitiesModel) {
        super.init()
        
        self.model = model
    }
    
    /** 当数据发生变化，调用该方法刷新布局 */
    func layout() -> Void {
        
        self.patient_clinic_name_height = getStringSize((model?.patient_clinic_name_string!)!, screen_size.width * 0.5, font_size: 15).height
        self.patient_clinic_star_height = self.patient_clinic_name_height
        self.patient_clinic_score_height = self.patient_clinic_star_height
        
        self.patient_clinic_address_height = getStringSize((model?.patient_clinic_address_string!)!, screen_size.width * 0.9, font_size: 12).height
        
        patient_clinic_cell_height = self.patient_clinic_name_height + self.patient_clinic_address_height + cell_space_height * 2
    }
    
    
}
