//
//  Palindrome.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/23.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class Palindrome {

    
//    判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
//
//    示例 1:
//
//    输入: 121
//    输出: true
//    示例 2:
//
//    输入: -121
//    输出: false
//    解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
//    示例 3:
//
//    输入: 10
//    输出: false
//    解释: 从右向左读, 为 01 。因此它不是一个回文数。
    
    
//    进阶:
//    你能不将整数转为字符串来解决这个问题吗？
    func isPalindrome(_ x: Int) -> Bool {
        
       //1. 个位数都是回文数
        if x >= 0 && x < 10 {
            return true
        }
        //2.优先筛选不符合规则数字，尾数为0，负数 不符合
        if x % 10 == 0 || x < 0{
            return false
        }
        
      
        
        //3. 倒序取出每一位数
        var result = recursionNum(x, [])
        let length = result.count
    
        //4.重新将数组里面的数，拼接成整数
        var num = 0
        for i in 0..<length {
            num = num + result[i] * recursionCross(result.count - i)
        }
        
        if num == x {
            return true
        }
        
        return false
    }
    
    //通过递归，取出整数的每一位，保存在数组中，返回
    func recursionNum(_ x: Int, _ arr: [Int]) -> [Int] {
        var numArr: [Int] = arr
        if x < 10 {
            numArr.append(x)
            return numArr
        } else {
            let remainder = x % 10
            let consult = x / 10
            numArr.append(remainder)
            let result: [Int] = recursionNum(consult,numArr)
            return result
        }
    }
    
    //通过递归，计算每一位的单位
    func recursionCross(_ x: Int) -> Int {
        
        if x == 1 {
            return 1
        } else {
            let result = 10 * recursionCross(x-1)
            return result
        }
    }
    
}
