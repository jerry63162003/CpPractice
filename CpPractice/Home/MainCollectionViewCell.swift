//
//  MainCollectionViewCell.swift
//  CpPractice
//
//  Created by dev10001 fh on 15/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var lotteryImageView: UIImageView!
    var lotteryNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.5
        setUpConstraint()
    }
    
    func setUpConstraint () {
        lotteryNameLabel = UILabel()
        self.addSubview(lotteryNameLabel)
        lotteryNameLabel.snp.makeConstraints { (make) in
            make.centerX.bottom.width.equalTo(self)
            make.height.equalTo(self.frame.size.width * 1 / 3 - 5)
        }
        
        lotteryImageView = UIImageView()
        self.addSubview(lotteryImageView)
        lotteryImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(lotteryNameLabel.snp.top)
            make.height.width.equalTo(self.frame.size.width * 2 / 3)
        }
    }
    
    func initImageView(imageStr: String){
        lotteryImageView.image = UIImage.init(named: imageStr)
    }
    
    func initLabel(lotteryNameStr: String){
        lotteryNameLabel.text = lotteryNameStr
        lotteryNameLabel.textColor = GLOBAL_APP_COLOR
        lotteryNameLabel.font = FONT(value: 20)
        lotteryNameLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
