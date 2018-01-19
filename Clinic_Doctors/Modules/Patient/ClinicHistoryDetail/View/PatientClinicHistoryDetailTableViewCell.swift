//
//  PatientClinicHistoryDetailTableViewCell.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/17.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

enum Cell_type {
    
    case head
    case information
    case hospital
    case doctor
}

class PatientClinicHistoryDetailTableViewCell: UITableViewCell {

    var model_header:               PatientClinicHistoryDetailHeadModel?
    
    //头像个人信息模块
    var patient_imageView:          UIImageView?
    var patient_name:               UILabel?
    var patient_sex:                UILabel?
    var patient_year:               UILabel?
    var patient_weight:             UILabel?
    
    
    var model_information: PatientClinicHistoryDetailInformationModel?
    
    //看病模块
    var patient_date:               PatientCustomLabelView?
    var patient_type:               PatientCustomLabelView?
    var patient_clinic_type:        PatientCustomLabelView?
    var patient_price:              PatientCustomLabelView?
    var patient_description:        PatientCustomLabelView?
    
    var model_doctor:               PatientClinicHistoryDetailDoctorModel?
    var model_hospital:             PatientClinicHistoryDetailHospitalModel?
    
    //两排
    var patient_two_left:           PatientCustomLabelView?
    var patient_two_right:          PatientCustomLabelView?
    
    
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func setParameterModel( type: Cell_type ) -> Void {
        
        switch type {
            
        case Cell_type.head:
            self.initializationHeader()
            
            self.patient_imageView?.image   = UIImage(named: model_header!.history_detail_img!)
            self.patient_name?.text         = model_header!.history_detail_name!
            self.patient_sex?.text          = model_header!.history_detail_sex!
            self.patient_year?.text         = model_header!.history_detail_year!
            self.patient_weight?.text       = model_header!.history_detail_weight!
            
//            var patient_date:               PatientCustomLabelView?
//            var patient_type:               PatientCustomLabelView?
//            var patient_clinic_type:        PatientCustomLabelView?
//            var patient_price:              PatientCustomLabelView?
//            var patient_description:        PatientCustomLabelView?
            
        case Cell_type.information:
            self.initializationPatientInformation()
            
            self.patient_date?.label_left?.text         = "就诊时间"
            self.patient_date?.label_right?.text        = model_information?.history_detail_date
            
            self.patient_type?.label_left?.text         = "类型"
            self.patient_type?.label_right?.text        = model_information?.history_detail_type
            
            self.patient_clinic_type?.label_left?.text  = "就诊类型"
            self.patient_clinic_type?.label_right?.text = model_information?.history_detail_clinic_type
            
            self.patient_price?.label_left?.text        = "价格"
            self.patient_price?.label_right?.text       = model_information?.history_detail_prices
            
            self.patient_description?.label_left?.text  = "症状描述"
            self.patient_description?.label_right?.text = model_information?.history_detail_description
            
        case Cell_type.hospital:
            self.initializationBase()
            
            self.patient_two_left?.label_left?.text     = "所属医院"
            self.patient_two_left?.label_right?.text    = model_hospital?.history_detail_hospital
            
            self.patient_two_right?.label_left?.text     = "地址"
            self.patient_two_right?.label_right?.text    = model_hospital?.history_detail_address
            
        case Cell_type.doctor:
            self.initializationBase()
            
            self.patient_two_left?.label_left?.text     = "所属医生"
            self.patient_two_left?.label_right?.text    = model_doctor?.history_detail_doctor
            
            self.patient_two_right?.label_left?.text     = "医师职称"
            self.patient_two_right?.label_right?.text    = model_doctor?.history_detail_job
        }
    }
    
    //头像个人信息模块
    func initializationHeader() -> Void {
        
        self.patient_imageView = UIImageView()
        self.patient_imageView?.backgroundColor = UIColor.orange
        self.patient_imageView?.layer.cornerRadius = getFitSize(24.5)
        self.contentView.addSubview(self.patient_imageView!)
        
        self.patient_name = UILabel()
        self.patient_name?.text = "刘梦晨"
        self.patient_name?.font = getFont(17)
        self.contentView.addSubview(self.patient_name!)
        
        self.patient_sex = UILabel()
        self.patient_sex?.text = "男"
        self.patient_sex?.font = getFont(14)
        self.patient_sex?.textColor = register_theme_color
        self.contentView.addSubview(self.patient_sex!)
        
        self.patient_year = UILabel()
        self.patient_year?.text = "25岁"
        self.patient_year?.font = getFont(14)
        self.patient_year?.textColor = register_theme_color
        self.contentView.addSubview(self.patient_year!)
        
        self.patient_weight = UILabel()
        self.patient_weight?.text = "70kg"
        self.patient_weight?.font = getFont(14)
        self.patient_weight?.textColor = register_theme_color
        self.contentView.addSubview(self.patient_weight!)
        
        self.patient_imageView?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.contentView).offset(getFitSize(20))
            make.left.equalTo(self.contentView).offset(getFitSize(12))
            make.width.height.equalTo(getFitSize(49))
            make.bottom.equalTo(-getFitSize(20))
        })
        
        self.patient_name?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.patient_imageView!.snp.right).offset(getFitSize(14))
            make.top.equalTo(self.patient_imageView!.snp.top).offset(getFitSize(5))
            make.height.equalTo(getStringHeight(font_size: 17))
        })
        
        self.patient_sex?.snp.makeConstraints({ (make) in
            
            make.bottom.equalTo(self.patient_imageView!.snp.bottom).offset(getFitSize(0))
            make.left.equalTo(self.patient_imageView!.snp.right).offset(getFitSize(14))
            make.width.greaterThanOrEqualTo(getFitSize(20))
        })
        
        self.patient_year?.snp.makeConstraints({ (make) in
            
            make.bottom.equalTo(self.patient_imageView!.snp.bottom).offset(getFitSize(0))
            make.left.equalTo(self.patient_sex!.snp.right).offset(getFitSize(5))
            make.width.greaterThanOrEqualTo(getFitSize(20))
        })
        
        self.patient_weight?.snp.makeConstraints({ (make) in
            
            make.bottom.equalTo(self.patient_imageView!.snp.bottom).offset(getFitSize(0))
            make.left.equalTo(self.patient_year!.snp.right).offset(getFitSize(5))
            make.width.greaterThanOrEqualTo(getFitSize(30))
        })
    }
    
    //看病模块
//    var patient_date:               PatientCustomLabelView?
//    var patient_type:               PatientCustomLabelView?
//    var patient_clinic_type:        PatientCustomLabelView?
//    var patient_price:              PatientCustomLabelView?
//    var patient_description:        PatientCustomLabelView?
    
    //四行数据板块
    func initializationPatientInformation() -> Void {
        
        self.patient_date = PatientCustomLabelView()
        self.contentView.addSubview(self.patient_date!)
        
        self.patient_type = PatientCustomLabelView()
        self.contentView.addSubview(self.patient_type!)
        
        self.patient_clinic_type = PatientCustomLabelView()
        self.contentView.addSubview(self.patient_clinic_type!)
        
        self.patient_price = PatientCustomLabelView()
        self.contentView.addSubview(self.patient_price!)
        
        self.patient_description = PatientCustomLabelView()
        self.contentView.addSubview(self.patient_description!)
        
        self.patient_date?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.contentView).offset(getFitSize(5))
            make.left.right.equalTo(self.contentView).offset(getFitSize(0))
            make.height.equalTo(getFitSize(44))
        })
        
        self.patient_type?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.patient_date!.snp.bottom).offset(0)
            make.left.right.equalTo(self.contentView).offset(getFitSize(0))
            make.height.greaterThanOrEqualTo(getFitSize(44))
        })
        
        self.patient_clinic_type?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.patient_type!.snp.bottom).offset(0)
            make.left.right.equalTo(self.contentView).offset(getFitSize(0))
            make.height.greaterThanOrEqualTo(getFitSize(44))
        })
        
        self.patient_price?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.patient_clinic_type!.snp.bottom).offset(0)
            make.left.right.equalTo(self.contentView).offset(getFitSize(0))
            make.height.greaterThanOrEqualTo(getFitSize(44))
        })
        
        self.patient_description?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.patient_price!.snp.bottom).offset(0)
            make.left.right.equalTo(self.contentView).offset(getFitSize(0))
            make.height.greaterThanOrEqualTo(getFitSize(44))
            make.bottom.equalTo(self.contentView).offset(-5)
        })
    }
    
    //两行数据板块
    func initializationBase() -> Void {
        
        self.patient_two_left = PatientCustomLabelView()
        self.contentView.addSubview(self.patient_two_left!)
        
        self.patient_two_right = PatientCustomLabelView()
        self.contentView.addSubview(self.patient_two_right!)
        
        self.patient_two_left?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.contentView).offset(getFitSize(5))
            make.left.right.equalTo(self.contentView).offset(getFitSize(0))
            make.height.greaterThanOrEqualTo(getFitSize(30))
        })
        
        self.patient_two_right?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.patient_two_left!.snp.bottom).offset(getFitSize(0))
            make.left.right.equalTo(self.contentView).offset(getFitSize(0))
            make.height.greaterThanOrEqualTo(getFitSize(30))
            make.bottom.equalTo(-getFitSize(5))
        })
    }
    
}
