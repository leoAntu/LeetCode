//
//  LengthOfLastWord.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/30.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class LengthOfLastWord {
    
//    给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
//
//    如果不存在最后一个单词，请返回 0 。
//
//    说明：一个单词是指由字母组成，但不包含任何空格的字符串。
//
//    示例:
//
//    输入: "Hello World"
//    输出: 5
//      "a  " => 1
    func lengthOfLastWord(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        var length = 0

        for key in s.reversed() {
            if length == 0 {
                if (key == " ") {
                    continue
                } else {
                    length = length + 1
                }
            } else {
                if (key == " ") {
                    break
                } else {
                    length = length + 1
                }
            }
        }
        
        return length
      
    }
}

