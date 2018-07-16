//
//  SortedArrayToBST.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/15.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa
//将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
//
//本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
//
//示例:
//
//给定有序数组: [-10,-3,0,5,9],
//
//一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：
//
//   0
//   / \
//  -3   9
//  /   /
// -10     5
class SortedArrayToBST: NSObject {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        if nums.count == 0 {
            return nil;
        }
        
        return createTree(nums, 0, nums.count - 1)
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - nums: 数组
    ///   - left: 左下标
    ///   - right: 右下标
    /// - Returns: 树
    func createTree(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        
        if left > right {
            return nil
        }
        
        let mid = (left + right + 1) / 2
        let node = TreeNode(nums[mid])
        
        node.left = createTree(nums, left, mid - 1)
        node.right = createTree(nums, mid + 1, right)
        
        return node;
    }
}
