//
//  PublicSimplifiedMethod.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/17.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

/** 获取比例后的尺寸大小 */
func getFitSize(_ size: CGFloat) -> CGFloat {
    
    return public_method.setFitSize(original: size)
}

/** 获取比例后的文字大小 */
func getFont(_ size: CGFloat) -> UIFont {
    
    return public_method.setFontSize(original_size: size)
}

/** 获取文字尺寸 */
func getStringSize(_ string: String , _ max_width: CGFloat , font_size: CGFloat) -> CGSize {
    
    return public_method.getTextStringSize(string: string, max_width: max_width, font_size: font_size)
}

/** 获取文字高度 */
func getStringHeight(font_size: CGFloat) -> CGFloat {
    
    return public_method.getTextStringSize(string: "这是一段测试文字", max_width: 0, font_size: font_size).height
}

func getRGBColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    
    return public_method.setRGBColor(red: red, green: green, blue: blue, alpha: alpha)
}
