//
//  ViewController.swift
//  2Sum
//
//  Created by 周正飞 on 2018/9/14.
//  Copyright © 2018年 MIX. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /***
         题1: 给定一个数组和一个目标值, 判断数组中是否有两个数之和等于目标值
         ***/
        let intArr = Array(repeating: 3, count: 100)
            + Array(repeating: 5, count: 100)
            + Array(repeating: 1, count: 100)
        let targetSum = 3
        let result = taskOneHandleFirst(arr: intArr, target: targetSum)
        print(result)
        
        /***
         题1: 给定一个整形数组有且只有两个数之和等于目标值, 求这两个数在数组中的序号
         ***/
        
        let intArr2 = [1, 3, 5, 6]
        let targeSum2 = 8
        print(taskTwoHandleSecond(arr: intArr2, target: targeSum2))
    }
}

// MARK: - 题1
extension ViewController {
    /// 题1 第一种解法  时间复杂度: n的平方
    func taskOneHandleFirst<T: Numeric>(arr: [T], target: T) -> Bool {
        for (i, num) in arr.enumerated() {
            for (j, other) in arr.enumerated() {
                if num + other == target, i != j {
                    return true
                }
            }
        }
        return false
    }
    
    /// 题1 第二种解法  时间复杂度: n
    func taskOneHandleSecond<T: Numeric>(arr: [T], target: T) -> Bool where T: Hashable {
        var tmpSet = Set<T>()
        for num in arr {
            if tmpSet.contains(target - num) {
                return true
            }
            tmpSet.insert(num)
        }
        return false
    }
}

// MARK: - 题2
extension ViewController {
    /// 第二种解法  时间复杂度: n的平方
    func taskTwoHandleFirst(arr: [Int], target: Int) -> [Int] {
        for (i, num) in arr.enumerated() {
            for (j, other) in arr.enumerated() {
                if num + other == target, i != j {
                    return [i, j]
                }
            }
        }
        return []
    }
    
    /// 第二种解法  时间复杂度: n
    func taskTwoHandleSecond(arr: [Int], target: Int) -> [Int] {
        var indexDict = [Int: Int]()
        for (i, num) in arr.enumerated() {
            if let index = indexDict[target - num] {
                return [index, i]
            }
            indexDict[num] = i
        }
        return []
    }
}

/// 计算函数时间
func functionSpendTime(block: () -> ()) -> Double {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let end = CFAbsoluteTimeGetCurrent()
    print(end - start)
    return end - start
}

