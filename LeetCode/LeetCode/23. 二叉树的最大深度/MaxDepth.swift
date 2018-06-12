//
//  MaxDepth.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/12.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

//给定一个二叉树，找出其最大深度。
//
//二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
//
//说明: 叶子节点是指没有子节点的节点。
//
//示例：
//给定二叉树 [3,9,20,null,null,15,7]，
//
//3
/// \
//9  20
///  \
//15   7
//返回它的最大深度 3 。
class MaxDepth: NSObject {
    
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        
        if root.left == nil && root.right == nil {
            return 1
        }
        
        let maxLeft = self.maxDepth(root.left)
        
        let maxRight = self.maxDepth(root.right)
        
        return max(maxLeft, maxRight) + 1
    }
}
