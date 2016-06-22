//
//  Post+init.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/22.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

extension Post {
    
    //  MARK: - NSCoding
    func unarchive(decoder: NSCoder) {
        self.textContent = decoder.decodeObjectForKey("textContent") as? String
        self.userName = decoder.decodeObjectForKey("userName") as? String
        self.postType = EPostType(rawValue: decoder.decodeIntegerForKey("postType"))
    }
    
    func archive(coder: NSCoder) {
        coder.encodeObject(self.textContent, forKey: "textContent")
        coder.encodeObject(self.userName, forKey: "userName")
        coder.encodeInteger(self.postType.rawValue, forKey: "postType")
    }
    
    //  parse
    func fillProperty(dic: NSDictionary?) {
        //  common parse
        self.ID          = dic?.stringValueForKey("id")
        self.textContent = dic?.stringValueForKey("text")
        
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
