//
//  DBManager.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/21.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit
import SQLite

class DBManager: NSObject {
    
    //  MARK: - init instance
    internal static let sharedInstance: DBManager = {
        return DBManager()
    }()
    
    //  MARK: - property
    private var db: Connection?
    
    //  MARK: - init
    override init() {
        super.init()
        
        //  connect db
        self.connectDB()
    }
    
    //  MARK: - run
    func dbRun(sql: String) {
        do {
            try self.db?.run(sql)
        }
        catch {
        }
    }
    
    //  insert
    func dbInsert(insert: SQLite.Insert) {
        do {
            try self.db?.run(insert)
        }
        catch {
        }
    }
    
    //  insert
    func dbPrepare(table: Table) -> AnySequence<Row>? {
        do {
            return try self.db?.prepare(table)
        }
        catch {
        }
        
        return nil
    }
    
    //  insert
    func dbDelete(delete: SQLite.Delete) {
        do {
            try self.db?.run(delete)
        }
        catch {
        }
    }
    
    //  MARK: - DB
    private func connectDB() {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        var documentDirectory: NSString?
        if paths.count > 0 {
            documentDirectory = paths[0] as NSString
        }
        
        let fullPath = documentDirectory?.stringByAppendingPathComponent("Database.db")
        
        self.db = try? Connection(fullPath!)
    }
}
