//
//  PostListDataSource.swift
//  SWPost
//
//  Created by LittlePro on 16/6/16.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class PostListDataSource: BaseDataSource {

    // MARK: - property
    private var url: String?
    
    //  db
    private var db: DBTable?

    //  post
    let postArray: NSMutableArray! = NSMutableArray()
    
    // MARK: - init
    init(url: String) {
        super.init()
        
        //  data
        self.url = url;
        
        //  db
        self.db = DBTable(tabelName:"post")
        
        //  load
        self.loadLocalData()
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
            
            //  db
            self.db?.clearTableData()
            self.db?.insertDataArray(self.postArray)
        }
        else {
            for i in 0...((list?.count ?? 0) - 1) {
                let dic = (list?[i] as? NSDictionary)
                self.postArray.addObject(Post(dic: dic))
            }
        }
    }
    
    func loadLocalData() {
        let posts = self.db?.loadDataArray()
        if posts != nil {
            self.postArray.addObjectsFromArray(posts as! [AnyObject])
        }
    }
}
