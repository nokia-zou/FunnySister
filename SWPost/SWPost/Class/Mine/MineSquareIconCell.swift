//
//  MineSquareIconCell.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/15.
//  Copyright © 2016年 zou. All rights reserved.
//

//  cell 高度
let kMineSquareIconCellHeight: CGFloat = 100.0
let kMineSquareIconImageHeight: CGFloat = 54.0
let kMineSquareIconTitleHeight: CGFloat = 16.0
let kMineSquareIconSideGap: CGFloat = 10.0

import UIKit

class MineSquareIconCell: UICollectionViewCell {
    
    //  data
    var icon: MineSqureIcon?
    
    // MARK: - property
    var nameLabel: UILabel?
    var iconImageView: UIImageView?

    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSonViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //  layout
        var frame = CGRectMake(0, kMineSquareIconSideGap, kMineSquareIconImageHeight, kMineSquareIconImageHeight)
        frame.origin.x = (self.bounds.size.width - frame.size.width) / 2.0
        
        //  icon
        self.iconImageView?.frame = frame;
        
        //  标题
        frame.size = CGSizeMake(self.bounds.size.width, kMineSquareIconTitleHeight)
        frame.origin.x = 0
        frame.origin.y = self.bounds.size.height - frame.size.height - kMineSquareIconSideGap
        self.nameLabel?.frame = frame
    }
    
    // MARK: - view
    func addSonViews() {
        self.nameLabel = UILabel(frame: CGRectZero)
        self.nameLabel?.backgroundColor = UIColor.clearColor()
        self.nameLabel?.font = UIFont.systemFontOfSize(14)
        self.nameLabel?.textColor = UIColor.blackColor()
        self.nameLabel?.textAlignment = NSTextAlignment.Center
        self.contentView.addSubview(self.nameLabel!)
        
        self.iconImageView = UIImageView(frame: CGRectZero)
        self.iconImageView?.backgroundColor = UIColor.clearColor()
        self.iconImageView?.layer.masksToBounds = true;
        self.contentView.addSubview(self.iconImageView!)
    }
    
    // MARK: - data
    func bindData(squareIcon: MineSqureIcon) {
        
        self.icon = squareIcon
        
        //  name
        self.nameLabel?.text = squareIcon.name
        
        //  header
        if nil != squareIcon.imageUrl {
            self.bindImageUrl(squareIcon.imageUrl)
        }
    }

    func bindImageUrl(urlString: String!) {
        let url: NSURL? = NSURL(string: urlString)
        
        if nil == url { return }
        
        self.iconImageView?.kf_setImageWithURL(url!)
    }
}
