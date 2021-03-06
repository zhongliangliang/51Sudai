//
//  Account.swift
//  redo51Sudai
//
//  Created by ZhongLiangLiang on 17/3/17.
//  Copyright © 2017年 zhongliangliang. All rights reserved.
//

import Foundation
import UIKit
let Z_FRAME = UIScreen.main.bounds
let Z_FRAME_WIDTH = Z_FRAME.width
let Z_FRAME_HEIGHT = Z_FRAME.height
let MAIN_COLOR = UIColor.hexColor(hexString: "2f74ff")
let WORD_COLOR = UIColor.hexColor(hexString: "333333")


class ConvertUtil: NSObject {
    // MARK: 转化为string
    class func toStrig(string: Any?) -> String {
        if string != nil {
            if string is NSNumber {
                return String(describing: string)
            }
            if string is String {
                return string as! String
            }
        }
        return ""
    }
    
    // MARK: 转换为int
    class func toInt(string: Any?) -> Int {
        if string != nil {
            if string is NSNumber {
                return Int(string as! NSNumber)
            }
            if string is String {
                if (string as! String).isEmpty {
                    return 0
                }
            }
            return Int(string as! NSString as String) ?? 0
        }
        return 0
    }
    
    // MARK: 转换为float
    class func toFloat(string:Any?) -> Float{
        let tmp:Float = 0.0
        if let str = string {
            if str is NSNumber {
                return Float(str as! NSNumber)
            }
            if str is String {
                return (str as! NSString).floatValue
            }
        }
        return tmp
    }
    
    class func toDicObject(data: NSData?) -> NSDictionary? {
        if data != nil {
            let commitStr = String.init(data: data! as Data, encoding: String.Encoding.utf8)
            var responseString: String = ""
            responseString = commitStr!
            responseString = self.handdleJsonStr(handleStr: responseString)
            let handleData: NSData = responseString.data(using: String.Encoding.utf8)! as NSData
            let jj = try! JSONSerialization.jsonObject(with: handleData as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
            return jj as? NSDictionary
        }
        else {
            return nil
        }
    }

    class func handdleJsonStr(handleStr: String, deleteStrs:[String] = ["\r\n","\n","\r","\\"," "] ) -> String {
        var responseString = handleStr
        for dStr in deleteStrs {
            responseString = responseString.replacingOccurrences(of: dStr, with: "")
        }
        return responseString
        
    }
}


