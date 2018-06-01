//
//  PlusOne.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/31.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class PlusOne {
//    给定一个非负整数组成的非空数组，在该数的基础上加一，返回一个新的数组。
//
//    最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
//
//    你可以假设除了整数 0 之外，这个整数不会以零开头。
//
//    示例 1:
//
//    输入: [1,2,3]
//    输出: [1,2,4]
//    解释: 输入数组表示数字 123。
//    示例 2:
//
//    输入: [9,9,9,9]
//    输出: [1,0,0,0,0]
//    解释: 输入数组表示数字 10000。

    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in (0..<digits.count).reversed() {
            if digits[i] < 9 {
                digits[i] = digits[i] + 1
                return digits
            }
            
            digits[i] = 0
                    }
        
        digits.insert(1, at: 0)
        return digits
    }
}
