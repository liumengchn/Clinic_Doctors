//
//  PublicParameter.swift
//  Clinic_Doctors
//
//  Created by liumenchen on 2018/1/16.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit
import SwiftyJSON

/** 公用方法类初始化 */
let public_method = PublicMethod()

/** 公用网络请求类初始化 */
//let public_networking_request = PublicNetWorkingRequest()

/** 文件管理初始化 */
let file_manager = FileManager.default


/** 当前 App 版本 */
let device_current_version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String

/** 屏幕Size */
let screen_size = UIScreen.main.bounds.size

/** 屏幕宽度比例 以 iphone 6 为原始屏幕比例 */
let screen_fit_width            = screen_size.width / 375

/** 状态栏颜色 */
let status_color                = public_method.setRGBColor(red: 101, green: 101, blue: 101, alpha: 1.0)

/** 病人端主题颜色 */
let patient_theme_color         = public_method.setRGBColor(red: 53, green: 213, blue: 174, alpha: 1.0)

/** 注册页面主题颜色 */
let register_theme_color        = public_method.setRGBColor(red: 160, green: 160, blue: 160, alpha: 1.0)

/** user登陆后信息保存位置 */
let patient_user_plist_path     = public_method.getDocumentsDirectory() + "/" + "Users.plist"

/** 诊所信息 数据库地址 */
let patient_realm_path          = public_method.getDocumentsDirectory() + "/" + "Clinic.realm"




