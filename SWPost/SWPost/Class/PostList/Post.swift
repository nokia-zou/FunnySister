//
//  Post.swift
//  SWPost
//
//  Created by LittlePro on 16/6/16.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

//  MARK: - enum post type
enum EPostType: NSInteger {
    case UnKnow = 0, Text = 29 ,Image = 10 ,Voice = 31 ,Video = 41, Link = 51
}

//  MARK: - class post
class Post: BaseModel {
    // MARK: - property
    //  main
    var textContent : String?
    var postType : EPostType! = EPostType.UnKnow
    
    //  user
    var userId : String?
    var userName : String?
    var userHeader : String?

    //  image
    var imageUrl : String?
    var imageUrlArray : NSArray?
    var imageWidth : CGFloat?
    var imageHeight : CGFloat?

    // MARK: - init
    init(dic: NSDictionary?) {
        super.init()
        
        //  parse
        self.fillProperty(dic)
    }
    
    //  MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.unarchive(aDecoder)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        self.archive(aCoder)
    }
    
}
