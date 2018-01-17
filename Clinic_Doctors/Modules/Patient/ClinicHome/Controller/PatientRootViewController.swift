//
//  PatientRootViewController.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/15.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientRootViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , PatientRootTableViewHeaderViewDelegate {

    var navigation_leftButton:              UIButton?
    var navigation_rightButton:             UIButton?
    var navigation_titleButton:             UIButton?
    
    var tableView: UITableView?
    var bottomView: UIView?
    
    let swift_identifier_history        = "ClinicHistoryTableViewCellIdentifier"
    let swift_identifier_parities       = "PatientClinicParitiesTableViewCellIdentifier"
    let swift_identifier_doctor         = "PatientClinicDoctorTableViewCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.initializationDataSource()
        self.initializationNavigationBar()
        self.initializationBaseView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 自定义导航栏控件
    func initializationNavigationBar() -> Void {
     
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.customNavigationBar()
        self.navigation_leftButton                      = UIButton(type: UIButtonType.custom)
        self.navigation_leftButton?.titleLabel?.font    = public_method.setFontSize(original_size: 13)
        self.navigation_leftButton?.dynamicSetButtonTitleAndImage("乌鲁木齐", screen_size.width * 0.16, 13)
        
        self.navigation_rightButton                     = UIButton(type: UIButtonType.custom)
        self.navigation_rightButton?.frame.size         = CGSize(width: screen_size.width * 0.16, height: 30)
        self.navigation_rightButton?.setImage(UIImage(named: "icon_search"), for: UIControlState.normal)
        
        self.navigation_titleButton                     = UIButton(type: UIButtonType.custom)
        self.navigation_titleButton?.frame.size         = CGSize(width: screen_size.width * 0.6, height: 30)
        self.navigation_titleButton?.setBackgroundImage(UIImage(named: "icon_search-box")?.toScaleImage(scaleSize: public_method.setFitSize(original: 0.70)), for: UIControlState.normal)
        
        self.navigation_titleButton?.titleLabel?.lineBreakMode = .byTruncatingTail
        self.navigation_titleButton?.setTitle("搜索门诊位置/类型...", for: UIControlState.normal)
        self.navigation_titleButton?.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.navigation_titleButton?.titleLabel?.font = public_method.setFontSize(original_size: 13)
        
        self.navigationItem.leftBarButtonItem           = UIBarButtonItem(customView: self.navigation_leftButton!)
        self.navigationItem.rightBarButtonItem          = UIBarButtonItem(customView: self.navigation_rightButton!)
        self.navigationItem.titleView                   = self.navigation_titleButton!
    }
    
    //MARK: 初始化数据源
    func initializationDataSource() -> Void {
        
//        let clinicParitiesViewController = PatientClinicParitiesViewController()
//        clinicParitiesViewController.title = "门诊评价"
//        clinicParitiesViewController.view.backgroundColor = UIColor.white
//        self.navigationController?.pushViewController( clinicParitiesViewController, animated: true)
        
//        let clinicParitiesViewController = PatientClinicDoctorViewController()
//        clinicParitiesViewController.title = "签约医生"
//        clinicParitiesViewController.view.backgroundColor = UIColor.white
//        self.navigationController?.pushViewController( clinicParitiesViewController, animated: true)
        
//        let clinicParitiesViewController = PatientClinicHistoryViewController()
//        clinicParitiesViewController.title = "就诊记录"
//        clinicParitiesViewController.view.backgroundColor = UIColor.white
//        self.navigationController?.pushViewController( clinicParitiesViewController, animated: true)
        
        
    }
    
    //MARK: 初始化基础控件
    func initializationBaseView() -> Void {
        
        self.bottomView = UIView()
        self.bottomView?.backgroundColor = UIColor.green
        self.view.addSubview(self.bottomView!)
        
        self.tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(ClinicHistoryTableViewCell.self, forCellReuseIdentifier: self.swift_identifier_history)
        self.tableView?.register(PatientClinicParitiesTableViewCell.self, forCellReuseIdentifier: self.swift_identifier_parities)
        self.tableView?.register(PatientClinicDoctorTableViewCell.self, forCellReuseIdentifier: self.swift_identifier_doctor)
//        //设置大概高度
//        self.tableView?.estimatedRowHeight = public_method.setFitSize(original: 77.5)
//        //设置行高为自动适配
//        self.tableView?.rowHeight = UITableViewAutomaticDimension
        
        self.view.addSubview(self.tableView!)
        
        self.bottomView?.snp.makeConstraints({ (make) in
            
            make.left.right.bottom.equalTo(self.view).offset(0)
            make.height.equalTo(public_method.setFitSize(original: 54))
        })
        
        self.tableView?.snp.makeConstraints({ (make) in
            
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(self.bottomView!.snp.top)
        })
    }
    
    //MARK: tableView data source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = PatientClinicParitiesTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: swift_cell)
        
        var cell: UITableViewCell?
        
        if indexPath.section == 0 {
        
            cell = ClinicHistoryTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: self.swift_identifier_history)
            
        }else if indexPath.section == 1 {
            
            cell = PatientClinicParitiesTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: self.swift_identifier_parities)
            
        }else if indexPath.section == 2 {
            
            cell = PatientClinicDoctorTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: self.swift_identifier_parities)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 1 {
            
            return public_method.setFitSize(original: 77.5)
            
        } else if indexPath.section == 2 {
            
            return public_method.setFitSize(original: 93.5)
        }
        
        return public_method.setFitSize(original: 200)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            
            return 0
        }
        
        return public_method.setFitSize(original: 37)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = PatientRootTableViewHeaderView(frame: CGRect(x: 0, y: 10, width: screen_size.width, height: public_method.setFitSize(original: 37)))
        
        headerView.headerDeleagate = self
        headerView.section = section
        
        if section == 1 {
            
            headerView.title_label?.text = "门诊评价"
            
        }else if section == 2 {
            
            headerView.title_label?.text = "签约医生"
        }
        
        return headerView
    }
    
    //MARK: tableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            
            let viewController = PatientClinicHistoryViewController()
            viewController.title = "就诊记录"
            viewController.view.backgroundColor = UIColor.white
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    //MARK: Patient_RootHeaderViewDelegate
    func headerView(headerView: UIView, buttonEvents section: Int) {
        
        var viewController: UIViewController?
        
        if section == 1 {
            
            viewController = PatientClinicParitiesViewController()
            viewController?.title = "门诊评价"
        }
            
        else if section == 2 {
            
            viewController = PatientClinicDoctorViewController()
            viewController?.title = "签约医生"
        }
        
        viewController?.view.backgroundColor = UIColor.white
        
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    //MARK: Scroll view delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.tableView { //headerview跟随移动
            
            let sectionHeaderHeight: CGFloat = public_method.setFitSize(original: 37) //此高度为heightForHeaderInSection高度值
            
            if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0 {
                
                scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
                
            } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
                
                scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            }
        }
    }
}
