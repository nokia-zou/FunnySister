//
//  NSDictionary+object.swift
//  SWPost
//
//  Created by 朋 邹 on 16/6/4.
//  Copyright © 2016年 zou. All rights reserved.
//

import UIKit

extension NSDictionary {
    
    func stringValueForKey(key: String!) -> String {
        if (nil == key) {
            return ""
        }
        
        let value = self.objectForKey(key)
        if value is NSString {
            return (value as? String)!
        }
        else if value is NSNumber {
            let number: NSNumber = (value as? NSNumber)!
            return number.stringValue
        }
        
        return ""
    }
    
    func stringObjectForKey(key: NSString!) -> NSString {
        if (nil == key) {
            return ""
        }
        
        let value = self.objectForKey(key)
        if value is NSString {
            return (value as? NSString)!
        }
        else if value is NSNumber {
            let number: NSNumber = (value as? NSNumber)!
            return NSString(string: number.stringValue)
        }
        
        return ""
    }
    
    func dictionaryObjectForKey(key: NSString!) -> NSDictionary? {
        if nil == key { return nil }
        
        let value = self.objectForKey(key)
        if value is NSDictionary {
            return (value as? NSDictionary)!
        }
        
        return nil
    }
    
    func arrayObjectForKey(key: NSString!) -> NSArray? {
        if nil == key { return nil }
        
        let value = self.objectForKey(key)
        if value is NSArray {
            return (value as? NSArray)!
        }
        
        return nil
    }

    func integerValueForKey(key: String!) -> NSInteger {
        if (nil == key) {
            return 0
        }
        
        let value = self.objectForKey(key)
        if value is NSString {
            return (value as? NSString)?.integerValue ?? 0
        }
        else if value is NSNumber {
            return (value as? NSNumber)?.integerValue ?? 0
        }
        
        return 0
    }
    
    func cgfloatValueForKey(key: String!) -> CGFloat {
        if (nil == key) {
            return 0.0
        }
        
        let value = self.objectForKey(key)
        if value is NSString {
            return CGFloat((value as? NSString)?.floatValue ?? 0.0)
        }
        else if value is NSNumber {
            return CGFloat((value as? NSNumber)?.floatValue ?? 0.0)
        }
        
        return 0
    }
}
