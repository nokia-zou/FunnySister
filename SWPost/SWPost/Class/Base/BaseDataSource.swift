//
//  BaseDataSource.swift
//  SWPost
//
//  Created by 朋 邹 on 16/5/2.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

struct DBRequestResult {
    //  是否请求成功
    internal let isSuccess: Bool?
    
    //  提示信息
    internal let message: String?
}

class BaseDataSource: NSObject {
    
    // MARK: - property
    
    //  data
    var data: NSObject?
    
    //  请求
    var request: Request?
    
    //  标志
    var loadingMore: Bool?
    var reloading: Bool?
    
    private var resultHandler: (DBRequestResult -> Void)?
    
    //  MARK: - 方法
    func refreshData(result: DBRequestResult -> Void)
    {
        self.reloading = true
        self.loadingMore = false
        self.resultHandler = result
    }
    
    //  加载更多
    func loadMoreData(result: DBRequestResult -> Void) {
        self.reloading = false
        self.loadingMore = true
        self.resultHandler = result
    }
    
    // MARK: - 发送请求

    //  send
    func sendRequest(pro:BaseProtocol) {
        
        //  取消
        self.request?.cancel();
        
        //  发送当前请求
        self.request = self.sendRequestPrococol(pro)
    }
    
    private func sendRequestPrococol(pro: BaseProtocol ) -> Request {
        let path = pro.httpFullPath()
        
        return Manager.sharedInstance.request(pro.httpMethod(), path!, parameters: nil).responseJSON { response in
            self.parseRequestResponse(response)
        }
    }

    // MARK: - 解析数据
    private func parseRequestResponse(response: Response<AnyObject, NSError>) {
        let msg = response.result.isSuccess ? "请求成功" : "请求失败"
        
        let result = DBRequestResult(isSuccess: response.result.isSuccess, message: msg)
        
        //  parese
        if response.result.value is NSObject {
            self.parseRequestData(response.result.value)
        }
        
        self.resultHandler?(result)
    }
    
    func parseRequestData(data: AnyObject?) {
        
    }
}

