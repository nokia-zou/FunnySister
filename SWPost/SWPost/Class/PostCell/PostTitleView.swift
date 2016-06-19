//
//  PostTitleView.swift
//  SWPost
//
//  Created by LittlePro on 16/6/19.
//  Copyright © 2016年 zou. All rights reserved.
//

//  post cell 
let kPostTitleViewHeight: CGFloat = 44.0

import UIKit

class PostTitleView: UIView {
    
    //  MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //  config self
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //  MARK: - static func
    class func titleViewHeight(data: AnyObject?) ->CGFloat {
        return kPostTitleViewHeight;
    }

    
    //  MARK: - bind data
    
    func bindData(data: AnyObject?, viewController: UIViewController? = nil) {
        
    }

}
