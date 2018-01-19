//
//  PatientClinicParitiesTableViewCell.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientClinicParitiesTableViewCell: UITableViewCell {

    var patient_clinic_name:        UILabel?
    var patient_clinic_star:        UIView?
    var patient_clinic_score:       UILabel?
    var patient_clinic_address:     UILabel?
    
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
        
        let font_color                              = register_theme_color
        
        self.patient_clinic_name                    = UILabel()
        self.patient_clinic_name?.text              = "四川省人民医院"
        self.patient_clinic_name?.font              = public_method.setFontSize(original_size: 15)
        self.contentView.addSubview(self.patient_clinic_name!)
        
        self.patient_clinic_star                    = UIView()
        self.patient_clinic_star?.backgroundColor   = UIColor.orange
        self.contentView.addSubview(self.patient_clinic_star!)
        
        self.patient_clinic_score                   = UILabel()
        self.patient_clinic_score?.text             = "4.9 分"
        self.patient_clinic_score?.font             = public_method.setFontSize(original_size: 12)
        self.contentView.addSubview(self.patient_clinic_score!)
        
        self.patient_clinic_address                 = UILabel()
        self.patient_clinic_address?.textColor      = font_color
        self.patient_clinic_address?.text           = "asdasdashdbckzjdbvjhsdbvaksjfbchjvbAhvbsdK我们ashdaksd我们阿萨德哪啊数据撒娇打开"
        self.patient_clinic_address?.font           = public_method.setFontSize(original_size: 12)
        self.contentView.addSubview(self.patient_clinic_address!)
        
        self.patient_clinic_name?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.contentView).offset(public_method.setFitSize(original: 20.5))
            make.left.equalTo(self.contentView).offset(public_method.setFitSize(original: 20.5))
            make.width.equalTo(self.contentView).multipliedBy(0.43)
            make.height.equalTo(public_method.setFitSize(original: 15))
        })
        
        self.patient_clinic_star?.snp.makeConstraints({ (make) in
            
//            make.left.equalTo(self.patient_clinic_name!.snp.right).offset(public_method.setFitSize(original: 20))
            make.left.equalTo(self.contentView).offset(screen_size.width * 0.524)
            make.top.equalTo(self.patient_clinic_name!)
            make.width.equalTo(self.contentView).multipliedBy(0.29)
            make.height.equalTo(self.patient_clinic_name!)
        })
        
        self.patient_clinic_score?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_clinic_star!.snp.right).offset(public_method.setFitSize(original: 10))
            make.right.equalTo(self.contentView).offset(-public_method.setFitSize(original: 10))
            make.height.equalTo(self.patient_clinic_name!)
            make.top.equalTo(self.patient_clinic_name!)
        })
        
        self.patient_clinic_address?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_clinic_name!)
            make.right.equalTo(self.patient_clinic_score!.snp.right).offset(0)
            make.bottom.equalTo(self.contentView).offset(-public_method.setFitSize(original: 10))
        })
    }
    
    func setLayout(model: PatientClinicParitiesModel) -> Void {
        
        self.patient_clinic_name?.snp.updateConstraints({ (make) in


        })
    }

}
