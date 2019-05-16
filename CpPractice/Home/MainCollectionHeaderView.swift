//
//  MainCollectionHeaderView.swift
//  CpPractice
//
//  Created by dev10001 fh on 15/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class MainCollectionHeaderView: UICollectionReusableView {
    var titleLabel:UILabel?//title
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    func initView(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: MAIN_SCREEN_WIDTH, height: 30))
        titleLabel?.textAlignment = .left
        titleLabel?.font = FONT(value: 20)
        titleLabel?.textColor = UIColor.black
        self .addSubview(titleLabel!)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
