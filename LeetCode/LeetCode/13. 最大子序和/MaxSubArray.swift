//
//  MaxSubArray.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/30.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class MaxSubArray {

//    给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
//
//    示例:
//
//    输入: [-2,1,-3,4,-1,2,1,-5,4],
//    输出: 6
//    解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
//    进阶:
//
//    如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums.first!
        }
        
        //1.先求数组中单个最大的值
        var maxValue = nums.first!
        for i in 0..<nums.count {
            if (nums[i] > maxValue) {
                maxValue = nums[i]
            }
        }
        
        //2.找到连续子数组
        for i in 0..<nums.count - 1 {
            var subTotal = nums[i]
            
            for j in i+1..<nums.count {
                subTotal = subTotal + nums[j]
                if subTotal > maxValue {
                    maxValue = subTotal
                }
            }
        }
        
        
        return maxValue
    }
}
