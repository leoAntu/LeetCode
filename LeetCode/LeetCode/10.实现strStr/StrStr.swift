//
//  StrStr.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/24.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class StrStr {
//    实现 strStr() 函数。
//
//    给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
//
//    示例 1:
//
//    输入: haystack = "hello", needle = "ll"
//    输出: 2
//
//    示例 2:
//
//    输入: haystack = "aaaaa", needle = "bba"
//    输出: -1
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        //1.判断数据为空
        if haystack.count == 0 && needle.count > 0 {
            return -1
        }
        
        if haystack.count < needle.count {
            return -1
        }
        
        if  needle.count == 0 {
            return 0
        }
        
        
        let hChars = Array(haystack.suffix(haystack.count))
        let nChars = Array(needle.suffix(needle.count))
        
    
        let hLen = hChars.count
        let nLen = nChars.count
        
        //遍历数组,下标边界只能是两个的下标，hChars[i + j]超过范围，会越界
        for i in 0...hLen-nLen {
            //判断数组中字符与needle的首字符是否相等
            if hChars[i] == nChars[0] {
                for j in 0..<nLen {
                    //如果不等，直接退出
                    if hChars[i + j] != nChars[j] {
                        break
                    }
                    //如果j已经遍历到最后一位，就完全匹配，退出当前i的值
                    if j + 1 == nLen {
                        return i
                    }
                }
            }
        }
      
        return -1
    }
}
