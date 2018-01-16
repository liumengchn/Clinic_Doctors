//
//  PatientClinicHistoryTableViewCell.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientClinicHistoryTableViewCell: UITableViewCell {
    
    /** 圆点 */
    var patient_history_dot:                UILabel?
    /* 时间 */
    var patient_history_date:               UILabel?
    /* 处方号 */
    var patient_history_prescribeNumber:    UILabel?
    /* 分类 */
    var patient_history_type:               UILabel?
    /* 所属医生 */
    var patient_history_number:             UILabel?
    /* 所属门诊 */
    var patient_history_clinic:             UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initializationOneBaseView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializationOneBaseView() -> Void {
     
        let 
    }
    
}

