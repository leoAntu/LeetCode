//
//  QuickSort.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/9/10.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa

class QuickSort: NSObject {

    func quickSort(data:inout [Int], low: Int, high: Int) -> Void {
        if low > high {
            return
        }
        
        let index = partition(data: &data, low: low, high: high)
        quickSort(data: &data, low: low, high: index - 1);
        quickSort(data: &data, low: index + 1, high: high);
    }
    
    func partition(data: inout [Int], low: Int, high: Int) -> Int {
        let root = data[high];
        var index = low;
        for i in low...high {
            if data[i] < root {
                if i != index {
                    data.swapAt(i, index);
                }
                index = index + 1;
            }
        }
        
        if high != index {
            data.swapAt(high, index)
        }
        
        return index;
    }
}
