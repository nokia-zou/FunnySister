//
//  MineLoginCell.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/7.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

class MineLoginCell: MineBaseCell {

    var hearImageView: UIImageView?
    
    var userNameLabel: UILabel?
    
    // MARK: - init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSonViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - view
    func addSonViews() {
        self.hearImageView = UIImageView(frame: CGRectZero)
        self.hearImageView?.backgroundColor = UIColor.grayColor()
        self.hearImageView?.layer.masksToBounds = true;
        self.hearImageView?.userInteractionEnabled = false
        self.contentView.addSubview(self.hearImageView!)
        
        self.userNameLabel = UILabel(frame: CGRectZero)
        self.userNameLabel?.backgroundColor = UIColor.clearColor()
        self.userNameLabel?.text = "大帅哥"
        self.userNameLabel?.font = UIFont.systemFontOfSize(16)
        self.userNameLabel?.textColor = UIColor.blackColor()
        self.contentView.addSubview(self.userNameLabel!)
    }

    // MARK: - override
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //  const
        let sideGap: CGFloat = 11.0 , topGap: CGFloat = 8.0
        let height = self.bounds.size.height - topGap * 2;

        var frame = CGRectMake(sideGap, topGap, height, height)
        
        //  header
        self.hearImageView?.frame = frame;
        self.hearImageView?.layer.cornerRadius = frame.size.height / 2.0

        //  name
        frame.origin.x += sideGap + height;
        frame.size.width = self.bounds.size.width - frame.origin.x
        self.userNameLabel?.frame = frame
    }
    
    // MARK: - override cell prococal
    override class func cellHeight(data: AnyObject?) -> CGFloat {
        return 52
    }
    
    override func bindData(data: AnyObject?, viewController: UIViewController?) {
        if  !(data is UserInfo) {
            return
        }
        
        //  data
        let info: UserInfo! = data as! UserInfo
        
        //  name
        self.userNameLabel?.text = info.name
        
        //  header
        if nil != info?.headerUrl {
            self.bindHeaderUrl(info!.headerUrl)
        }
    }
    
    func bindHeaderUrl(urlString: String!) {
        let url: NSURL? = NSURL(string: urlString)
        
        if nil == url {
            return
        }
        
        self.hearImageView?.kf_setImageWithURL(url!)
    }
}
