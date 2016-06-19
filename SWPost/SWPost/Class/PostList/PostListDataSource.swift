//
//  PostListDataSource.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/16.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class PostListDataSource: BaseDataSource {

    // MARK: - property
    private var url: String?
    
    //  post
    let postArray: NSMutableArray! = NSMutableArray()
    
    // MARK: - init
    init(url: String) {
        super.init()
        
        //  data
        self.url = url;
    }
    
    // MARK: - send
    override func refreshData(result: DBRequestResult -> Void) {
        super.refreshData(result)
        
        self.sendRequest(PostListProtocal(url:self.url))
    }
    
    // MARK: - 解析
    override func parseRequestData(data: AnyObject?)
    {
        //  type error
        if !(data is NSDictionary) { return }
        
        // 获得 info 对象
//        let info = (data as? NSDictionary)?.dictionaryObjectForKey("info")
        
        let list: NSArray? = (data as? NSDictionary)?.arrayObjectForKey("list")

//        self.nextPage = [info stringValueForKey:@"np"];
//        
//        self.totalCount = [info integerValueForKey:@"count"];

        if true == self.reloading {
            self.postArray.removeAllObjects()
            
            for i in 0...((list?.count ?? 0) - 1) {
                let dic = (list?[i] as? NSDictionary)
                self.postArray.addObject(Post(dic: dic))
            }
        }
        else {
            for i in 0...((list?.count ?? 0) - 1) {
                let dic = (list?[i] as? NSDictionary)
                self.postArray.addObject(Post(dic: dic))
            }
        }
    }

}
