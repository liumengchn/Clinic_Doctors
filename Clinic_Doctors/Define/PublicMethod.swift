//
//  PublicMethod.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

/** 配置block */
typealias Public_NetWorking_block = (String , Dictionary<String, JSON>, Bool) -> ()

class PublicMethod: NSObject {

    /** block回传json_data数据 */
    var public_method_block: Public_NetWorking_block?
    
    /** 设置颜色 */
    func setRGBColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    /** 设置尺寸属性比例 */
    func setFitSize(original: CGFloat) -> CGFloat {
            
        return original * screen_fit_width
    }
    
    /** 字体自适应 */
    func setFontSize(original_size: CGFloat) -> UIFont {
        
        return UIFont(name: "Arial", size: original_size * screen_fit_width)!
    }
    
    /** 像素转换成pt */
    func setPixelConversionPoint(_ pxSize: CGFloat) -> CGFloat {
        
        return pxSize * 0.5
    }
    
    /** string 转 cgfloat */
    func setStringToCGFloat(_ string: String) -> CGFloat {
        
        var cgFloat: CGFloat = 0
        
        if let doubleValue = Double(string) {
            
            cgFloat = CGFloat(doubleValue)
        }
        
        return cgFloat
    }
    
    /** 设置状态栏背景颜色 */
    func setStatusBarBackgroundColor(color : UIColor) {
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent //状态栏颜色
        
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        /*
         if statusBar.responds(to:Selector("setBackgroundColor:")) {
         statusBar.backgroundColor = color
         }*/
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
    
    /** 提示框弹出后，过段时间自动移除 */
    func setAlertController(title: String , view: UIView) -> Void {
        
        let controller = getNextResponseViewController(view)
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        //显示提示框
        controller.present(alertController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            controller.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
    /** 将plist文件中的 每个 key , value 属性 ，全变成字符串 */
    func setDictionaryAttributesToString(json_data: Dictionary<String, JSON>) -> NSMutableDictionary {
        
        let dictionary_result: NSMutableDictionary = [:]
        
        for (key , _) in json_data {
            
            let dictionary_sec: NSMutableDictionary = [:]
            
            for (seckey, _) in json_data[key]! {
                
                let vvalue = json_data[key]![seckey].stringValue
                
                dictionary_sec.setValue(vvalue, forKey: seckey)
            }
            
            dictionary_result.setValue(dictionary_sec, forKey: key)
        }
        
        return dictionary_result
    }
    
    /** 将字典数据保存到plist文件中 */
    func setUserInformationSaveToPlistFile(paramaters: NSDictionary , plist_path: String) -> Void {
        
        if file_manager.fileExists(atPath: plist_path) {
            
            try! file_manager.removeItem(atPath: plist_path)//删除原文件
        }
        
        print("plist_path = \(plist_path)")
        
        let is_write = paramaters.write(toFile: plist_path, atomically: true)
        
        if is_write {
            
            print("写入成功")
        }else {
            
            print("写入失败")
        }
    }
    
    /** 设置 textField placeholder颜色 */
    func setTextFieldPlaceholderColor(_ textField: UITextField, _ icon_leftView: String, _ placeholder_string: String, _ placeholder_color: UIColor, _  font_size: CGFloat) -> Void { //label 公共设置
        
        textField.placeholder = placeholder_string
        
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        
        textField.font = setFontSize(original_size: font_size)
        textField.clearButtonMode = UITextFieldViewMode.whileEditing //clear button
        textField.textColor = UIColor.white //text color
        
        if icon_leftView != "" {
            
            let image = UIImage(named: icon_leftView)
            textField.leftView = UIImageView(image: image)
            textField.leftViewMode = UITextFieldViewMode.always
        }
        
        textField.setValue( setFontSize(original_size: font_size), forKeyPath: "_placeholderLabel.font") //placeholder字体大小
        textField.setValue(placeholder_color, forKeyPath: "_placeholderLabel.textColor") //placeholder字体颜色
    }
    
    
    /** 获取沙盒文件夹路径 */
    func getDocumentsDirectory() -> String {
        
        let document_path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                                FileManager.SearchPathDomainMask.userDomainMask,
                                                                true).first!
        
        return document_path
    }
    
    //MARK: 获取字符串的size
    /** 获取字符串的size  */
    func getTextStringSize(string: String ,max_width: CGFloat ,font_size: CGFloat) -> CGSize {
        
        
        var max_width_value: CGFloat?
        
        if max_width == 0 {
            
            max_width_value = screen_size.width * 0.6
            
        }else {
            
            max_width_value = max_width
        }
        
        //计算文字宽度
        let size = NSString(string: string).boundingRect(with: CGSize(width: max_width_value!, height: CGFloat(MAXFLOAT)),
                                                         options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                         attributes: [NSAttributedStringKey.font: setFontSize(original_size: font_size + 2)],
                                                         context: nil)
        
        
        return CGSize(width: size.width + setFitSize(original: 10), height: size.height)
    }
    
    /** 获取下一个响应者 */
    func getNextResponseViewController(_ view: UIView) -> UIViewController {
        
        //1.通过响应链关系，取得此视图的下一个响应者
        var next: UIResponder? = view.next
        repeat {
            
            //2.判断响应者对象是否是视图控制器类
            if (next as? UIViewController) != nil { return (next as! UIViewController) } else {  next = next?.next }
            
        }while next != nil
        
        return UIViewController()
    }
    
    
    
    /** 正则表达式 判断电话号码 */
    func isTelNumber(number: String) -> Bool {
        
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)" //移动
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)" //联通
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)" //电信
        
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@", mobile)
        let regextestcm     = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu     = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct     = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if regextestmobile.evaluate(with: number) == true || regextestcm.evaluate(with: number)  == true || regextestct.evaluate(with: number) == true  || regextestcu.evaluate(with: number) == true {
            
            return true
            
        }else {
            
            return false
        }
    }
    
    
    
    
    
    /*********************************************** 网络请求 ***********************************************/
    func postToGetNetworkingRequestionData( url_string: String , parameters: NSDictionary) -> Void {
        
        Alamofire.request(url_string, method: HTTPMethod.post, parameters: (parameters as! Dictionary))
            .responseJSON { (response) in
                
                debugPrint(response)
                let json            = try! JSON(data: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                let remark_string   = json["remark"].string
                let result_bool     = json["result"].bool!
                
                /** 数据请求获取成功 */
                if result_bool == true {
                    
                    let json_data = json["data"].dictionary!
                    
                    self.public_method_block?(remark_string ?? "", json_data, result_bool)
                }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
