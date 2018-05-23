//
//  Reverse.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/23.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

//反转整数
class Reverse {
    
//    给定一个 32 位有符号整数，将整数中的数字进行反转。
//
//    示例 1:
//
//    输入: 123
//    输出: 321
//    示例 2:
//
//    输入: -123
//    输出: -321
//    示例 3:
//    
//    输入: 120
//    输出: 21
//    注意:
//
//    假设我们的环境只能存储 32 位有符号整数，根据这个假设，如果反转后的整数溢出，则返回 0。【-2147483648，2147483647】
    func reverse(_ x: Int) -> Int {
        
        if x == 0 {
            return 0
        }
        //1.先将整数转成string
        let numberStr: String = "\(x)" ;
        var charts: [String] = []
        
        //2.将字符串反转， 再获取字符串的每一个字符添加到数组
        for word in numberStr.reversed() {
            charts.append(String(word))
        }
        
        var tmpStr = ""

        //判断是正数还是负数
        if x > 0 {
            
            for item in recursion(charts) {
                tmpStr = tmpStr + item
            }
            
        } else {
            tmpStr = "-"
            //最后一个元素为 “-”，去除
            charts.removeLast()
            for item in recursion(charts) {
                tmpStr = tmpStr + item
            }
        }
        
        //【-2147483648，2147483647】
        let result = Int(tmpStr)!
        
        if result > 2147483647 || result < -2147483648 {
            return 0
        }
        
        return result
        
    }
    
    //递归，直到数组第一个数不为0，
    func recursion(_ charts: [String] ) -> [String] {
        var arr = charts
        if arr.count > 0 {
            let sub: String = arr.first!
            if Int(sub) == 0 {
                arr.remove(at: 0)
                let result = recursion(arr)
                return result
            }
            return arr
        } else {
            return arr
        }

    }

}
