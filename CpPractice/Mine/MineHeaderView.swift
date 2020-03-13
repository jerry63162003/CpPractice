//
//  MineHeaderView.swift
//  CpPractice
//
//  Created by dev10001 fh on 20/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    var imageView: UIImageView!
    var whiteView: UIView!
    var rechargeBtn: UIButton!
    var exchangeBtn: UIButton!
    var withdrawBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = MAIN_BG_COLOR
        setUpConstraint()
    }
    
    func setUpConstraint() {
        imageView = UIImageView()
        imageView.image = UIImage(named: "ic_mine_avatar_bg")
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(MAIN_SCREEN_HEIGHT * 0.3 * 0.85)
        }
        
        whiteView = UIView()
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 10.0
        whiteView.layer.masksToBounds = true
        self.addSubview(whiteView)
        whiteView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(imageView.snp.bottom)
            make.width.equalTo(MAIN_SCREEN_WIDTH * 0.95)
            make.height.equalTo(MAIN_SCREEN_HEIGHT * 0.3 * 0.85 * 0.35)
        }
        
        rechargeBtn = UIButton()
        
        rechargeBtn.titleLabel?.font = BOLD_FONT(value: 18)
//        rechargeBtn.titleLabel?.textAlignment = .
//        rechargeBtn.addTarget(self, action:#selector(logoutBtnAction) , for: .touchUpInside)
        whiteView.addSubview(rechargeBtn)
        rechargeBtn.snp.makeConstraints { (make) in
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
