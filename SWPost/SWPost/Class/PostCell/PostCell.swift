//
//  PostCell.swift
//  SWPost
//
//  Created by LittlePro on 16/6/19.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    //  MARK: - property


    //  MARK: - init

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
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

    func bindData(data: AnyObject?, viewController: UIViewController? = nil) {
        
    }
    
    
    //  MARK: - cell action

    func didSelectCell(viewController: UIViewController?) {
        
    }

}
