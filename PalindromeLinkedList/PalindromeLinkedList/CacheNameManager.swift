//
//  CacheNameManager.swift
//  PalindromeLinkedList
//
//  Created by 周正飞 on 2019/1/15.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

fileprivate let MaxCacheNumber = 3

struct CacheNameManager {
    
    static var cacheNames = LinkList<String>()
    
    @discardableResult
    static func getOrCacheElement(of num: Int) -> String {
        if let elementInCache = cacheNames.element(condition: { $0 == String(num) }) {
            // 缓存中找到对应数据
            cacheNames.remove(elementInCache)
            cacheNames.insertElement(elementInCache.data, at: 0)
            return elementInCache.data
        } else {
            // 缓存中没有对应数据
            let name = String(num)
            if cacheNames.count >= MaxCacheNumber {
                // 缓存满了
                cacheNames.removeLast()
                cacheNames.insertElement(name, at: 0)
            } else {
                cacheNames.insertElement(name, at: 0)
            }
            return name
        }
    }
}
