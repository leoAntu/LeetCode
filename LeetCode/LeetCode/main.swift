//
//  main.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/23.
//  Copyright © 2018年 leo. All rights reserved.
//

import Foundation

////两数之和
//let a : TwoSum = TwoSum()
//print(a.twoSum([2,11,7,15], 17))
//
////反转整数
//let b : Reverse = Reverse()
//print(b.reverse(123123))
//
////回文数
//let c: Palindrome = Palindrome()
//print(c.isPalindrome(9999))

////罗马数字转整数
//let d: RomanToInt = RomanToInt()
//print(d.romanToInt("MCMXCIV"))


////最长公共前缀
//let e: LongestCommonPrefix = LongestCommonPrefix()
//print(e.longestCommonPrefix(["s","asd","asd"]))
//

////最长公共前缀
//let f: ValidBrackets = ValidBrackets()
//print(f.isValid("(([]){})"))

////合并两个有序链表
//let g: MergeTwoLists = MergeTwoLists()
//let node1 = ListNode(1)
//let node2 = ListNode(2)
//let node3 = ListNode(8)
//node1.next = node2
//node2.next = node3
//
//let list1 = ListNode(3)
//let list2 = ListNode(4)
//let list3 = ListNode(7)
//list1.next = list2
//list2.next = list3

//let result = g.mergeTwoLists(node1, list1)
////g.mergeTwoListsWithOther(node1, list1)
//print("--------------------")
//
//
////删除排序数组中的重复项
//let f: RemoveDuplicates = RemoveDuplicates()
//var arr = [1,1,1,2,2,3,3,4,5,6]
//print(f.removeDuplicates(&arr))
//print("--------------------")

////删除排序数组中的重复项
//let g: RemoveElement = RemoveElement()
//var arr = [1,1,1,2,2,3,3,4,5,6]
//print(g.removeElement(&arr, 2))
//print("--------------------")

////删除排序数组中的重复项
//let h: StrStr = StrStr()
//print(h.strStr("params", "g"))
//print("--------------------")

//// 搜索插入位置
//let j: SearchInsert = SearchInsert()
//print(j.searchInsert([1,2,4,5,6], 6))
//print("--------------------")

//// 报数序列
//let k: CountAndSay = CountAndSay()
//print(k.countAndSay(3))
//print("--------------------")

//// 报数序列
//let l: MaxSubArray = MaxSubArray()
//print(l.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
//print("--------------------")

//// 报数序列
//let z: LengthOfLastWord = LengthOfLastWord()
//print(z.lengthOfLastWord("a     "))
//print("--------------------")

//let x: PlusOne = PlusOne()
//print(x.plusOne([9,9,9,9]))
//print("--------------------")

//let c: AddBinary = AddBinary()
//print(c.addBinary("11", "1"))
//print("--------------------")

//let c: MySqrt = MySqrt()
//print(c.mySqrt(12))
//print("--------------------")

//let c: ClimbStairs = ClimbStairs()
//print(c.climbStairs(4))
//print("--------------------")

//let c: DeleteDuplicates = DeleteDuplicates()
//let node = DListNode(1);
//let node2 = DListNode(2);
//let node3 = DListNode(2);
//let node4 = DListNode(3);
//let node5 = DListNode(3);
//node.next = node2
//node2.next = node3
//node3.next = node4
//node4.next = node5
//let res = c.deleteDuplicatesOther(node)!
//print(res.val)MergeSortedArray
//print("--------------------")

//let c: MergeSortedArray = MergeSortedArray()
//var arr = [1,2,3,0,0,0]
//c.merge(&arr, 3, [2,5,6], 3)
//print(arr)
//print("--------------------")

//let v = createTreeWithValues([5,6,3,4,7])
////打印左节点，
//print("左节点:")
//
//var left = v
//while left != nil {
//    print(left?.value as Any)
//    left = left?.left
//}
//
//print("右节点:")
////打印右节点，
//var right = v?.right
//while right != nil {
//    print(right?.value as Any)
//    right = right?.right
//}
//
//print("--------------------")
//
//let res = treeNodeAtIndex(3, inTree: v)
//print(res?.value as Any)
//print("--------------------")
//
//print("先序遍历")
//
//preOrderTraverseTree(v!) { (node) in
//    print(node?.value as Any)
//}
//
//print("--------------------")
//
//print("中序遍历")
//inOrderTraverseTree(v!) { (node) in
//    print(node?.value as Any)
//}
//print("--------------------")
//print("后序遍历")
//postOrderTraverseTree(v!) { (node) in
//    print(node?.value as Any)
//}
//print("--------------------")
//
//print("层次遍历")
//levelTraverseTree(v!) { (node) in
//    print(node?.value as Any)
//}
//print("--------------------")
//
//print("二叉树的深度")
//print(depthOfTree(v))
//print("--------------------")
//
//
//print("二叉树的宽度")
//print(widthOfTree(v!))
//print("--------------------")
//
//print("二叉树的节点数")
//print(numberOfNodesInTree(v!))
//print("--------------------")
//
//print("二叉树某层中的节点数")
//print(numberOfNodesOnLevel(2, v!))
//print("--------------------")
//
//print("二叉树叶子节点数")
//print(numberOfLeafsInTree(v!))
//print("--------------------")
//
//print("二叉树最大距离（直径）")
//print(maxDistanceOfTree(v))
//print("--------------------")

//print("二叉树最大距离方法2（直径）")
//print(maxDistanceOfTreeMethod2(v))
//print("--------------------")

//print("二叉树中某个节点到根节点的路径")
//let node = v?.left?.right
//print(pathOfTreeNode(node, v!))
//print("--------------------")
//
//print("二叉树中两个节点最近的公共父节点")
//let node1 = v?.left?.right
//let node2 = v?.left
//print(parentOfNode(node1, node2, v)?.value)
//print("--------------------")
//
//print("二叉树两个节点之间的距离")
//let node3 = v?.left?.right
//let node4 = v?.right
//print(distanceFromNode(node3, node4, v))
//print("--------------------")
//
//print("翻转二叉树")
//let res1 = invertBinaryTree(v)
//print(invertBinaryTree(v)?.value)
//print("--------------------")
//
//
//print("是否完全二叉树")
//print(isCompleteBinaryTree(v))
//print("--------------------")
//
//print("是否是满二叉树")
//print(isFullBinaryTree(v))
//print("--------------------")
//
//print("是否是平衡二叉树")
//print(isAVLBinaryTree(v))
//print("--------------------")

//let node = TreeNode(1)
//let node1 = TreeNode(2)
////let node2 = TreeNode(6)
//
//node.left = node1
////node.right = node2
//
//let node3 = TreeNode(1)
////let node4 = TreeNode(5)
//let node5 = TreeNode(2)
//
//node3.left = nil
//node3.right = node5
//let b = IsSameTree()
//
//print(b.isSameTree(node, node3))
//print("--------------------")


//let node = TreeNode(3);
//let node1 = TreeNode(9)
//let node2 = TreeNode(20)
//let node3 = TreeNode(15)
//let node4 = TreeNode(7)
//node.left = node1
//node.right = node2
//node2.left = node3;
//node2.right = node4;
//
//let n = LevelOrderBottom()
//print(n.levelOrderBottom(node))
//print("--------------------")

//let n = SortedArrayToBST()
//print(n.sortedArrayToBST([-10,-3,0,5,9]))
//print("--------------------")

let n = QuickSort()
//var arr:[Int] = [10,3,17,8,5,2,1,9,5,4]
var arr:[Int] = [1,2,3,4,5,6,7,8,9]

n.quickSort(data: &arr, low: 0, high: arr.count-1)
print("FlyElephant方案2:-\(arr)")
