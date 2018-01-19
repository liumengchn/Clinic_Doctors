//
//  PatientClinicParitiesViewController.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientClinicParitiesViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    var tableView:          UITableView?
    var dataSource:         Array<PatientClinicParitiesModel>?
    
    let swift_cell          = "PatientClinicParitiesViewControllerTableViewCell"
    
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
    
    func initializationDataSource() -> Void {
        
        DispatchQueue.global().async {
            
            for index in 0 ... 50 {
                
                let paritiesmodel = PatientClinicParitiesModel()
                paritiesmodel.patient_clinic_name_string = "四川省中医大省医院 \(index)"
                paritiesmodel.patient_clinic_score_string = "8.8 分"
                paritiesmodel.patient_clinic_address_string = "我也不知道他在上面地方，知道了我也不会告诉你"
                
                self.dataSource?.append(paritiesmodel)
                
                DispatchQueue.main.async {
                    
                    self.tableView?.reloadData()
                }
                
            }
        }
    }
    
    //MARK: 初始化基本控件
    func initializationBaseView() -> Void {
        
        self.tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(PatientClinicParitiesTableViewCell.self, forCellReuseIdentifier: swift_cell)
        self.view.addSubview(self.tableView!)
        
        self.tableView?.snp.makeConstraints({ (make) in
            
            make.top.left.right.bottom.equalTo(0)
        })
    }
    
    //MARK: tableView data source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PatientClinicParitiesTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: swift_cell)
        
        if indexPath.row == 3 {
            
            cell.patient_clinic_name?.text = "四川大学第二附属医院"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return public_method.setFitSize(original: 77.5)
    }
    
    //MARK: tableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
