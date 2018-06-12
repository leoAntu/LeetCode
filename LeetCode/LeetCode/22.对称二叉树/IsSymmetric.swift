//
//  IsSymmetric.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/12.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

/*
给定一个二叉树，检查它是否是镜像对称的。

例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
    2   2
    / \ / \
    3  4 4  3
但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

1
/ \
2   2
\   \
3    3
 */
class IsSymmetric: NSObject {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        if  root.left == nil && root.right == nil {
            return true
        }
      
        return self.isHelper(root.left, root.right)
    }
    
    func isHelper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        
        if left == nil && right == nil {
            return true
        }
        
        if left?.val != right?.val || left == nil || right == nil {
            return false
        }
        
        //左子树的左子树与右子树的右子树比较
        let resLeft = self.isHelper(left?.left, right?.right)
        
        //左子树的右子树与右子树的左子树比较
        let resRight = self.isHelper(left?.right, right?.left)
        
        return resRight && resLeft
        
    }
}
