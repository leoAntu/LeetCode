//
//  TwoSum.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/23.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

//两数之和

class TwoSum {
    init() {
    
    }
    
    //示例:
    //
    //给定 nums = [2, 7, 11, 15], target = 9
    //
    //因为 nums[0] + nums[1] = 2 + 7 = 9
    //所以返回 [0, 1]
   public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            let firstNum = nums[i];
            for j in i+1..<nums.count {
                let sencondNum = nums[j];
                if ((firstNum + sencondNum) == target) {
                    return [i,j]
                }
           }
        }
        return []
    }

}
