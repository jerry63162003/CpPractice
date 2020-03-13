//
//  MineTableViewCell.swift
//  CpPractice
//
//  Created by dev10001 fh on 20/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {

    var titleLab: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setUpConstraint()
    }
    
    func setUpConstraint() {
        titleLab = UILabel()
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self)
        }
    }
    
    func configView(dict: String) {
        titleLab.text = dict
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }

}
