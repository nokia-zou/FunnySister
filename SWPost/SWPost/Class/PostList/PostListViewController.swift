//
//  PostListViewController.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/16.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class PostListViewController: BaseViewController ,UITableViewDelegate ,UITableViewDataSource {
    //  property
    var tableView: UITableView?
    var dataSource: PostListDataSource?
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.createTableView()
        
        self.createDataSource()
        
        self.refreshData()
    }
    
    // MARK: - UI
    //  table
    func createTableView() {
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
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
        self.dataSource = PostListDataSource(url: "http://s.budejie.com/topic/list/jingxuan/10/bs0315-iphone-4.0/0-20.json");
    }
    
    func refreshData() {
        //  net
        self.dataSource?.refreshData({ refrsh in
            self.tableView?.reloadData()
        })
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //  data
        
        return 48
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.postArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if nil == cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        
        let post = self.dataSource?.postArray?[indexPath.row] as? Post
        
        
        cell?.textLabel?.text = (post?.userName)! + (post?.textContent)!
        
        return cell!
    }
}
