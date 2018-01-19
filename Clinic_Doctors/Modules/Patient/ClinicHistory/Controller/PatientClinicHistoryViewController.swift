//
//  PatientClinicHistoryViewController.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientClinicHistoryViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    var tableView:          UITableView?
    var dataSource:         NSArray?
    
    let swift_cell          = "PatientClinicHistoryViewControllerTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.initializationBaseView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 初始化基本控件
    func initializationBaseView() -> Void {
        
        self.tableView              = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        self.tableView?.delegate    = self
        self.tableView?.dataSource  = self
        self.tableView?.register(PatientClinicHistoryTableViewCell.self, forCellReuseIdentifier: swift_cell)
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
        
        let cell = PatientClinicHistoryTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: swift_cell)
        
        cell.patient_history_prescribeNumber?.text = String(indexPath.row)
        cell.patient_history_type?.text?.append(String(indexPath.row))
        cell.patient_history_doctor?.text?.append(String(indexPath.row))
        cell.patient_history_clinic?.text?.append(String(indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return public_method.setFitSize(original: 140)
    }
    
    //MARK: tableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let clinicParitiesViewController = PatientClinicHistoryDetailViewController()
        clinicParitiesViewController.title = "就诊详情"
        clinicParitiesViewController.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController( clinicParitiesViewController, animated: true)
    }

}
