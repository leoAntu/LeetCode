//
//  LongestCommonPrefix.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/24.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class LongestCommonPrefix {
//    编写一个函数来查找字符串数组中的最长公共前缀。
//
//    如果不存在公共前缀，返回空字符串 ""。
//
//    示例 1:
//
//    输入: ["flower","flow","flight"]
//    输出: "fl"
//    示例 2:
//
//    输入: ["dog","racecar","car"]
//    输出: ""
//    解释: 输入不存在公共前缀。
//    说明:
//
//    所有输入只包含小写字母 a-z 。
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        //1.判断空情况
        if strs.count == 0 {
            return ""
        }
        
        //2.先找出长度最短的字符串
        var minLengthStr = strs.first!
        for item in strs {
            if (item.count < minLengthStr.count) {
                minLengthStr = item
            }
        }
        
        //3.遍历最短字符串，依次对比
        var  prefix: String = ""
        var isEqual = true
        for i in 0..<minLengthStr.count {
            
            let tmpStr = String(minLengthStr.prefix(i+1))
            
            for item in strs {
                let secondStr = String(item.prefix(i+1))
                if (tmpStr != secondStr) {
                    isEqual = false
                    break
                }
            }
            
            if (isEqual) {
                prefix = tmpStr
            }
        }
        
        return prefix
    }
}
