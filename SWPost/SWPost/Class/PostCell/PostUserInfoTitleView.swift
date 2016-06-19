//
//  PostUserInfoTitleView.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/19.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class PostUserInfoTitleView: PostTitleView {

    //  MARK: - property
    var userHeaderView: UIImageView?
    
    //  MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //  config self
        self.backgroundColor = UIColor.clearColor()
        
        //  init views
        self.addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //  MARK: - layout views
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    //  MARK: - init subviews
    private func addViews() {
        
    }
    
    
    //  MARK: - bind data
    
    override func bindData(data: AnyObject?, viewController: UIViewController? = nil) {
        
    }

}
