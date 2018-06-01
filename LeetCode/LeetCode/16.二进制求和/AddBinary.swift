//
//  AddBinary.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/31.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class AddBinary: NSObject {
//    给定两个二进制字符串，返回他们的和（用二进制表示）。
//
//    输入为非空字符串且只包含数字 1 和 0。
//
//    示例 1:
//
//    输入: a = "11", b = "1"
//    输出: "100"
//    示例 2:
//
//    输入: a = "1010", b = "1011"
//    输出: "10101"
    func addBinary(_ a: String, _ b: String) -> String {
        var aArr = Array(a)
        var bArr = Array(b)
        
        //sum 每一位的和, carry 进位
        var sum = 0, carry = 0, res = ""
        
        //最大下标
        var i = aArr.count - 1, j = bArr.count - 1
        
        while i >= 0 || j >= 0 || carry > 0 {
            sum = carry
            if i >= 0 {
                sum = sum + Int(String(aArr[i]))!
                i = i - 1
            }
            
            if (j >= 0) {
                sum = sum + Int(String(bArr[j]))!
                j = j - 1
            }
            
            carry = sum / 2
            sum = sum % 2
            
            res = String(sum) + res
        }
       
    
        return res
    }
}
