//
//  HomeViewController.swift
//  CpPractice
//
//  Created by dev10001 fh on 15/05/2019.
//  Copyright © 2019 dev10001 fh. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var dataArr = NSMutableArray()
    var dataArray = NSMutableArray()
    var headerArr = NSMutableArray()//分组标题
    
    lazy var mainHeaderView: UIView = {
       let bgView = UIView()
        
        let bannerView = UIImageView()
        bannerView.image = UIImage.init(named: "banner_01")
        bgView.addSubview(bannerView)
        bannerView.snp.makeConstraints({ (make) in
            make.top.left.bottom.right.equalTo(bgView)
        })
        return bgView
    }()
    
    lazy var mainCollectionView: UICollectionView = {
        var collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)
        collectionLayout.itemSize = CGSize(width: (MAIN_SCREEN_WIDTH - 30) / 3, height: (MAIN_SCREEN_WIDTH - 30) / 3)
        collectionLayout.minimumLineSpacing = 5
        collectionLayout.scrollDirection = .vertical
//        collectionLayout.headerReferenceSize = CGSize(width: MAIN_SCREEN_WIDTH, height: MAIN_SCREEN_HEIGHT * 0.056 )
        
        let mainCollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: collectionLayout)
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        mainCollectionView.register(MainCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        mainCollectionView.backgroundColor = MAIN_BG_COLOR
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        return mainCollectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        getSection2Data()
        initHeaderData()
        
        registerBtn.isHidden = false
        loginrBtn.isHidden = false
        
        self.view.addSubview(mainHeaderView)
        mainHeaderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(BASE_NAV_HEIGHT(screenHeight: MAIN_SCREEN_HEIGHT))
            make.left.right.equalTo(self.view)
            make.width.equalTo(MAIN_SCREEN_WIDTH)
            make.height.equalTo(MAIN_SCREEN_HEIGHT * 0.2)
        }
        
        self.view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainHeaderView.snp.bottom)
            make.left.bottom.right.equalTo(self.view)
            make.width.equalTo(MAIN_SCREEN_WIDTH)
        }
    }
    
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return headerArr.count
    }
    
    //设置HeadView的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: MAIN_SCREEN_WIDTH, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var cell = MainCollectionHeaderView()
        if kind == UICollectionView.elementKindSectionHeader {
            cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath as IndexPath) as! MainCollectionHeaderView
            cell.titleLabel?.text = headerArr[indexPath.section] as? String
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemCount = NSInteger()
        if section == 0 {
            itemCount =  dataArr.count
        } else if section == 1 {
            itemCount =  dataArray.count
        }
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! MainCollectionViewCell
//        var title = String()
        if indexPath.section == 0 {
            cell.initLabel(lotteryNameStr: dataArr[indexPath.row] as! String)
            cell.initImageView(imageStr: dataArr[indexPath.row] as! String)
        } else if indexPath.section == 1 {
            cell.initLabel(lotteryNameStr: dataArray[indexPath.row] as! String)
            cell.initImageView(imageStr: dataArray[indexPath.row] as! String)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
        cell!.layer.cornerRadius = 4
        cell?.backgroundColor = UIColor.yellow
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
        cell!.layer.cornerRadius = 4
        cell?.backgroundColor = UIColor.white
    }
    
    func getData(){
        dataArr.add("天津時時彩")
        dataArr.add("分分時時彩")
        dataArr.add("新疆時時彩")
        dataArr.add("廣東11選5")
        dataArr.add("山東11選5")
        dataArr.add("上海11選5")
        dataArr.add("江蘇快3")
        dataArr.add("廣西快3")
        dataArr.add("福彩3D")
    }
    
    func getSection2Data(){
        dataArray.add("廣東11選5")
        dataArray.add("江西11選5")
        dataArray.add("5分彩")
        dataArray.add("1分彩")
        dataArray.add("北京PK10")
        dataArray.add("百家樂")
        dataArray.add("兩面盤")
        dataArray.add("幸運農場")
        dataArray.add("竞彩足球")
        dataArray.add("排列5")
        dataArray.add("雙色球")
        dataArray.add("體彩P3")
    }
    
    func initHeaderData() {
        headerArr.add("Ｏ熱門彩種")
        headerArr.add("Ｏ更多彩種")
    }
    
}

