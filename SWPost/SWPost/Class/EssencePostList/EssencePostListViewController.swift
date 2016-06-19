//
//  EssencePostListViewController.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/16.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class EssencePostListViewController: BaseViewController {
    //  property
    var postListArray: NSMutableArray! = NSMutableArray()
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.addPostListViewController()
    }
    
    // MARK: - add list
    func addPostListViewController() {
        
        //  1
        let all = PostListViewController()
        self.addChildViewController(all)
        self.view.addSubview(all.view)
    }
}
