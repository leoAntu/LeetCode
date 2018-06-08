//
//  DeleteDuplicates.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/8.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class DListNode {
    public var val: Int
    public var next: DListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//Example 1:
//
//Input: 1->1->2
//Output: 1->2
//Example 2:
//
//Input: 1->1->2->3->3
//Output: 1->2->3

//删除排序列表中的重复元素
class DeleteDuplicates {
    //方式1
    func deleteDuplicatesOther(_ head: DListNode?) -> DListNode? {
        guard head != nil else {
            return nil
        }
        
        var pNext = head;
        while pNext != nil {
            if pNext?.next?.val == pNext?.val {
                pNext?.next = pNext?.next?.next
            } else {
                pNext = pNext?.next
            }
        }
        return head
    }

    //方式2
    func deleteDuplicates(_ head: DListNode?) -> DListNode? {
        
        if (head == nil) {
            return nil
        }
        //将链表中的节点存入数组
        var nodeArr: [DListNode] = []
        var p = head
        while p != nil {
            nodeArr.append(p!)
            p = p?.next
        }
        
        //将数组中的值进行排序
        
        //使用数组除去数组中node值相等的node
        let resArr = recursion(nodeArr)
        
        //重新生成nodelist
        let newList = DListNode(resArr[0].val)
        var next = newList
        
        for i in 1..<resArr.count {
            let item = resArr[i]
            next.next = DListNode(item.val)
            next = next.next!
        }
        
        return newList;
    }
    
    func recursion(_ arr: [DListNode]) ->[DListNode] {
        var temp = arr
        if (temp.count == 0) {
            return [];
        }
        
        if temp.count == 1 {
            return temp;
        }
        
        for i in 1..<temp.count {
            if temp[i].val == temp[i-1].val {
                temp.remove(at: i)
                return recursion(temp)
            }
        }
        
        return temp;
    }
}
