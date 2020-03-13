//
//  MineViewController.swift
//  CpPractice
//
//  Created by dev10001 fh on 16/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var fakeArr: NSMutableArray!
    var cellIdentifier: String!
    var headerView: MineHeaderView!
    var footerView: MineFooterView!
    var allCellCount: NSInteger!
    
    lazy var mainTableView: UITableView = {
        cellIdentifier = "MineTableViewCell"
        let mainTableView = UITableView.init(frame: CGRect.zero, style: .plain)
        mainTableView.register(MineTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mainTableView.backgroundColor = MAIN_BG_COLOR
        return mainTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFakeArr()
        navView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(BASE_NAV_HEIGHT(screenHeight: MAIN_SCREEN_HEIGHT) * 2 / 3)
        }
        addSubViews()
    }
    
    func addSubViews() {
        self.view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.top.equalTo(navView.snp.bottom)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        headerView = MineHeaderView()
        mainTableView.tableHeaderView = headerView
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(mainTableView)
            make.height.equalTo(278)
            make.width.equalTo(MAIN_SCREEN_WIDTH)
        }
        
        footerView = MineFooterView()
        mainTableView.tableFooterView = footerView
        footerView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(TABLEVIEW_HEIGHT(titleText: cellIdentifier) * CGFloat(allCellCount) + 20)
            make.centerX.equalTo(mainTableView)
            make.bottom.left.right.equalTo(mainTableView)
            make.height.equalTo(100)
            make.width.equalTo(MAIN_SCREEN_WIDTH)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }
    
    func sizeHeaderToFit() {
        headerView.setNeedsLayout()
        mainTableView.tableHeaderView = headerView
        headerView.layoutIfNeeded()
        footerView.setNeedsLayout()
        mainTableView.tableFooterView = footerView
        footerView.layoutIfNeeded()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fakeArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (fakeArr[0] as AnyObject).count
        } else if section == 1 {
            return (fakeArr[1] as AnyObject).count
        }else if section == 2 {
            return (fakeArr[2] as AnyObject).count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        if section == 0 {
            return 0
        }else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        return UIView.init(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        return UIView.init(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MineTableViewCell
        if indexPath.section == 0 {
            let aa = fakeArr[0] as! NSArray
            cell.configView(dict: aa[indexPath.row] as! String)
        } else if indexPath.section == 1 {
            let aa = fakeArr[1] as! NSArray
            cell.configView(dict: aa[indexPath.row] as! String)
        } else if indexPath.section == 2 {
            let aa = fakeArr[2] as! NSArray
            cell.configView(dict: aa[indexPath.row] as! String)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TABLEVIEW_HEIGHT(titleText: cellIdentifier)
    }
    
    func setFakeArr() {
        fakeArr = NSMutableArray()
        var oneArr = NSArray()
        oneArr = ["全部订单", "个人信息", "安全中心", "好友分享"]
        var twoArr = NSArray()
        twoArr = ["资金明细", "盈亏报表", "我的消息"]
        var threeArr = NSArray()
        threeArr = ["我的设置"]
        fakeArr.add(oneArr)
        fakeArr.add(twoArr)
        fakeArr.add(threeArr)
        allCellCount = NSInteger()
        allCellCount = oneArr.count + twoArr.count + threeArr.count
//        fakeArr.add("充值")
//        fakeArr.add("转帐")
//        fakeArr.add("提现")
        
    }
}
