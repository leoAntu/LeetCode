//
//  SearchInsert.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/30.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class SearchInsert {
//    给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
//
//    你可以假设数组中无重复元素。
//
//    示例 1:
//
//    输入: [1,3,5,6], 5
//    输出: 2
//    示例 2:
//
//    输入: [1,3,5,6], 2
//    输出: 1
//    示例 3:
//
//    输入: [1,3,5,6], 7
//    输出: 4
//    示例 4:
//
//    输入: [1,3,5,6], 0
//    输出: 0
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        //1.优先排除为空
        if nums.count == 0 {
            return 0
        }
        
        //2.判断target是否在数组中
        for i in 0..<nums.count {
            if nums[i] == target {
                return i
            }
        }
        
        //3.target不在数组中，插入的索引
        for i in 0..<nums.count {
            //判断目标和当前下标的值
            if target < nums[i] {
                return i
            }
            
            //判断到最后一个下标还为找到最小值，就返回最后的一个下标
            if i == nums.count - 1 {
                return i + 1
            }
        }
        
        
        return 0
    }
}
