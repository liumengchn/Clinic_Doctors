//
//  PatientCustomLabelView.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/17.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientCustomLabelView: UIView {
    
    var label_left:         UILabel?
    var label_right:        UILabel?

    //初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initializationBaseView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //自定义布局
    func initializationBaseView() -> Void {
        
        self.label_left = UILabel()
        self.label_left?.text = "这是左边的文字"
        self.label_left?.font = getFont(15)
        self.label_left?.textAlignment = NSTextAlignment.right
        self.label_left?.textColor = register_theme_color
        self.addSubview(self.label_left!)
        
        self.label_right = UILabel()
        self.label_right?.text = "这是右边的文字"
        self.label_right?.numberOfLines = 0
        self.label_right?.font = getFont(15)
        self.addSubview(self.label_right!)
        
        self.label_left?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(getFitSize(10))
            make.left.equalTo(getFitSize(13))
            make.width.greaterThanOrEqualTo(getFitSize(60))
            make.height.equalTo(getFitSize(20))
        })

        self.label_right?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.label_left!)
            make.left.equalTo(self.label_left!.snp.right).offset(getFitSize(18.5))
            make.right.equalTo(-getFitSize(52.5))
            make.bottom.equalTo(-getFitSize(10))
        })
    }
}
