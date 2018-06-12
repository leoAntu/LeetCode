//
//  IsSameTree.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/12.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


/*
 给定两个二叉树，编写一个函数来检验它们是否相同。
 
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例 1:
 
 输入:       1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 输出: true
 示例 2:
 
 输入:      1          1
 /           \
 2             2
 
 [1,2],     [1,null,2]
 
 输出: false
 示例 3:
 
 输入:       1         1
 / \       / \
 2   1     1   2
 
 [1,2,1],   [1,1,2]
 
 输出: false
 */

class IsSameTree {

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        guard let p = p else {
            return q == nil
        }
        
        guard let q = q else {
            return p == nil
        }
        
        if q.val != p.val {
            return false
        }
        
        let resLeft = self.isSameTree(p.left, q.left)
        let resRight = self.isSameTree(p.right, q.right)
        
        return resLeft && resRight
    }
}
