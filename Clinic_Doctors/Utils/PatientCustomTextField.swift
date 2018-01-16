//
//  PatientCustomTextField.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientCustomTextField: UITextField {

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect { //改变图片与textField最左边的距离
        
        let leftViewRect = super.leftViewRect(forBounds: bounds)
        
        //        leftViewRect.origin.x += 16 //要往右偏多少根据自己需求，改变这个数字就好
        
        return leftViewRect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect { //改变图片与textField文字的距离
        
        var rect = super.textRect(forBounds: bounds)
        
        rect.origin.x += 15.5 //要往右便宜多少根据自己的需求改变
        rect.size.width -= 15
        
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect { //当所有人都以为这样完美解决问题了，但是当在我们textField输入文字的时候，文本和leftView又黏在一起了，我们还得重写一个方法来改变正在编辑时候的rect。
        
        var rect = super.textRect(forBounds: bounds)
        
        rect.origin.x += 15.5 //要往右便宜多少根据自己的需求改变
        rect.size.width -= 15
        
        return rect
    }

}
