//
//  RemoveDuplicates.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/24.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class RemoveDuplicates {
//    给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
//
//    不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
//
//    示例 1:
//
//    给定数组 nums = [1,1,2],
//
//    函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
//
//    你不需要考虑数组中超出新长度后面的元素。
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return 1
        }
        //使用递归，每次从头开始调用
        for i in 1..<nums.count {
            if nums[i] == nums[i-1] {
                nums.remove(at: i-1)
                return removeDuplicates(&nums)
            }
        }
        
        return nums.count
    }
}
