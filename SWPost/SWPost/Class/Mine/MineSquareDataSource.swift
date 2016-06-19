//
//  MineSquareDataSource.swift
//  SWPost
//
//  Created by 朋 邹 on 16/5/8.
//  Copyright © 2016年 zou. All rights reserved.
//

import Foundation

// MARK: - BaseDataSource
class MineSquareProtocol: BaseProtocol {
    override func httpFullPath() -> String? {
        return kHttpDApiDomain + "/op/square/\(kHttpHostPathParam)/0-100.json"
    }
}

// MARK: - BaseDataSource
class MineSquareDataSource: BaseDataSource {
    
    var squareArray: NSMutableArray?
    
    //  MARK: - 方法
    override func refreshData(result: DBRequestResult -> Void) {
        super.refreshData(result)
        
        //  send
        self.sendRequest(MineSquareProtocol())
    }
    
    // MARK: - 解析
    override func parseRequestData(data: AnyObject?)
    {
        let list = ((data as? NSDictionary)?.objectForKey("square_list")) as? NSArray
        
        self.squareArray = NSMutableArray()
        
        for index in 0...((list?.count ?? 0) - 1)
        {
            let dic = list?.objectAtIndex(index)
            let icon: MineSqureIcon? = MineSqureIcon(dic: (dic as? NSDictionary));
            if nil != icon {
                self.squareArray?.addObject(icon!)
            }
        }
    }
}
