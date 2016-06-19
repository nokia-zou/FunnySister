//
//  MineCellItem.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/7.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class MineCellItem: NSObject {
    // MARK: - property
    var cellClass: UITableViewCell.Type! = UITableViewCell.self
    
    var reuseIdentifier : String! = "cell"
    
    // MARK: - init
    init(cellClass: UITableViewCell.Type , cellReuseIdentifier: String) {
        self.cellClass = cellClass
        self.reuseIdentifier = cellReuseIdentifier
    }
    
    // MARK: - cell
    func createCell(tableView : UITableView) -> MineBaseCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier)
        
        if cell == nil {
            cell = self.cellClass!.init(style: UITableViewCellStyle.Default, reuseIdentifier: self.reuseIdentifier)
        }
        
        if cell is MineBaseCell {
            return cell as! MineBaseCell
        }
        
        return MineBaseCell()
    }
    
    func cellHeight(data : AnyObject?) -> CGFloat {
        
        let baseClass = self.cellClass as? MineBaseCell.Type
        
        if nil != baseClass {
            return (baseClass?.cellHeight(data))!
        }
        
        return 0
    }
}
