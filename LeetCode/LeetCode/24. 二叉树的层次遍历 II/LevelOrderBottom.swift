
//
//  LevelOrderBottom.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/15.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa
//给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
//
//例如：
//给定二叉树 [3,9,20,null,null,15,7],
//
//  3
// / \
// 9  20
//   /  \
//  15   7
//返回其自底向上的层次遍历为：
//
//[
//[15,7],
//[9,20],
//[3]
//]
class LevelOrderBottom: NSObject {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        
        guard let root = root else {
            return []
        }
        
        //创建队列，对树进行深度遍历
        var fifoArr: [TreeNode] = []
        fifoArr.append(root); //树根加入队列
        
        var dataArr:[[Int]] = []
        
        while fifoArr.count > 0 {
            
            let count = fifoArr.count
            var tempArr: [Int] = []
            //遍历队列
            for _ in 0..<count {
                let node = fifoArr.first!
                fifoArr.removeFirst() //删除第一个
                
                tempArr.append(node.val)
                
                if node.left != nil {
                    fifoArr.append(node.left!);
                }
                
                if node.right != nil {
                    fifoArr.append(node.right!);
                }
            }
            
            dataArr.append(tempArr);
    
        }
        
        
        return dataArr.reversed()
    }
}
