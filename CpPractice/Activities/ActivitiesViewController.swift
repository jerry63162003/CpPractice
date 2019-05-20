//
//  ActivitiesViewController.swift
//  CpPractice
//
//  Created by dev10001 fh on 16/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class ActivitiesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var fakeArr: NSMutableArray!
    var cellIdentifier: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MAIN_BG_COLOR
        titleLab.text = "優惠活動"
        titleLab.isHidden = false
        setFakeArr()
        self.view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.top.equalTo(BASE_NAV_HEIGHT(screenHeight: MAIN_SCREEN_HEIGHT))
            make.bottom.right.equalTo(self.view).offset(-10)
            make.left.equalTo(self.view).offset(10)
        }
    }
    
    lazy var mainTableView: UITableView = {
        cellIdentifier = "ActivitiesTableViewCell"
        let mainTableView = UITableView.init(frame: CGRect.zero, style: .plain)
        mainTableView.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mainTableView.backgroundColor = .clear
        return mainTableView
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fakeArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActivitiesTableViewCell
        cell.configView(dict: fakeArr[indexPath.section] as! NSDictionary)
        
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 8.0
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TABLEVIEW_HEIGHT(titleText: cellIdentifier)
    }
    
    func setFakeArr() {
        let fakeDict = NSMutableDictionary()
        fakeDict.setValue("微信分享", forKey: "title")
        fakeDict.setValue("2017年03月10日起 结束时间另行通知", forKey: "active_time")
        fakeDict.setValue("凤凰国际新老会员", forKey: "active_object")
        fakeDict.setValue("http://fh22001.com/image/pro_wxfx_small.jpg", forKey: "small_pic_url")
        fakeDict.setValue("任何会员成功介绍新会员成功加入凤凰国际，在活动时间内存款超过500元成为凤凰国际的老会员，并且微信分享指定内容达到活动要求后 即送彩金", forKey: "profile")
        
        fakeArr = NSMutableArray()
        for _ in 0...5 {
            fakeArr.add(fakeDict)
        }
    }
    
}
