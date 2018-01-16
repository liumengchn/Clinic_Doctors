//
//  PatientRegisterViewController.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/15.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class PatientRegisterViewController: UIViewController {

    var view_top                : UIView?
    var view_mid                : UIView?
    var textField_phone         : PatientCustomTextField?
    var textField_verification  : UITextField?
    var button_getvericate_code : UIButton?
    var textField_password      : UITextField?
    var label_line1             : UILabel?
    var label_line2             : UILabel?
    var label_line3             : UILabel?
    var button_register         : UIButton?
    var button_back             : UIButton?
    
    var remainingSeconds         = 0 { //倒计时秒
        willSet {
            
            var title_string = "\(newValue)秒后重新获取"
            self.button_getvericate_code?.setTitle( title_string, for: UIControlState.normal)
            
            if newValue <= 0 {
                title_string = "重新获取验证码"
                self.button_getvericate_code?.setTitle( title_string, for: UIControlState.normal)
                self.isCounting = false
            }
            self.button_getvericate_code?.frame = CGRect(x: 0, y: 0, width: public_method.getTextStringSize(string: title_string, max_width: 0, font_size: 12).width + 20, height: public_method.setFitSize(original: 30))
            self.button_getvericate_code?.setTitleColor(UIColor.white, for: UIControlState.normal)
        }
    }
    var countdown_timer: Timer?
    var isCounting = false { //是否倒计时
        
        willSet {
            
            if newValue {
                
                self.countdown_timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PatientRegisterViewController.responseToupdateTime(_:)), userInfo: nil, repeats: true)
                self.remainingSeconds = 5 //设计倒计时5秒
                self.button_getvericate_code?.backgroundColor = UIColor.blue
                self.button_getvericate_code?.setTitleColor(UIColor.white, for: UIControlState.normal)
            }else {
                
                self.countdown_timer?.invalidate()
                self.countdown_timer = nil
                
                self.button_getvericate_code?.backgroundColor = UIColor.red
                self.button_getvericate_code?.setTitleColor(UIColor.white, for: UIControlState.normal)
            }
            
            self.button_getvericate_code?.isEnabled = !newValue
        }
    }
    
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
        
        self.view.backgroundColor = UIColor.white
    }
    
    func initializationBaseView() -> Void {
        
        //top view
        self.view_top = UIView()
        self.view_top?.backgroundColor = patient_theme_color
        self.view.addSubview(self.view_top!)
        
        //mid view
        self.view_mid = UIView()
        self.view_mid?.backgroundColor = UIColor.white
        self.view_mid?.layer.borderWidth = 0.5
        self.view_mid?.layer.borderColor = public_method.setRGBColor(red: 191, green: 191, blue: 191, alpha: 1.0).cgColor
        self.view.addSubview(self.view_mid!)
        
        //title label
        let title_label = UILabel()
        title_label.text = "门诊管理"
        title_label.font = public_method.setFontSize(original_size: 20)
        self.view_top?.addSubview(title_label)
        
        //textField phone
        self.textField_phone = PatientCustomTextField()
        self.textField_phone?.keyboardType = UIKeyboardType.numberPad
        public_method.setTextFieldPlaceholderColor(self.textField_phone!, "icon_+86", "请输入手机号码", register_theme_color, 14)
        self.textField_phone?.textColor = register_theme_color
        self.view_mid?.addSubview(self.textField_phone!)
        
        self.label_line1 = UILabel()
        self.label_line1?.backgroundColor = register_theme_color
        self.view_mid?.addSubview(self.label_line1!)
        
        //textField verification
        self.textField_verification = UITextField()
        
        //right view code
        let button_getVerification_code = UIButton(type: UIButtonType.custom)
        button_getVerification_code.frame  = CGRect(x: 0, y: 0, width: public_method.setFitSize(original: 80), height: public_method.setFitSize(original: 30))
        button_getVerification_code.setTitle("获取验证码", for: UIControlState.normal)
        button_getVerification_code.titleLabel?.font            = public_method.setFontSize(original_size: 12)
        button_getVerification_code.layer.borderWidth           = 0.5
        button_getVerification_code.layer.cornerRadius          = public_method.setFitSize(original: 15)
        button_getVerification_code.layer.borderColor           = register_theme_color.cgColor
        button_getVerification_code.setTitleColor(UIColor.blue, for: UIControlState.normal)
        button_getVerification_code.addTarget(self, action: #selector(PatientRegisterViewController.responseToGetVerificationCode(_:)), for: UIControlEvents.touchUpInside)
        button_getVerification_code.titleLabel?.adjustsFontSizeToFitWidth = true
//        setRGBColor(red: 0, green: 102, blue: 255, alpha: 1.0)
        button_getVerification_code.setTitleColor( public_method.setRGBColor(red: 0, green: 102, blue: 255, alpha: 1.0), for: UIControlState.highlighted)
        self.button_getvericate_code = button_getVerification_code
        self.textField_verification?.rightView = self.button_getvericate_code!
        self.textField_verification?.rightViewMode = UITextFieldViewMode.always
        public_method.setTextFieldPlaceholderColor(self.textField_verification!, "", "请输入验证码", register_theme_color, 14)
        self.textField_verification?.textColor = register_theme_color
        self.view_mid?.addSubview(self.textField_verification!)
        
        self.label_line2 = UILabel()
        self.label_line2?.backgroundColor = register_theme_color
        self.view_mid?.addSubview(self.label_line2!)
        
        //textField password
        self.textField_password = UITextField()
        self.textField_password?.keyboardType = UIKeyboardType.asciiCapable
        public_method.setTextFieldPlaceholderColor(self.textField_password!, "", "请设置新密码", register_theme_color, 14)
        self.textField_password?.textColor = register_theme_color
        self.view_mid?.addSubview(self.textField_password!)
        
        self.label_line3 = UILabel()
        self.label_line3?.backgroundColor = register_theme_color
        self.view_mid?.addSubview(self.label_line3!)
        
        //register button
        self.button_register = UIButton(type: UIButtonType.custom)
        self.button_register?.setTitle("注册", for: UIControlState.normal)
        self.button_register?.titleLabel?.font = public_method.setFontSize(original_size: 15)
        self.button_register?.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.button_register?.setBackgroundImage(UIImage(named: "icon_register"), for: UIControlState.normal)
        self.button_register?.addTarget(self, action: #selector(PatientRegisterViewController.responseToRegisterButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.button_register!)
        
        //back button
        self.button_back = UIButton(type: UIButtonType.system)
        self.button_back?.setTitle("已有账号", for: UIControlState.normal)
        self.button_back?.titleLabel?.font = public_method.setFontSize(original_size: 14)
        self.button_back?.setTitleColor(patient_theme_color, for: UIControlState.normal)
        self.button_back?.addTarget(self, action: #selector(PatientRegisterViewController.responseToBackButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.button_back!)
        
        self.view_top?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(20)
            make.left.right.equalTo(self.view)
            make.height.equalTo(public_method.setFitSize(original: 213))
        })
        
        title_label.snp.makeConstraints { (make) in
            
            make.top.equalTo(public_method.setFitSize(original: 66.5))
            make.centerX.equalTo(self.view_top!)
            make.width.equalTo(public_method.getTextStringSize(string: title_label.text!, max_width: 0, font_size: 20))
        }
        
        self.view_mid?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.view).offset(public_method.setFitSize(original: 155))
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.856)
            make.height.equalTo(public_method.setFitSize(original: 251.5))
        })
        
        self.textField_phone?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(public_method.setFitSize(original: 34.5))
            make.centerX.equalTo(self.view_mid!)
            make.width.equalTo(self.view_mid!).multipliedBy(0.83)
            make.height.equalTo(public_method.setFitSize(original: 44))
        })
        
        self.label_line1?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.textField_phone!.snp.bottom).offset(0)
            make.centerX.equalTo(self.view_mid!)
            make.width.equalTo(self.textField_phone!)
            make.height.equalTo(public_method.setFitSize(original: 0.5))
        })
        
        self.textField_verification?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.label_line1!.snp.bottom).offset(public_method.setFitSize(original: 22.5))
            make.centerX.equalTo(self.view_mid!)
            make.width.equalTo(self.view_mid!).multipliedBy(0.83)
            make.height.equalTo(self.textField_phone!)
        })
        
        self.label_line2?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.textField_verification!.snp.bottom).offset(0)
            make.centerX.equalTo(self.view_mid!)
            make.width.equalTo(self.textField_verification!)
            make.height.equalTo(public_method.setFitSize(original: 0.5))
        })
        
        self.textField_password?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.label_line2!.snp.bottom).offset(public_method.setFitSize(original: 22.5))
            make.centerX.equalTo(self.view_mid!)
            make.width.equalTo(self.view_mid!).multipliedBy(0.83)
            make.height.equalTo(self.textField_verification!)
        })
        
        self.label_line3?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.textField_password!.snp.bottom).offset(0)
            make.centerX.equalTo(self.view_mid!)
            make.width.equalTo(self.textField_password!)
            make.height.equalTo(public_method.setFitSize(original: 0.5))
        })
        
        self.button_register?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(self.view_mid!.snp.bottom).offset(public_method.setFitSize(original: 62.5))
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view_mid!)
            make.height.equalTo(public_method.setFitSize(original: 44))
        })
        
        self.button_back?.snp.makeConstraints({ (make) in
            
            make.bottom.equalTo(-public_method.setFitSize(original: 18.5))
            make.centerX.equalTo(self.view)
            make.width.equalTo(public_method.getTextStringSize(string: (self.button_back?.titleLabel?.text)!, max_width: 0, font_size: 14))
        })
    }
    
    //MARK: touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    //MARK: button events
    @objc func responseToGetVerificationCode(_ sender: UIButton) -> Void { //获取验证码倒计时
        
        //开启倒计时
        self.isCounting = true
    }
    
    @objc func responseToupdateTime(_ timer: Timer) -> Void {
        
        // 计时开始时，逐秒减少remainingSeconds的值
        self.remainingSeconds -= 1
    }
    
    @objc func responseToRegisterButton(sender: UIButton) -> Void { //注册
        
        if self.textField_phone?.text?.lengthOfBytes(using: String.Encoding.utf8) == 11 &&
            self.textField_password?.text?.lengthOfBytes(using: String.Encoding.utf8) != nil {
            
//            let parameters: NSDictionary = [
//
//                "accountName" : self.textField_phone!.text!,
//                "accountPwd"  : self.textField_password!.text!,
//                "confirmPwd"  : self.textField_password!.text!,
//                "regCode"     : "123"
//            ]
            
        }
    }
    
    @objc func responseToBackButton(sender: UIButton) -> Void { //返回
        
        self.dismiss(animated: true, completion: nil)
    }

}
