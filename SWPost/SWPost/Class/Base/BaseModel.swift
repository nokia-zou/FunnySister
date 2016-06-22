//
//  BaseModel.swift
//  SWPost
//
//  Created by LittlePro on 16/6/20.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class BaseModel: NSObject ,NSCoding {
    
    //  MARK: - property
    var ID:String?

    //  MARK: - init
    override init() {
        super.init()
    }
    
    //  MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        self.ID = aDecoder.decodeObjectForKey("ID") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.ID, forKey: "ID")
    }
}
