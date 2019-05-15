//
//  HeaderFile.swift
//  
//
//  Created by dev10001 fh on 15/05/2019.
//

import Foundation
import Alamofire
import SnapKit
import SwiftyJSON
import UIKit


let MAIN_SCREEN_WIDTH = UIScreen.main.bounds.width
let MAIN_SCREEN_HEIGHT = UIScreen.main.bounds.height
let MAIN_BG_COLOR = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
let GLOBAL_APP_COLOR = UIColor(red:1.00, green:0.39, blue:0.04, alpha:1.0)
let BASE_BTN_DISTANCE = 20

func FONT (value: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: value)
}

func BASE_NAV_HEIGHT (screenHeight: CGFloat) -> CGFloat {
    var height = CGFloat()
    // iphoneX screenHeight == 812
    if screenHeight >= 812.0 {
        height = 80.0
    } else {
        height = 64.0
    }
    
    return height
}