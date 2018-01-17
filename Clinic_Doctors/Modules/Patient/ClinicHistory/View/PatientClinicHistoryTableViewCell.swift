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
    /* 详情按钮 */
    var patient_history_detail:             UIButton?
    /* 处方号 */
    var patient_history_prescribeNumber:    UILabel?
    /* 分类 */
    var patient_history_type:               UILabel?
    /* 所属医生 */
    var patient_history_doctor:             UILabel?
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
     
        self.patient_history_dot = UILabel()
        self.patient_history_dot?.backgroundColor = public_method.setRGBColor(red: 255, green: 73, blue: 86, alpha: 1.0)
        self.contentView.addSubview(self.patient_history_dot!)
        
        self.patient_history_date = UILabel()
        self.patient_history_date?.text = "2017-11-23"
        self.patient_history_date?.font = public_method.setFontSize(original_size: 12)
        self.contentView.addSubview(self.patient_history_date!)
        
        self.patient_history_detail = UIButton(type: UIButtonType.custom)
//        self.patient_history_detail?.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.patient_history_detail?.frame.size.width = screen_size.width * 0.2
        self.patient_history_detail?.titleLabel?.font = public_method.setFontSize(original_size: 12)
        self.patient_history_detail?.set(UIImage(named: "icon_toRight")?.toScaleImage(scaleSize: 0.8).tint(color: UIColor.blue, blendMode: CGBlendMode.destinationIn), "详细", .left, public_method.setFitSize(original: 10), UIControlState.normal)
        self.patient_history_detail?.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.patient_history_detail?.adjustsImageWhenHighlighted = false //使触摸模式下按钮也不会变暗
        self.patient_history_detail?.adjustsImageWhenDisabled = false //使禁用模式下按钮也不会变暗
        self.contentView.addSubview(self.patient_history_detail!)
        
        let label_prescribeNumber = UILabel() //处方号
        label_prescribeNumber.text = "处方号"
        label_prescribeNumber.textColor = register_theme_color
        label_prescribeNumber.textAlignment = NSTextAlignment.right
        label_prescribeNumber.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(label_prescribeNumber)
        
        self.patient_history_prescribeNumber = UILabel()
        self.patient_history_prescribeNumber?.text = "2121555"
        self.patient_history_prescribeNumber?.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(self.patient_history_prescribeNumber!)
        
        let label_type = UILabel() //分类
        label_type.text = "分类"
        label_type.textColor = register_theme_color
        label_type.textAlignment = NSTextAlignment.right
        label_type.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(label_type)
        
        self.patient_history_type = UILabel()
        self.patient_history_type?.text = "急诊科"
        self.patient_history_type?.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(self.patient_history_type!)
        
        let label_doctor = UILabel() //所属医生
        label_doctor.text = "所属医生"
        label_doctor.textColor = register_theme_color
        label_doctor.textAlignment = NSTextAlignment.right
        label_doctor.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(label_doctor)
        
        self.patient_history_doctor = UILabel()
        self.patient_history_doctor?.text = "郑志勇"
        self.patient_history_doctor?.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(self.patient_history_doctor!)
        
        let label_clinic = UILabel() //所属门诊
        label_clinic.text = "所属门诊"
        label_clinic.textColor = register_theme_color
        label_clinic.textAlignment = NSTextAlignment.right
        label_clinic.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(label_clinic)
        
        self.patient_history_clinic = UILabel()
        self.patient_history_clinic?.text = "四川省人民医院"
        self.patient_history_clinic?.font = public_method.setFontSize(original_size: 13)
        self.contentView.addSubview(self.patient_history_clinic!)
        
        
        self.patient_history_detail?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.contentView).offset(public_method.setFitSize(original: 13))
            make.right.equalTo(self.contentView).offset(-public_method.setFitSize(original: 12.5))
            make.width.equalTo(screen_size.width * 0.15)
        })
        
        self.patient_history_dot?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.contentView).offset(public_method.setFitSize(original: 13.5))
            make.centerY.equalTo(self.patient_history_detail!)
            make.size.equalTo(CGSize(width: public_method.setFitSize(original: 4.5), height: public_method.setFitSize(original: 4.5)))
        })
        
        self.patient_history_date?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_history_dot!.snp.right).offset(public_method.setFitSize(original: 7))
            make.top.equalTo(self.patient_history_detail!)
            make.width.equalTo(screen_size.width * 0.5)
            make.bottom.equalTo(self.patient_history_detail!.snp.bottom)
        })
        
        
        label_prescribeNumber.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.patient_history_date!)
            make.top.equalTo(self.patient_history_date!.snp.bottom).offset(public_method.setFitSize(original: 16))
            make.width.equalTo(screen_size.width * 0.15)
        }
        
        self.patient_history_prescribeNumber?.snp.makeConstraints({ (make) in
            
            make.top.bottom.equalTo(label_prescribeNumber)
            make.left.equalTo(label_prescribeNumber.snp.right).offset(public_method.setFitSize(original: 20))
            make.right.equalTo(self.patient_history_detail!.snp.right)
        })
        
        label_type.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.patient_history_date!)
            make.top.equalTo(label_prescribeNumber.snp.bottom).offset(public_method.setFitSize(original: 10))
            make.width.equalTo(screen_size.width * 0.15)
        }
        
        self.patient_history_type?.snp.makeConstraints({ (make) in
            
            make.top.bottom.equalTo(label_type)
            make.left.equalTo(label_type.snp.right).offset(public_method.setFitSize(original: 20))
            make.right.equalTo(self.patient_history_detail!.snp.right)
        })
        
        label_doctor.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.patient_history_date!)
            make.top.equalTo(label_type.snp.bottom).offset(public_method.setFitSize(original: 10))
            make.width.equalTo(screen_size.width * 0.15)
        }
        
        self.patient_history_doctor?.snp.makeConstraints({ (make) in
            
            make.top.bottom.equalTo(label_doctor)
            make.left.equalTo(label_doctor.snp.right).offset(public_method.setFitSize(original: 20))
            make.right.equalTo(self.patient_history_detail!.snp.right)
        })
        
        label_clinic.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.patient_history_date!)
            make.top.equalTo(label_doctor.snp.bottom).offset(public_method.setFitSize(original: 10))
            make.width.equalTo(screen_size.width * 0.15)
        }
        
        self.patient_history_clinic?.snp.makeConstraints({ (make) in
            
            make.top.bottom.equalTo(label_clinic)
            make.left.equalTo(label_clinic.snp.right).offset(public_method.setFitSize(original: 20))
            make.right.equalTo(self.patient_history_detail!.snp.right)
        })
    }
    
}

