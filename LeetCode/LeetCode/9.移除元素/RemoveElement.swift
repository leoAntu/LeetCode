//
//  RemoveElement.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/24.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class RemoveElement {
    
//    给定 nums = [0,1,2,2,3,0,4,2], val = 2,
//
//    函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。
//
//    注意这五个元素可为任意顺序。
//
//    你不需要考虑数组中超出新长度后面的元素。
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        if nums.count == 0 {
            return 0
        }
        
        for i in (0..<nums.count).reversed() {
            if (nums[i] == val) {
                nums.remove(at: i)
            }
        }
        
        return nums.count
    }
}
