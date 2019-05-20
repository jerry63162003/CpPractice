//
//  ActivitiesTableViewCell.swift
//  CpPractice
//
//  Created by dev10001 fh on 20/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    var cellHeight: CGFloat!
    
    var smallPicImage: UIImageView!
    var titleLab: UILabel!
    var activeTimeLab: UILabel!
    var profileLab: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellHeight = TABLEVIEW_HEIGHT(titleText: reuseIdentifier!)
        setUpConstraint()
    }
    
    func setUpConstraint() {
        smallPicImage = UIImageView()
        titleLab = UILabel()
        activeTimeLab = UILabel()
        profileLab = UILabel()
        
        self.addSubview(smallPicImage)
        self.addSubview(titleLab)
        self.addSubview(activeTimeLab)
        self.addSubview(profileLab)
        
        smallPicImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(10)
            make.width.equalTo((MAIN_SCREEN_WIDTH - 20) * 0.95)
            make.height.equalTo(cellHeight * 0.55)
        }
        
        titleLab.font = BOLD_FONT(value: 18)
        titleLab.textAlignment = .left
        titleLab.textColor = .black
        titleLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(smallPicImage)
            make.top.equalTo(smallPicImage.snp.bottom).offset(10)
        }
        
        activeTimeLab.font = FONT(value: 12)
        activeTimeLab.textAlignment = .left
        activeTimeLab.textColor = .black
        activeTimeLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLab)
            make.top.equalTo(titleLab.snp.bottom).offset(5)
        }
        
        profileLab.font = FONT(value: 14)
        profileLab.textAlignment = .left
        profileLab.textColor = .black
        profileLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(activeTimeLab)
            make.top.equalTo(activeTimeLab.snp.bottom).offset(5)
        }
    }
    
    func configView(dict: NSDictionary) {
        let url = URL(string: dict.object(forKey: "small_pic_url") as! String)
        load(url: url!)
        titleLab.text = dict.object(forKey: "title") as? String
        activeTimeLab.text = dict.object(forKey: "active_time") as? String
        profileLab.text = dict.object(forKey: "profile") as? String
    }
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.smallPicImage.image = image
                    }
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
}
