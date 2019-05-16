//
//  BaseViewController.swift
//  CpPractice
//
//  Created by dev10001 fh on 15/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var registerBtn = UIButton()
    var loginrBtn = UIButton()
    var changeListType = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(navView)
        navView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(BASE_NAV_HEIGHT(screenHeight: MAIN_SCREEN_HEIGHT))
        }
    }
    
    lazy var navView : UIView = {
        let bgView = UIView()
        bgView.backgroundColor = GLOBAL_APP_COLOR
        
        //right Btn
        registerBtn.isHidden = true
        registerBtn.setTitle("註冊", for: .normal)
        bgView.addSubview(registerBtn)
        registerBtn.snp.makeConstraints({ (make) in
            make.right.equalTo(bgView).offset(-BASE_BTN_DISTANCE)
            make.bottom.equalTo(bgView)
        })
        changeListType.isHidden = true
        changeListType.setImage(UIImage.init(named: "other_list_type"), for: .normal)
        bgView.addSubview(changeListType)
        changeListType.snp.makeConstraints({ (make) in
            make.right.equalTo(bgView).offset(-BASE_BTN_DISTANCE)
            make.bottom.equalTo(bgView)
        })
        
        
        //left Btn
        loginrBtn.isHidden = true
        loginrBtn.setTitle("登入", for: .normal)
        bgView.addSubview(loginrBtn)
        loginrBtn.snp.makeConstraints({ (make) in
            make.left.equalTo(bgView).offset(BASE_BTN_DISTANCE)
            make.bottom.equalTo(bgView)
        })
        
        
        
        return bgView
    }()

}
