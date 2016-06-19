//
//  MineSqureIcon.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/4.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class MineSqureIcon: NSObject {
    var ID : String?
    var name : String?
    var url : String?
    var imageUrl : String?
    
    // MARK: - init
    init(dic: NSDictionary?) {
        super.init()
        
        ID       = dic?.stringValueForKey("id")
        name     = dic?.stringValueForKey("name")
        imageUrl = dic?.stringValueForKey("icon")
        url      = dic?.stringValueForKey("url")
    }
}
