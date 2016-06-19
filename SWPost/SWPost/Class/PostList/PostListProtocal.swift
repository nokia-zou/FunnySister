//
//  PostListProtocal.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/16.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class PostListProtocal: BaseProtocol {
    // MARK: - property
    private var url: String?

    // MARK: - init
    init(url: String?) {
        super.init()
        
        self.url = url
    }
    
    /**
     *  host 完整
     */
    override func httpFullPath() -> String? {
        return self.url
    }
}
