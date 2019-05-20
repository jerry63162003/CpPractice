//
//  AnnouncementTableViewCell.swift
//  CpPractice
//
//  Created by dev10001 fh on 17/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {

    var cellHeight: CGFloat!
    var lotteryTypeImageView: UIImageView!
    var lotteryNameLab: UILabel!
    var termLab: UILabel!
    var ballView: BallView!
    var arrowImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellHeight = TABLEVIEW_HEIGHT(titleText: reuseIdentifier!)
        setUpConstraint()
    }
    
    func setUpConstraint() {
        lotteryTypeImageView = UIImageView()
        lotteryNameLab = UILabel()
        termLab = UILabel()
        arrowImageView = UIImageView()
        
        self.addSubview(lotteryTypeImageView)
        self.addSubview(lotteryNameLab)
        self.addSubview(termLab)
        self.addSubview(arrowImageView)
        
        lotteryTypeImageView.image = UIImage.init(named: "新疆時時彩")
        lotteryTypeImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(5)
            make.width.height.equalTo(cellHeight * 3 / 4)
        }
        
//        lotteryNameLab.text = "新疆時時彩"
        lotteryNameLab.font = BOLD_FONT(value: 18)
        lotteryNameLab.adjustsFontSizeToFitWidth = true
        lotteryNameLab.textColor = .black
        lotteryNameLab.snp.makeConstraints { (make) in
            make.left.equalTo(lotteryTypeImageView.snp.right).offset(5)
            make.top.equalTo(lotteryTypeImageView)
        }
        
//        termLab.text = "第20190517-019期"
        termLab.font = FONT(value: 14)
        termLab.adjustsFontSizeToFitWidth = true
        termLab.textColor = SUB_TITLE_TEX_COLOR
        termLab.snp.makeConstraints { (make) in
            make.left.equalTo(lotteryNameLab.snp.right).offset(5)
            make.centerY.equalTo(lotteryNameLab)
        }
        
        arrowImageView.image = UIImage.init(named: "ic_arrow_more")
        arrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-MAIN_SCREEN_WIDTH * 0.02)
        }
        
    }
    
    func configView(dict: NSDictionary) {
        let lotteryName = dict.object(forKey: "lottery_name") as! String
        lotteryNameLab.text = lotteryName
        let term = dict.object(forKey: "term") as! String
        termLab.text = term
        
        let arr = dict.object(forKey: "win_number") as! NSArray
        for i in 0..<arr.count {
            ballView = BallView()
            ballView.ballView(imageStr: "ic_hong", numberStr: arr[i] as! String )
            self.addSubview(ballView)
            ballView.snp.makeConstraints { (make) in
                make.left.equalTo(lotteryNameLab).offset(i * 30)
                make.centerY.equalTo(self).offset(cellHeight / 5)
                make.width.height.equalTo(30)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
}
