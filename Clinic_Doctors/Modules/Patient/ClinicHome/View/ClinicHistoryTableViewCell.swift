//
//  ClinicHistoryTableViewCell.swift
//  Eclinic_Doctor
//
//  Created by liumenchen on 2018/1/13.
//  Copyright © 2018年 Mengchen Liu. All rights reserved.
//

import UIKit

class ClinicHistoryTableViewCell: UITableViewCell {

    var background_view: UIView?
    var ttt_label: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initializationBaseView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializationBaseView() -> Void {
        
        self.background_view = UIView()
//        self.background_view?.backgroundColor = UIColor(patternImage: UIImage(named: "icon_Background map")!)
        self.background_view?.backgroundColor = public_method.setRGBColor(red: 227, green: 216, blue: 210, alpha: 1.0)
        self.contentView.addSubview(self.background_view!)
        
        self.ttt_label = UILabel()
        self.ttt_label?.text = "我的就诊记录"
        self.ttt_label?.font = public_method.setFontSize(original_size: 18)
        self.contentView.addSubview(self.ttt_label!)
        
        self.background_view?.snp.makeConstraints({ (make) in
            
//            make.edges.equalTo(UIEdgeInsetsMake(setFitSize(original: 8), setFitSize(original: 10), setFitSize(original: 10), setFitSize(original: 8)))
            make.top.equalTo(self.contentView).offset(public_method.setFitSize(original: 8))
            make.left.equalTo(self.contentView).offset(public_method.setFitSize(original: 10))
            make.bottom.equalTo(self.contentView).offset(-public_method.setFitSize(original: 8))
            make.right.equalTo(self.contentView).offset(-public_method.setFitSize(original: 10))
        })
        
        self.ttt_label?.snp.makeConstraints({ (make) in
            
            make.center.equalTo(self.background_view!)
            make.width.equalTo(public_method.getTextStringSize(string: self.ttt_label!.text!, max_width: 0, font_size: public_method.setFitSize(original: 18)))
        })
    }
    
    

}
