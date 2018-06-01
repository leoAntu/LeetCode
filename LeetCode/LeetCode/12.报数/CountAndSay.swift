//
//  CountAndSay.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/5/30.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class CountAndSay {
    
//    报数序列是指一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
//    1.     1
//    2.     11
//    3.     21
//    4.     1211
//    5.     111221
//    1 被读作  "one 1"  ("一个一") , 即 11。
//    11 被读作 "two 1s" ("两个一"）, 即 21。
//    21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
//
//    给定一个正整数 n ，输出报数序列的第 n 项。
//    注意：整数顺序将表示为一个字符串。
    func countAndSay(_ n: Int) -> String {
        guard n > 0 else {
            return ""
        }
        
        var res = "1"
        var temp: String
        var count: Int
        var chars: [Character] = []
        var current: Character
        
        for _ in 1..<n {
            temp = ""
            count = 1
            chars.removeAll()
            for key in res {
                chars.append(key)
            }
            current = chars[0]
            for i in 1..<chars.count {
                if (chars[i] == current) {
                    count = count + 1
                } else {
                    temp.append(Character("\(count)"))
                    temp.append(current)
                    count = 1
                    current = chars[i]
                }
            }
            
            temp.append(Character("\(count)"))
            temp.append(current)
            res = temp
            
        }
        
        return res
    }
}
