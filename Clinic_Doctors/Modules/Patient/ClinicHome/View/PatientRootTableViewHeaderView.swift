//
//  PatientRootTableViewHeaderView.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/17.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

//协议代理方法
protocol PatientRootTableViewHeaderViewDelegate {
    
    func headerView(headerView: UIView, buttonEvents section: Int) -> Void
}

class PatientRootTableViewHeaderView: UIView {

    var view_splite: UIView?
    var green_label: UILabel?
    var title_label: UILabel?
    var button_more: UIButton?
    var section: Int?
    
    var headerDeleagate: PatientRootTableViewHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.initializationBaseView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializationBaseView() -> Void {
        
        self.view_splite = UIView()
        self.view_splite?.backgroundColor = public_method.setRGBColor(red: 229, green: 229, blue: 229, alpha: 1.0)
        self.addSubview(self.view_splite!)
        
        self.green_label = UILabel()
        self.green_label?.backgroundColor = public_method.setRGBColor(red: 53, green: 213, blue: 174, alpha: 1.0)
        self.addSubview(self.green_label!)
        
        self.title_label = UILabel()
        self.title_label?.font = public_method.setFontSize(original_size: 16)
        self.addSubview(self.title_label!)
        
        self.button_more = UIButton(type: UIButtonType.system)
        self.button_more?.setTitle("更多", for: UIControlState.normal)
        self.button_more?.titleLabel?.font = public_method.setFontSize(original_size: 12)
        self.button_more?.addTarget(self, action: #selector(PatientRootTableViewHeaderView.responseToButtonEvents(sender:)), for: UIControlEvents.touchUpInside)
        self.addSubview(self.button_more!)
        
        self.view_splite?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self).offset(0)
            make.left.right.equalTo(self)
            make.height.equalTo(public_method.setFitSize(original: 10))
        })
        
        self.green_label?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self).offset(public_method.setFitSize(original: 12.5))
            make.top.equalTo(self.view_splite!.snp.bottom).offset(public_method.setFitSize(original: 5))
            make.bottom.equalTo(self).offset(0)
            make.width.equalTo(public_method.setFitSize(original: 3.85))
        })
        
        self.title_label?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.green_label!.snp.right).offset(public_method.setFitSize(original: 8))
            make.top.bottom.equalTo(self.green_label!)
            make.width.equalTo(screen_size.width * 0.5)
        })
        
        self.button_more?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(self.title_label!)
            make.right.equalTo(-public_method.setFitSize(original: 10))
            make.width.equalTo(public_method.setFitSize(original: 30))
        })
        
    }
    
    //按钮事件
    @objc func responseToButtonEvents(sender: UIButton) -> Void {
        
        self.headerDeleagate?.headerView(headerView: self, buttonEvents: self.section!)
    }

}
