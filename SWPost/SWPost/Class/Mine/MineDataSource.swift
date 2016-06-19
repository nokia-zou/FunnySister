//
//  MineDataSource.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/4.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class MineDataSource: NSObject {
    
    // MARK: - proerty
    private var squareDataSource: MineSquareDataSource?
    
    //  sections
    private let sectionsArray: NSMutableArray! = NSMutableArray()
    
    //  刷新
    private var refreshBlock: (Bool -> Void)?
    
    
    // MARK: - init
    override init() {
        super.init()
        
        self.initDataSource()
        
        self.makeCellSections()
    }
    
    
    // MARK: - func
    func refreshHandler(refresh: Bool -> Void) {
        self.refreshBlock = refresh
        self.refreshImp()
    }
    
    func refreshImp() {
        self.refreshBlock?(true)
    }
    
    func numberOfSections() -> NSInteger {
        return self.sectionsArray.count
    }
    
    func numberOfRows(section: NSInteger) -> NSInteger {
        if self.sectionsArray.count > section {
            let array = self.sectionsArray[section]
            if array is NSArray  {
                return array.count
            }
        }
        return 0
    }
    
    func dataOfIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        
        let cellItem: MineCellItem? = self.cellItem(indexPath)
        
        if nil == cellItem {
            return nil
        }
        
        if cellItem?.cellClass is MineSquareCell.Type {
            return self.squareDataSource?.squareArray
        }
        else if cellItem?.cellClass is MineLoginCell.Type {
            return UserCenter.sharedInstance.userInfo
        }
        
        return nil
    }
    
    func cellItem(indexPath: NSIndexPath) -> MineCellItem! {
        if self.sectionsArray.count > indexPath.section {
            let array = self.sectionsArray[indexPath.section]
            if ((array is NSArray) && array.count > indexPath.row) {
                let item = (array as! NSArray)[indexPath.row]
                if item is MineCellItem {
                    return item as! MineCellItem
                }
            }
        }
        
        return MineCellItem(cellClass: MineBaseCell.self, cellReuseIdentifier: "base")
    }
    
    func refreshDataIfNeed() {
        
    }
    
    // MARK: - cell
    func makeCellSections() {
        self.sectionsArray.removeAllObjects()
        
        //  1
        let section1: NSMutableArray = NSMutableArray()
        section1.addObject(MineCellItem(cellClass: MineLoginCell.self, cellReuseIdentifier: "login"))
        self.sectionsArray.addObject(section1)
        
        //  2
        if self.squareDataSource?.squareArray?.count > 0 {
            let section2: NSMutableArray = NSMutableArray()
            section2.addObject(MineCellItem(cellClass: MineSquareCell.self, cellReuseIdentifier: "square"))
            self.sectionsArray.addObject(section2)
        }

        //  end
        self.refreshBlock?(true)
    }
    
    // MARK: - data
    func initDataSource() {
        self.squareDataSource = MineSquareDataSource()
        
        self.squareDataSource?.refreshData({ result in
            if result.isSuccess == true {
                //  end
                self.makeCellSections()
            }
        })
    }

}
