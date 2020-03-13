//
//  MineFooterView.swift
//  CpPractice
//
//  Created by dev10001 fh on 21/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class MineFooterView: UIView {
    
    var logoutBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = MAIN_BG_COLOR
        setUpConstraint()
    }
    
    func setUpConstraint() {
        logoutBtn = UIButton()
        logoutBtn.backgroundColor = GLOBAL_APP_COLOR
        logoutBtn.setTitle("退出登入", for: .normal)
        logoutBtn.titleLabel?.font = BOLD_FONT(value: 18)
        logoutBtn.titleLabel?.textAlignment = .center
        logoutBtn.addTarget(self, action:#selector(logoutBtnAction) , for: .touchUpInside)
        self.addSubview(logoutBtn)
        logoutBtn.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.height.equalTo(MAIN_SCREEN_HEIGHT * 0.056 * 0.9)
            make.width.equalTo(MAIN_SCREEN_WIDTH * 0.9)
        }
    }
    
    @objc func logoutBtnAction() {
        print("logoutBtnAction")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
