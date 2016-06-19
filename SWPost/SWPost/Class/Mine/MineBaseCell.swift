//
//  MineBaseCell.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/4.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

//  for protocal
class MineBaseCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func cellHeight(data: AnyObject?) -> CGFloat {
        return 0
    }
    
    func bindData(data: AnyObject?, viewController: UIViewController? = nil) {
        
    }
    
    func didSelectCell(viewController: UIViewController?) {
        
    }
}
