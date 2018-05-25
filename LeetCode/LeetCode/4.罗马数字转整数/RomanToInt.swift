//
//  RomanToInt.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/24.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class RomanToInt {
    
//    罗马数字包含以下七种字符：I， V， X， L，C，D 和 M。
//
//    字符          数值
//    I             1
//    V             5
//    X             10
//    L             50
//    C             100
//    D             500
//    M             1000
//    例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
//
//    通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
//
//    I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
//    X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
//    C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
    
    
//    给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。
//
//    示例 1:
//
//    输入: "III"
//    输出: 3
//    示例 2:
//
//    输入: "IV"
//    输出: 4
//    示例 3:
//
//    输入: "IX"
//    输出: 9
//    示例 4:
//
//    输入: "LVIII"
//    输出: 58
//    解释: C = 100, L = 50, XXX = 30, III = 3.
//    示例 5:
//
//    输入: "MCMXCIV"
//    输出: 1994
//    解释: M = 1000, CM = 900, XC = 90, IV = 4.
    func romanToInt(_ s: String) -> Int {
        //1.判断空的情况
        if s.count == 0 {
            return 0
        }
        
        //2.获取每一个字符
        var wordArr: [String] = []
        for word in s {
            wordArr.append(String(word))
        }
        
        var result = 1
        //3.遍历数组
        for i in 0..<wordArr.count {
            let word = wordArr[i]
            //4.先求出首位的值
            if i == 0 {
                result = result * romanToValue(word)
                continue
            }
            
            //5.判端特殊条件
            //5.1  I 可以放在 V (5)，来表示 4。
            if word == "V" && wordArr[i-1] == "I" {
                result = result - 1 + 4
                continue
            }
            
            //5.2  I X (10) 的左边 和 9。
            if word == "X" && wordArr[i-1] == "I" {
                result = result - 1 + 9
                continue
            }
            
            //5.3  X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
            if word == "L" && wordArr[i-1] == "X" {
                result = result - 10 + 40
                continue
            }
            
            //5.4  X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
            if word == "C" && wordArr[i-1] == "X" {
                result = result - 10 + 90
                continue
            }
            
            //5.5  C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
            if word == "D" && wordArr[i-1] == "C" {
                result = result - 100 + 400
                continue
            }
            
            //5.6  C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
            if word == "M" && wordArr[i-1] == "C" {
                result = result - 100 + 900
                continue
            }
            
            //6. 累计求和
            result = result + romanToValue(word)
        }
        
        return result
    }
    
    //根据罗马字符，获取对应的值
    func romanToValue(_ word: String) -> Int {
        switch word {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default:
            return 1
        }
    }
}
