//
//  AnnouncementViewController.swift
//  CpPractice
//
//  Created by dev10001 fh on 16/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class AnnouncementViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fakeArr: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setFakeArr()
        titleLab.text = "開獎公告"
        titleLab.isHidden = false
        self.view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.top.equalTo(BASE_NAV_HEIGHT(screenHeight: MAIN_SCREEN_HEIGHT))
            make.left.bottom.right.equalTo(self.view)
        }
    }
    
    lazy var mainTableView: UITableView = {
        let mainTableView = UITableView.init(frame: CGRect.zero, style: .plain)
        mainTableView.register(AnnouncementTableViewCell.self, forCellReuseIdentifier: "cell")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mainTableView.backgroundColor = .white
        return mainTableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnnouncementTableViewCell
        cell.configView(dict: fakeArr[indexPath.row] as! NSDictionary)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ANNOUNCEMENT_TABLE_HEIGHT)
    }
    
    func setFakeArr() {
        let fakeDict = NSMutableDictionary()
        let numberArr = NSArray.init(objects: "0", "1", "2", "3", "4", "5")
        fakeDict.setValue("新疆時時彩", forKey: "lottery_name")
        fakeDict.setValue("第20190517-019期", forKey: "term")
        fakeDict.setValue(numberArr, forKey: "win_number")
        
        fakeArr = NSMutableArray()
        for _ in 0...9 {
            fakeArr.add(fakeDict)
        }
    }
    
}
