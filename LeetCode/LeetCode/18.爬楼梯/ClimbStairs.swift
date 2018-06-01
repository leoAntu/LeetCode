//
//  ClimbStairs.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/1.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class ClimbStairs: NSObject {
    
//    假设你正在爬楼梯。需要 n 步你才能到达楼顶。
//
//    每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
//
//    注意：给定 n 是一个正整数。
//
//    示例 1：
//
//    输入： 2
//    输出： 2
//    解释： 有两种方法可以爬到楼顶。
//    1.  1 步 + 1 步
//    2.  2 步
//    示例 2：
//
//    输入： 3
//    输出： 3
//    解释： 有三种方法可以爬到楼顶。
//    1.  1 步 + 1 步 + 1 步
//    2.  1 步 + 2 步
//    3.  2 步 + 1 步
    func climbStairs(_ n: Int) -> Int {
        
//        0    1    1
//        1    1    1
//        2    2    11，2
//        3    3    111，21，12
//        4    5    1111，121，211，112，22
//        5    8    11111，1112，1121，1211，2111，122，212，221

        //通过推导能得出公式 f(n) = f(n-1) + f(n-2) f(0) = 1, f(1) = 1
        
        if n <= 1 {
            return 1
        }
        
        var a = 1, b = 1;
        
        for  _ in 2..<n {
            if a > b {
                b = a + b
            } else {
                a = a + b
            }
        }
        
        return a + b
        
//        let res = recursion(n)
//        return res
    }
    
    //递归太耗时间，大数据会非常慢
    func recursion(_ n: Int) -> Int {
        
        if n <= 1 {
            return 1
        }
        
        let res = recursion(n - 1) + recursion(n - 2)
        
        return res
    }

}
