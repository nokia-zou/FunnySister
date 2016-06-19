//
//  UserCenter.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/8.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class UserCenter: NSObject {
    
    //  single
    static let sharedInstance = UserCenter()
    
    //  property
    var userInfo: UserInfo?
    
    // MARK: - init
    override init() {
        super.init()
        self.userInfo = UserInfo.testUserInfo()
    }
}
