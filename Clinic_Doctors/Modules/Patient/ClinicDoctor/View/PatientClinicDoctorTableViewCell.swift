//
//  PatientClinicDoctorTableViewCell.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientClinicDoctorTableViewCell: UITableViewCell {

    var patient_doctor_headerImage:         UIImageView?
    var patient_doctor_name:                UILabel?
    var patient_doctor_sex:                 UILabel?
    var patient_doctor_year:                UILabel?
    var patient_doctor_workyear:            UILabel?
    var patient_doctor_description:         UILabel?
    
    var patient_button_contact:             UIButton?
    
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
        
        self.initializationBaseView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializationBaseView() -> Void {
        
        let font_color = register_theme_color
        
        self.patient_doctor_headerImage                     = UIImageView()
        self.patient_doctor_headerImage?.backgroundColor    = UIColor.orange
        self.patient_doctor_headerImage?.image              = UIImage(named: "icon_header_img")?.toCircle()
        self.patient_doctor_headerImage?.layer.cornerRadius = screen_size.width * 0.16 * 0.50
        self.contentView.addSubview(self.patient_doctor_headerImage!)
        
        self.patient_doctor_name                            = UILabel()
        self.patient_doctor_name?.text                      = "邓志勇而yfjbbk"
        self.patient_doctor_name?.font                      = public_method.setFontSize(original_size: 16)
        self.contentView.addSubview(self.patient_doctor_name!)
        
        self.patient_doctor_sex                             = UILabel()
        self.patient_doctor_sex?.text                       = "男"
        self.patient_doctor_sex?.textColor                  = font_color
        self.patient_doctor_sex?.font                       = public_method.setFontSize(original_size: 14)
        self.contentView.addSubview(self.patient_doctor_sex!)
        
        self.patient_doctor_year                            = UILabel()
        self.patient_doctor_year?.text                      = "100岁"
        self.patient_doctor_year?.textColor                 = font_color
        self.patient_doctor_year?.font                      = public_method.setFontSize(original_size: 14)
        self.contentView.addSubview(self.patient_doctor_year!)
        
        self.patient_doctor_workyear                        = UILabel()
        self.patient_doctor_workyear?.text                  = "从医年限  100年"
        self.patient_doctor_workyear?.font                  = public_method.setFontSize(original_size: 11)
        self.contentView.addSubview(self.patient_doctor_workyear!)
        
        self.patient_button_contact                         = UIButton(type: UIButtonType.custom)
        self.patient_button_contact?.backgroundColor        = UIColor.orange
        self.patient_button_contact?.titleLabel?.font       = public_method.setFontSize(original_size: 14)
        self.patient_button_contact?.layer.cornerRadius     = public_method.setFitSize(original: 12.5)
        self.patient_button_contact?.setTitle("咨询", for: UIControlState.normal)
        self.contentView.addSubview(self.patient_button_contact!)
        
        self.patient_doctor_description                     = UILabel()
        self.patient_doctor_description?.text               = "主治：冠心病、奇葩病、牛逼病、还有什么病我也不知道"
        self.patient_doctor_description?.textColor          = font_color
        self.patient_doctor_description?.font               = public_method.setFontSize(original_size: 14)
        self.contentView.addSubview(self.patient_doctor_description!)
        
        self.patient_doctor_headerImage?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.contentView).offset(public_method.setFitSize(original: 13.5))
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(screen_size.width * 0.16)
            make.height.equalTo(screen_size.width * 0.16)
        })
        
        self.patient_doctor_name?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_doctor_headerImage!.snp.right).offset(public_method.setFitSize(original: 10))
            make.top.equalTo(self.patient_doctor_headerImage!.snp.top).offset(public_method.setFitSize(original: 5))
            make.width.equalTo(self.contentView).multipliedBy(0.21)
        })
        
        self.patient_doctor_sex?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(self.patient_doctor_name!)
            make.left.equalTo(self.patient_doctor_name!.snp.right).offset(public_method.setFitSize(original: 5))
            make.width.equalTo(public_method.setFitSize(original: 20))
        })
        
        self.patient_doctor_year?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_doctor_sex!.snp.right).offset(public_method.setFitSize(original: 5))
            make.centerY.equalTo(self.patient_doctor_name!)
            make.width.equalTo(public_method.setFitSize(original: 40))
        })
        
        self.patient_doctor_workyear?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_doctor_year!.snp.right).offset(public_method.setFitSize(original: 5))
            make.centerY.equalTo(self.patient_doctor_name!)
            make.width.equalTo(public_method.setFitSize(original: 80))
        })
        
        self.patient_button_contact?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.patient_doctor_headerImage!.snp.top).offset(public_method.setFitSize(original: 3))
            make.bottom.equalTo(self.patient_doctor_name!)
            make.right.equalTo(self.contentView).offset(-public_method.setFitSize(original: 5))
            make.width.equalTo(public_method.setFitSize(original: 40))
        })
        
        self.patient_doctor_description?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_doctor_name!)
            make.right.equalTo(self.patient_button_contact!.snp.right).offset(-public_method.setFitSize(original: 10))
            make.bottom.equalTo(self.patient_doctor_headerImage!.snp.bottom).offset(-public_method.setFitSize(original: 8))
        })
    }
    
}
