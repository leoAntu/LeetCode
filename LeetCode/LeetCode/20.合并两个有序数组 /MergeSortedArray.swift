//
//  MergeSortedArray.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/8.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

//Example:
//
//Input:
//nums1 = [1,2,3,0,0,0], m = 3
//nums2 = [2,5,6],       n = 3
//
//Output: [1,2,2,3,5,6]

class MergeSortedArray: NSObject {
    //method 1
    func mergeOther(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        var i = m - 1, j = n - 1
        
        while i >= 0 || j >= 0 {
            //当j < 0 时需要判断，否则越界
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                nums1[i+j+1] = nums1[i]
                i = i - 1
            } else {
                nums1[i+j+1] = nums2[j]
                j = j - 1
            }
        }
    }
    
    //method 2
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        //截取子数组
        let arr1: [Int] = Array(nums1[0..<m])
        let arr2: [Int] = Array(nums2[0..<n])
        //合并数组
        var allArr: [Int] = arr1 + arr2
        
        //选择排序遍历数组
        var minIndex = 0
        for i in 0..<allArr.count {
            minIndex = i
            for j in i+1..<allArr.count {
                if allArr[j] < allArr[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                let tem: Int = allArr[minIndex]
                allArr[minIndex] = allArr[i]
                allArr[i] = tem
            }
        }
        //重新赋值数组
        nums1 = allArr
    }
}
