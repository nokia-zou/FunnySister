//
//  DBTable.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/21.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit
import SQLite

class DBTable: NSObject {
    
    //  MARK: - property
    private var table: Table?
    
    //  MARK: - init
    init(tabelName: String) {
        super.init()
        
        //  create table
        self.createTable(tabelName)
    }

    //  MARK: - func
    private func createTable(tabelName: String) {
        self.table = Table(tabelName)
        let id = Expression<String>("id")
        let data = Expression<NSData?>("data")
        
        let sql = self.table?.create(block: { t in
            t.column(id, primaryKey: true)
            t.column(data)
        })
        
        if nil != sql {
            DBManager.sharedInstance.dbRun(sql!)
        }
    }
    
    func insertData(model: BaseModel) {
        if nil == self.table { return }
        
        let id = Expression<String>("id")
        let data = Expression<NSData?>("data")
        
        if nil != model.ID {
            let insert = self.table!.insert(id <- model.ID!, data <- NSKeyedArchiver.archivedDataWithRootObject(model))
            DBManager.sharedInstance.dbInsert(insert)
        }
    }
    
    func insertDataArray(array: NSArray) {
        if (nil == self.table) { return }
        
        for model in array {
            if model is BaseModel {
                self.insertData(model as! BaseModel)
            }
        }
    }
    
    func loadDataArray() ->NSArray? {
        if (nil == self.table) { return nil }
        
        let dataEx = Expression<NSData?>("data")

        
        let modelArray = NSMutableArray()
        
        for result in DBManager.sharedInstance.dbPrepare(self.table!)! {
            let data = result[dataEx]
            if data != nil {
                let model = NSKeyedUnarchiver.unarchiveObjectWithData(data!)
                if model is BaseModel {
                    modelArray.addObject(model!)
                }
            }
        }
        
        return modelArray
    }
    
    func clearTableData() {
        if (nil == self.table) { return }
        DBManager.sharedInstance.dbDelete(self.table!.delete())
    }
}
