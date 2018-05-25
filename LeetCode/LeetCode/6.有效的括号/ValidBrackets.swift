//
//  ValidBrackets.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/24.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class ValidBrackets {
//    给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
//
//    有效字符串需满足：
//
//    左括号必须用相同类型的右括号闭合。
//    左括号必须以正确的顺序闭合。
//    注意空字符串可被认为是有效字符串。
//
//    示例 1:
//
//    输入: "()"
//    输出: true
//    示例 2:
//
//    输入: "()[]{}"
//    输出: true
//    示例 3:
//
//    输入: "(]"
//    输出: false
//    示例 4:
//
//    输入: "([)]"
//    输出: false
//    示例 5:
//
//    输入: "{[]}"
//    输出: true
    func isValid(_ s: String) -> Bool {
        
        //1.排除不符合规则,字符串个数为奇数
        if s.count % 2 != 0 {
            return false
        }
        
        if s.count == 0 {
            return true
        }
        
        //思路，使用栈的思路， 判断栈顶元素是否和当前元素对的上，对的上就pop,否则就入栈，到最后判断栈是否为空，为空返回true，否则返回false
    
        //2.使用数组定义栈，遵守先进后出，只能从栈顶添加元素
        var stack: [String] = []
        //3.遍历字符串
        var index = 0 //记录下标
        for word in s {
            //首元素入栈
            if index == 0 {
                stack.append(String(word))
                //下标自增
                index = index + 1
                continue
            }
            
            //判断栈顶元素是否和当前字符相对应
            if (stack.last == "(" && word == ")" || stack.last == "[" && word == "]" || stack.last == "{" && word == "}") {
                //对应的上，从栈顶删除
                stack.removeLast()
            } else {
                //对应不上，加入到栈顶
                stack.append(String(word))
            }
            
        }
        
        if (stack.count > 0) {
            return false
        }
 
        return true
    }
}

