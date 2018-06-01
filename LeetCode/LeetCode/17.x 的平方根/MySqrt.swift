//
//  MySqrt.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/1.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class MySqrt: NSObject {
//    实现 int sqrt(int x) 函数。
//
//    计算并返回 x 的平方根，其中 x 是非负整数。
//
//    由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
//
//    示例 1:
//
//    输入: 4
//    输出: 2
//    示例 2:
//
//    输入: 8
//    输出: 2
//    说明: 8 的平方根是 2.82842...,
//    由于返回类型是整数，小数部分将被舍去。
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else {
            return x
        }
        if x == 1 {
            return 1
        }
        let res = recursion(1, x)
        return res
    }
    
    func recursion(_ n: Int,_ x: Int) -> Int {
        if n * n > x {
            return n - 1
        }
        let t = recursion(n + 1, x)
        return t
    }
    
}
