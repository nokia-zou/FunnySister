//
//  Model+Db.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/21.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

extension BaseModel {
    
    //  MARK: - func
    class func sqlStatementCreateDBTable(tableName: String!) ->String {
        return "create table \(tableName) (ModelID text primary key, data BLOB)"
    }
}