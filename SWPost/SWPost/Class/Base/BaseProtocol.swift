//
//  BaseProtocol.swift
//  SWPost
//
//  Created by 朋 邹 on 16/5/2.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit
import AVFoundation

class BaseProtocol: NSObject {
    
    // MARK: - need overite if neet
    func httpMethod() -> Method {
        return  Method.GET
    }
    
    /**
     *  host 参数
     */
    func httpParam() -> NSMutableDictionary? {
        return nil
    }
    
    /**
     * 参数encoding类型
     */
    func httpParamEncoding() -> ParameterEncoding {
        return ParameterEncoding.URL
    }
    
    /**
     *  host 完整
     */
    func httpFullPath() -> String? {
        return kHttpDApiDomain + "/op/square/\(kHttpHostPathParam)/0-100.json"        
    }
}
