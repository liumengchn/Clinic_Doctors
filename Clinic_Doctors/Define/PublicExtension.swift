//
//  PublicExtension.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

//MARK: UINavigationController方法延展
extension UINavigationController {
    
    /** 自定义导航栏属性 */
    func customNavigationBar() -> Void {
        
        //导航栏背景颜色
        self.navigationBar.barTintColor = patient_theme_color
        //导航栏文字颜色
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        //导航栏按钮颜色
        self.navigationBar.tintColor = UIColor.white
    }
}

//MARK: UIImage 方法延展(添加)
extension UIImage {
    
    /** 重设UIImage大小 */
    func toReSizeImage(resize: CGSize) -> UIImage { //重设UIImage大小
        
        UIGraphicsBeginImageContextWithOptions(resize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: resize.width, height: resize.height))
        let resizeImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizeImage
    }
    
    /** 等比例缩放
        image = image?.scaleImage(scaleSize: scaleflot)
     */
    func toScaleImage(scaleSize: CGFloat) -> UIImage {
        
        let resize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        
        return toReSizeImage(resize: resize)
    }
}

//MARK: 自由调整图标按钮中的图标和文字位置（扩展UIButton）
/** 自由调整图标按钮中的图标和文字位置（扩展UIButton）
     btn1.set(image: UIImage(named: "alert"), title: "文字在左侧", titlePosition: .Left, additionalSpacing: 10.0, state: .Normal)
     btn2.set(image: UIImage(named: "alert"), title: "文字在右侧", titlePosition: .Right, additionalSpacing: 10.0, state: .Normal)
     btn3.set(image: UIImage(named: "alert"), title: "文字在上方", titlePosition: .Top, additionalSpacing: 10.0, state: .Normal)
     btn4.set(image: UIImage(named: "alert"), title: "文字在下方", titlePosition: .Bottom, additionalSpacing: 10.0, state: .Normal)
 
 */
extension UIButton { //自定义图文位置
    
    /** 动态设定文字变化宽度 */
    func dynamicSetButtonTitleAndImage(_ title_string: String , _ max_width: CGFloat , _ font_size: CGFloat) -> Void {
        
        let text_string_size = public_method.getTextStringSize(string: title_string, max_width: max_width, font_size: font_size)
        
        self.frame.size = text_string_size
        
        self.set(UIImage(named: "icon_suofang")?.toScaleImage(scaleSize: 0.7), title_string, UIViewContentMode.left, public_method.setFitSize(original: 10), UIControlState.normal)
    }
    
    /** 自定义图文位置 */
    @objc func set(_ anImage: UIImage?,_ title: String,_ titlePosition: UIViewContentMode,_ additionalSpacing: CGFloat,_ state: UIControlState) {
        
        self.imageView?.contentMode = UIViewContentMode.center
        self.setImage(anImage, for: state)
        
        self.positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = UIViewContentMode.center
        self.setTitle(title, for: UIControlState.normal)
    }
    
    private func positionLabelRespectToImage(title : String , position : UIViewContentMode , spacing : CGFloat) {
        
        let imageSize       = self.imageRect(forContentRect: self.frame)
        let titleFont       = self.titleLabel?.font
        let titleSize       = title.size(withAttributes: [NSAttributedStringKey.font: titleFont!])
        
        var titleInsets     : UIEdgeInsets
        var imageInsets     : UIEdgeInsets
        
        switch position {
        case UIViewContentMode.top:
            
            titleInsets     = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing), left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
            
        case UIViewContentMode.bottom:
            
            titleInsets     = UIEdgeInsets(top: imageSize.height + titleSize.height + spacing, left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
            
        case UIViewContentMode.left:
            
            titleInsets     = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(titleSize.width * 2 + spacing))
            
        case UIViewContentMode.right:
            
            titleInsets     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        default:
            
            titleInsets     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}

//MARK: - UIDevice延展
public extension UIDevice {
    
    var device_name: String {
        var systemInfo      = utsname()
        uname(&systemInfo)
        let machineMirror   = Mirror(reflecting: systemInfo.machine)
        let identifier      = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod1,1":                             return "iPod Touch 1"
        case "iPod2,1":                             return "iPod Touch 2"
        case "iPod3,1":                             return "iPod Touch 3"
        case "iPod4,1":                             return "iPod Touch 4"
        case "iPod5,1":                             return "iPod Touch (5 Gen)"
        case "iPod7,1":                             return "iPod Touch 6"
            
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
        case "iPhone4,1":                           return "iPhone 4s"
        case "iPhone5,1":                           return "iPhone 5"
        case  "iPhone5,2":                          return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":                           return "iPhone 5c (GSM)"
        case "iPhone5,4":                           return "iPhone 5c (GSM+CDMA)"
        case "iPhone6,1":                           return "iPhone 5s (GSM)"
        case "iPhone6,2":                           return "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":                           return "iPhone 6"
        case "iPhone7,1":                           return "iPhone 6 Plus"
        case "iPhone8,1":                           return "iPhone 6s"
        case "iPhone8,2":                           return "iPhone 6s Plus"
        case "iPhone8,4":                           return "iPhone SE"
        case "iPhone9,1":                           return "国行、日版、港行iPhone 7"
        case "iPhone9,2":                           return "港行、国行iPhone 7 Plus"
        case "iPhone9,3":                           return "美版、台版iPhone 7"
        case "iPhone9,4":                           return "美版、台版iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":             return "iPhone 8"
        case "iPhone10,2","iPhone10,5":             return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":             return "iPhone X"
            
        case "iPad1,1":   return "iPad"
        case "iPad1,2":   return "iPad 3G"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":   return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":       return "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":       return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":       return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":       return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":       return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":       return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                  return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":                  return "iPad Air 2"
        case "iPad6,3", "iPad6,4":                  return "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":                  return "iPad Pro 12.9"
        case "AppleTV2,1":                          return "Apple TV 2"
        case "AppleTV3,1","AppleTV3,2":             return "Apple TV 3"
        case "AppleTV5,3":                          return "Apple TV 4"
        case "i386", "x86_64":                      return "Simulator"
        default:                                    return identifier
        }
    }
}




