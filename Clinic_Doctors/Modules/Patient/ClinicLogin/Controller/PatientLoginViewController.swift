//
//  PatientLoginViewController.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/15.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit
import SnapKit

class PatientLoginViewController: UIViewController , UITextFieldDelegate {

    var imageView_logo      : UIImageView?
    var textField_phone     : PatientCustomTextField?
    var textField_password  : PatientCustomTextField?
    var label_line1         : UILabel?
    var label_line2         : UILabel?
    var button_login        : UIButton?
    var button_register     : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initializationNavigationBar()
        self.initializationBaseView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializationNavigationBar() -> Void {
        
        self.view.backgroundColor = patient_theme_color
    }
    
    func initializationBaseView() -> Void {
        
        //logo
        self.imageView_logo = UIImageView()
        self.imageView_logo?.image = UIImage(named: "icon_logo")
        self.view.addSubview(self.imageView_logo!)
        
        //输入框 用户名
        self.textField_phone = PatientCustomTextField()
        self.textField_phone?.keyboardType = UIKeyboardType.numberPad
        self.textField_phone?.returnKeyType = UIReturnKeyType.next
        self.textField_phone?.delegate = self
        public_method.setTextFieldPlaceholderColor(self.textField_phone!, "icon_phone", "手机号码", UIColor.white, 14)
        self.view.addSubview(self.textField_phone!)
        
        self.label_line1 = UILabel()
        self.label_line1?.backgroundColor = UIColor.white
        self.view.addSubview(self.label_line1!)
        
        //输入框 密码
        self.textField_password = PatientCustomTextField()
        self.textField_password?.delegate = self
        self.textField_password?.keyboardType = UIKeyboardType.asciiCapable
        public_method.setTextFieldPlaceholderColor(self.textField_password!, "icon_password", "密码", UIColor.white, 14)
        self.view.addSubview(self.textField_password!)
        
        self.label_line2 = UILabel()
        self.label_line2?.backgroundColor = UIColor.white
        self.view.addSubview(self.label_line2!)
        
        //按钮 登陆
        self.button_login = UIButton(type: UIButtonType.custom)
        self.button_login?.setBackgroundImage(UIImage(named: "icon_login"), for: UIControlState.normal)
        self.button_login?.setTitle("登陆", for: UIControlState.normal)
        self.button_login?.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.button_login?.titleLabel?.font = public_method.setFontSize(original_size: 15)
        self.button_login?.addTarget(self, action: #selector(PatientLoginViewController.responseToLoginButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.button_login!)
        
        //按钮 注册
        self.button_register = UIButton(type: UIButtonType.system)
        self.button_register?.setTitle("注册", for: UIControlState.normal)
        self.button_register?.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.button_register?.titleLabel?.font = public_method.setFontSize(original_size: 15)
        self.button_register?.addTarget(self, action: #selector(PatientLoginViewController.responseToRegisterButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.button_register!)
        
        
        self.imageView_logo?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(public_method.setFitSize(original: 105.5))
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSize(width: public_method.setFitSize(original: 89.5), height: public_method.setFitSize(original: 89.5)))
        })
        
        self.textField_phone?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.imageView_logo!.snp.bottom).offset(public_method.setFitSize(original: 102.5))
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.76)
            make.height.equalTo(public_method.setFitSize(original: 44))
        })
        
        self.label_line1?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.textField_phone!.snp.bottom).offset(0)
            make.left.equalTo(self.textField_phone!.snp.left).offset(37.5)
            make.right.equalTo(self.textField_phone!)
            make.height.equalTo(1)
        })
        
        self.textField_password?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.label_line1!.snp.bottom).offset(public_method.setFitSize(original: 27.5))
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.76)
            make.height.equalTo(public_method.setFitSize(original: 44))
        })
        
        self.label_line2?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.textField_password!.snp.bottom).offset(0)
            make.left.equalTo(self.textField_password!.snp.left).offset(37.5)
            make.right.equalTo(self.textField_password!)
            make.height.equalTo(1)
        })
        
        self.button_login?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.label_line2!.snp.bottom).offset(public_method.setFitSize(original: 82))
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.76)
            make.height.equalTo(public_method.setFitSize(original: 44))
        })
        
        self.button_register?.snp.makeConstraints({ (make) in
            
            make.bottom.equalTo(self.view).offset(-public_method.setFitSize(original: 18.5))
            make.centerX.equalTo(self.view)
            make.width.equalTo(public_method.getTextStringSize(string: (self.button_register?.titleLabel?.text)!, max_width: 0, font_size: 15))
//            make.width.equalTo(getTextStringSize(string: (self.button_register?.titleLabel?.text)!, max_width: 0, font_size: 15))
        })
    }
    
    //MARK: textField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.returnKeyType == UIReturnKeyType.default {
            
            print("default")
            self.textField_password?.resignFirstResponder() //键盘收起
            return false
        }
        
        if textField == self.textField_phone {
            
            self.textField_password?.becomeFirstResponder()
        }else {
            
            self.textField_phone?.becomeFirstResponder()
        }
        
        return true
    }
    
    //MARK: touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    //MARK: button events
    @objc func responseToLoginButton(sender: UIButton) -> Void { //登陆按钮
        
//        let parameters: NSDictionary = [
//
//            "accountName"   :   self.textField_phone!.text!,
//            "loginType"     :   "1", //登录方式：  1、密码登录 2、验证码登录
//            "accountPwd"    :   self.textField_password!.text!,
//            "loginCode"     :   "123" //短信验证码
//        ]
        
        let navigationController = UINavigationController(rootViewController: PatientRootViewController())
        
        self.present(navigationController, animated: true, completion: nil)
        
    }
    
    @objc func responseToRegisterButton(sender: UIButton) -> Void { //注册按钮
        
        self.present(PatientRegisterViewController(), animated: true, completion: nil)
    }

}
