//
//  BaseViewController.swift
//  SWPost
//
//  Created by 朋 邹 on 16/4/30.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //  property
    var titleLabel: UILabel?
    var navBackButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  nav
        self.createNavBarItems()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = kViewControllerBackgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /**
     配置导航栏
     */
    func createNavBarItems() {
        
        //  title
        titleLabel = UILabel(frame: CGRectMake(0, 0, 200, 44))
        titleLabel?.textColor = UIColor.blackColor()
        titleLabel?.contentMode = UIViewContentMode.Center
        titleLabel?.textAlignment = NSTextAlignment.Center
        titleLabel?.font = UIFont.boldSystemFontOfSize(17)
        self.navigationItem.titleView = titleLabel
        
        if self.title != nil {
            titleLabel?.text = self.title;
        }
        
        //  back
        
    }

}
