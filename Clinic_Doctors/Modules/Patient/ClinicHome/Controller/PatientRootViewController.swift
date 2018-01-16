//
//  PatientRootViewController.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/15.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientRootViewController: UIViewController {

    var navigation_leftButton:              UIButton?
    var navigation_rightButton:             UIButton?
    var navigation_titleButton:             UIButton?
    
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
     
        self.navigationController?.customNavigationBar()
        self.navigation_leftButton                      = UIButton(type: UIButtonType.custom)
        self.navigation_leftButton?.titleLabel?.font    = public_method.setFontSize(original_size: 13)
        self.navigation_leftButton?.setTitle("我是人", for: UIControlState.normal)
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
        
        let clinicParitiesViewController = PatientClinicHistoryViewController()
        clinicParitiesViewController.title = "就诊记录"
        clinicParitiesViewController.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController( clinicParitiesViewController, animated: true)
    }
    
    //MARK: 初始化基础控件
    func initializationBaseView() -> Void {
        
        
    }
}
