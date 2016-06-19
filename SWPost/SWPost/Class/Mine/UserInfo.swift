//
//  UserInfo.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/8.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    
    var ID: String?

    var name: String?
    
    var headerUrl: String?

    // MARK: - test
    static func testUserInfo() -> UserInfo! {
        let userInfo = UserInfo()
        userInfo.name = "三爷"
        userInfo.headerUrl = "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3678836095,668267933&fm=58"
        
        return userInfo
    }
}
