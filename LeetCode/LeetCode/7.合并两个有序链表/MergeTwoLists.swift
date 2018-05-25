//
//  MergeTwoLists.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/24.
//  Copyright © 2018年 leo. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init (_ val: Int) {
        self.val = val
        self.next = nil
    }
}



class MergeTwoLists {

//    将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
//
//    示例：
//
//    输入：1->2->4, 1->3->4
//    输出：1->1->2->3->4->4
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        //哪个链表的头元素小，就做新链表
        var newNode: ListNode?
        
        //使用递归思想
        if (l1?.val)! < (l2?.val)! {
            newNode = l1
            newNode?.next = mergeTwoLists(l1?.next, l2)
        } else {
            newNode = l2
            newNode?.next = mergeTwoLists(l2?.next, l1)
        }
        
        return newNode
    }
    
    func mergeTwoListsWithOther(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
       
        // 将两个链表的元素提取出来，存入数组
        var node1Arr: [ListNode] = []
        var node2Arr: [ListNode] = []
        
        var head1 = l1
        var head2 = l2
        while (head1 != nil) {
            node1Arr.append(head1!)
            head1 = head1?.next
        }
        
        while (head2 != nil) {
            node2Arr.append(head2!)
            head2 = head2?.next
        }
        
        //哪个链表的头元素小，就做新链表
        var newNode: ListNode?
        var p: ListNode?
        //获取新节点的头节点,并从数组删除
        if (l1?.val)! < (l2?.val)! {
            newNode = l1
            p = l1
            node1Arr.removeFirst()
        } else {
            newNode = l2
            p = l2
            node2Arr.removeFirst()
        }
        
        //将两个数组合并
        node1Arr = node1Arr + node2Arr

        //两个数组进行遍历，依次比较值的大小
        var minIndex = 0
        for i in 0..<node1Arr.count - 1 {
            minIndex = i
            for j in i+1..<node1Arr.count {
                let min: ListNode = node1Arr[minIndex]
                let tmp: ListNode = node1Arr[j]
                if tmp.val < min.val {
                    minIndex = j
                }
            }
            //找到最少进行添加
            p?.next = node1Arr[minIndex]
            p = p?.next
            
        }
        
        return newNode
    }
}
