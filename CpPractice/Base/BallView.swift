//
//  BallView.swift
//  CpPractice
//
//  Created by dev10001 fh on 17/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class BallView: UIView {
    
    var ballBgImageView: UIImageView!
    var ballNumberLab: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func ballView(imageStr: String, numberStr: String) {
        ballBgImageView = UIImageView()
        ballBgImageView.image = UIImage.init(named: imageStr)
        self.addSubview(ballBgImageView)
        ballBgImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(self)
        }
        
        ballNumberLab = UILabel()
        ballNumberLab.text = numberStr
        ballNumberLab.font = FONT(value: 14)
        ballNumberLab.textColor = .white
        self.addSubview(ballNumberLab)
        ballNumberLab.snp.makeConstraints { (make) in
            make.center.equalTo(ballBgImageView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
