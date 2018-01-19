//
//  PatientClinicHistoryDetailViewController.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/17.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientClinicHistoryDetailViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    var tableView:          UITableView?
    var dataSource:         NSArray?
    
    let swift_cell          = "PatientClinicHistoryDetailViewControllerCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.initializationDataSource()
        self.initializationBaseView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 数据源
    func initializationDataSource() -> Void {
        
        let model_head: PatientClinicHistoryDetailHeadModel = PatientClinicHistoryDetailHeadModel(img: "icon_header_img",
                                                                                                  name: "刘梦晨",
                                                                                                  sex: "男",
                                                                                                  year: "25岁",
                                                                                                  weight: "75Kg")
        
        let model_information: PatientClinicHistoryDetailInformationModel = PatientClinicHistoryDetailInformationModel(date: "2017年11月12日 12:00:00",
                                                                                                                       type: "急诊科",
                                                                                                                       clinic_type: "16656666",
                                                                                                                       price: "¥ 110.00",
                                                                                                                       description: "中医学认为，多梦的根本原因在于机体内在变化。古书中记载，气血不足、情志损伤、阴血亏虚、痰热内扰肝胆、劳累过度、饮食失节等原因都会导致多梦。")
        
        let model_hospital: PatientClinicHistoryDetailHospitalModel = PatientClinicHistoryDetailHospitalModel(hospital: "四川省人民医院",
                                                                                                              address: "成都市高新区府城大道339号")
        
        let model_doctor: PatientClinicHistoryDetailDoctorModel = PatientClinicHistoryDetailDoctorModel(doctor: "郑志勇",
                                                                                                        job: "主治医师")
        
        let dictionary1: NSDictionary  =    ["model":      model_head ,        "type":         Cell_type.head]
        let dictionary2: NSDictionary =     ["model":      model_information , "type":         Cell_type.information]
        let dictionary3: NSDictionary =     ["model":      model_hospital ,    "type":         Cell_type.hospital]
        let dictionary4: NSDictionary =     ["model":      model_doctor ,      "type":         Cell_type.doctor]
        
        self.dataSource = [dictionary1, dictionary2 , dictionary3 , dictionary4]
    }
    
    //MARK: 初始化基本控件
    func initializationBaseView() -> Void {
        
        self.tableView              = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        self.tableView?.delegate    = self
        self.tableView?.dataSource  = self
        self.tableView?.backgroundColor = getRGBColor(red: 238, green: 238, blue: 238, alpha: 1.0)
        self.tableView?.register(PatientClinicHistoryTableViewCell.self, forCellReuseIdentifier: self.swift_cell)
        self.view.addSubview(self.tableView!)
        
        //高度自适应
        self.tableView?.rowHeight           = UITableViewAutomaticDimension
        //设置预设定高度
        self.tableView?.estimatedRowHeight  = 44
        
        self.tableView?.snp.makeConstraints({ (make) in
            
            make.top.left.right.bottom.equalTo(0)
        })
    }
    
    //MARK: tableView data source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("总共 \((self.dataSource?.count)!) 个")
        
        return (self.dataSource?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PatientClinicHistoryDetailTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: self.swift_cell)
        
        let dictionary = self.dataSource![indexPath.row] as! NSDictionary
        
        if dictionary.object(forKey: "type") as! Cell_type == Cell_type.head {

            cell.model_header       = dictionary.object(forKey: "model") as? PatientClinicHistoryDetailHeadModel!
            cell.setParameterModel(type: dictionary.object(forKey: "type") as! Cell_type)
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
        }
        
        if dictionary.object(forKey: "type") as! Cell_type == Cell_type.information {
            
            cell.model_information = dictionary.object(forKey: "model") as? PatientClinicHistoryDetailInformationModel!
            cell.setParameterModel(type: dictionary.object(forKey: "type") as! Cell_type)
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
        }
        
        if dictionary.object(forKey: "type") as! Cell_type == Cell_type.hospital {
            
            cell.model_hospital     = dictionary.object(forKey: "model") as? PatientClinicHistoryDetailHospitalModel!
            cell.setParameterModel(type: dictionary.object(forKey: "type") as! Cell_type)
            
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        
        if dictionary.object(forKey: "type") as! Cell_type == Cell_type.doctor {
            
            cell.model_doctor       = dictionary.object(forKey: "model") as? PatientClinicHistoryDetailDoctorModel!
            cell.setParameterModel(type: dictionary.object(forKey: "type") as! Cell_type)
            
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return public_method.setFitSize(original: 160)
//    }
    
    //MARK: tableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

}
