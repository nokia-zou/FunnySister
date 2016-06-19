//
//  MineViewController.swift
//  SWPost
//
//  Created by 朋 邹 on 16/4/30.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController ,UITableViewDelegate, UITableViewDataSource {
    
    //  property
    var tableView: UITableView?
    var dataSource: MineDataSource?

    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createTableView()
        
        self.createDataSource()
    }

    // color
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView?.reloadData()
    }

    // MARK: - UI
    //  table
    func createTableView() {
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        tableView?.backgroundColor = UIColor.clearColor()
        tableView?.delegate = self;
        tableView?.dataSource  = self;
        tableView?.tableFooterView = UIView()
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(tableView!)
    }
    
    // MARK: - data
    func createDataSource() {
        //  net
        self.dataSource = MineDataSource();
        self.dataSource?.refreshHandler({ refrsh in
            self.tableView?.reloadData()
        })
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //  data
        let data = self.dataSource?.dataOfIndexPath(indexPath)
        let cellItem :MineCellItem? = self.dataSource?.cellItem(indexPath)

        let cellClass = cellItem?.cellClass as? MineBaseCell.Type
        
        if nil != cellClass {
            return cellClass!.cellHeight(data)
        }
        
        return 0
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataSource?.numberOfSections() ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfRows(section) ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellItem : MineCellItem? = self.dataSource?.cellItem(indexPath)
        
        if nil == cellItem {
            return MineBaseCell()
        }
        
        let cell = cellItem!.createCell(tableView)
        
        //  data
        let data = self.dataSource?.dataOfIndexPath(indexPath)
        
        cell.bindData(data)
        
        return cell
    }
}
