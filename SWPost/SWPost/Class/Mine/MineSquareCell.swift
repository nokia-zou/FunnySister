//
//  MineSquareCell.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/15.
//  Copyright © 2016年 zou. All rights reserved.
//

private let cellReuseIdentifier = "cellReuseIdentifier"

import UIKit

class MineSquareCell: MineBaseCell , UICollectionViewDelegate ,UICollectionViewDataSource {

    var iconArray: NSArray?

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
        self.userNameLabel = UILabel(frame: CGRectZero)
        self.userNameLabel?.backgroundColor = UIColor.clearColor()
        self.userNameLabel?.font = UIFont.systemFontOfSize(16)
        self.userNameLabel?.textColor = UIColor.blackColor()
        self.contentView.addSubview(self.userNameLabel!)
    }
    
    private lazy var collectionView: UICollectionView = {
        
        //  frame
        let size = CGSizeMake(self.bounds.size.width / 4.0, kMineSquareIconCellHeight)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.itemSize = size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        let pagingView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        pagingView.registerClass(MineSquareIconCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        pagingView.dataSource = self
        pagingView.delegate = self
        pagingView.showsHorizontalScrollIndicator = false
        pagingView.pagingEnabled = false
        pagingView.backgroundColor = UIColor.clearColor()
        
        return pagingView
    }()
    
    // MARK: - override
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //  name
        self.collectionView.frame = self.bounds
        self.addSubview(self.collectionView)
    }
    
    // MARK: - override cell prococal
    override class func cellHeight(data: AnyObject?) -> CGFloat {
        return kMineSquareIconCellHeight * 2
    }
    
    override func bindData(data: AnyObject?, viewController: UIViewController?) {
        if  !(data is NSArray) { return }
        
        //  data
        self.iconArray = data as? NSArray
        
        //  reload
        self.collectionView.reloadData();
    }
    
    // MARK: - delegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.iconArray?.count ?? 0;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellReuseIdentifier, forIndexPath: indexPath)

        if cell is MineSquareIconCell {
            let iconCell = cell as? MineSquareIconCell
            iconCell?.bindData(self.iconArray![indexPath.row] as! MineSqureIcon)
        }
        
        return cell
    }

}
