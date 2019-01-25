//
//  main.swift
//  InsertionSort
//
//  Created by 周正飞 on 2019/1/24.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation
extension Array {
    func sortElements(_ condition: @escaping (Element, Element) -> Bool) -> [Element] {
        var new = [Element]()
        for element in self {
            let preCount = new.count
            for i in 0 ..< new.count {
                if condition(element, new[i]) {
                    new.insert(element, at: i)
                    break
                }
            }
            if new.count == preCount {
                new.append(element)
            }
        }
        return new
    }
}
func sortNumbers(_ array: [Int]) -> [Int] {
    var new = [Int]()
    for element in array {
        let preCount = new.count
        for i in 0 ..< new.count {
            if element > new[i] {
                new.insert(element, at: i)
                break
            }
        }
        if new.count == preCount {
            new.append(element)
        }
    }
    return new
}
func insertionSort(_ array: [Int]) -> [Int] {
    var a = array             // 1
    for x in 1..<a.count {         // 2
        var y = x
        let temp = a[y]
        while y > 0 && temp < a[y - 1] { // 3
            a.swapAt(y - 1, y)
            y -= 1
        }
        a[y] = temp
    }
    return a
}
func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y - 1]) {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}
let array1 = Array(repeating: 2, count: 1000)
let array2 = Array(repeating: 10, count: 1000)
let array3 = Array(repeating: 3, count: 1000)
let array4 = Array(repeating: 9, count: 1000)
let array5 = Array(repeating: 6, count: 1000)
var numbers = array1 + array2 + array3 + array4 + array5
let last = Date().timeIntervalSince1970
let result = insertionSort(numbers)
//insertionSort(numbers, >)
let now = Date().timeIntervalSince1970
print(now - last)
