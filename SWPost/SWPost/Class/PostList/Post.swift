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
class Post: NSObject {
    // MARK: - property
    //  main
    var ID : String?
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
        
        //  common parse
        ID          = dic?.stringValueForKey("id")
        textContent = dic?.stringValueForKey("text")

        //  user info
        self.onParseUserInfo(dic?.dictionaryObjectForKey("u"))
        
        //  post type
        let typeStr:String! = dic?.stringValueForKey("type") ?? ""
        let typeDic = dic?.dictionaryObjectForKey(typeStr)
        
        switch typeStr {
        case "image":
            self.onParseImage(typeDic)
        case "gif":
            self.onParseGif(typeDic)
        case "video":
            self.onParseVideo(typeDic)
        case "voice":
            self.onParseVoice(typeDic)
        default:
            self.postType = EPostType.UnKnow
        }
    }
    
    //  MARK: - parse
    
    //  userinfo
    private func onParseUserInfo(dic: NSDictionary?) {
        userId = dic?.stringValueForKey("uid")
        userName = dic?.stringValueForKey("name")

        //  header
        let headerUrlArray: NSArray? = dic?.arrayObjectForKey("header")
        imageUrl = (headerUrlArray?.count ?? 0) > 0 ? (headerUrlArray?[0] as? String) : nil
    }
    
    //  parse -> image
    private func onParseImage(dic: NSDictionary?) {
        if nil != dic {
            postType = EPostType.Image
        }
        
        imageWidth = dic?.cgfloatValueForKey("width")
        imageHeight = dic?.cgfloatValueForKey("height")
        
        imageUrlArray = dic?.arrayObjectForKey("big")
        imageUrl = (imageUrlArray?.count ?? 0) > 0 ? (imageUrlArray?[0] as? String) : nil
    }
    
    //  parse -> gif
    private func onParseGif(dic: NSDictionary?) {
        if nil != dic {
            postType = EPostType.Image
        }
        
        imageWidth = dic?.cgfloatValueForKey("width")
        imageHeight = dic?.cgfloatValueForKey("height")
        
        imageUrlArray = dic?.arrayObjectForKey("images")
        imageUrl = (imageUrlArray?.count ?? 0) > 0 ? (imageUrlArray?[0] as? String) : nil
    }

    //  parse -> video
    func onParseVideo(dic: NSDictionary?) {
        if nil != dic {
            postType = EPostType.Video
        }
        
        imageWidth = dic?.cgfloatValueForKey("width")
        imageHeight = dic?.cgfloatValueForKey("height")

        imageUrlArray = dic?.arrayObjectForKey("thumbnail")
        imageUrl = (imageUrlArray?.count ?? 0) > 0 ? (imageUrlArray?[0] as? String) : nil
    }
    
    //  parse -> voice
    func onParseVoice(dic: NSDictionary?) {
        if nil != dic {
            postType = EPostType.Voice
        }
        
        imageWidth = dic?.cgfloatValueForKey("width")
        imageHeight = dic?.cgfloatValueForKey("height")
        
        imageUrlArray = dic?.arrayObjectForKey("thumbnail")
        imageUrl = (imageUrlArray?.count ?? 0) > 0 ? (imageUrlArray?[0] as? String) : nil
    }
    
}
