//
//  main.swift
//  PalindromeLinkedList
//
//  Created by 周正飞 on 2019/1/10.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation
func LRUTest() {
    /// 缓存了名字的容器
    CacheNameManager.getOrCacheElement(of: 3)
    CacheNameManager.getOrCacheElement(of: 4)
    CacheNameManager.getOrCacheElement(of: 6)
    CacheNameManager.getOrCacheElement(of: 7)
    CacheNameManager.getOrCacheElement(of: 3)
    CacheNameManager.getOrCacheElement(of: 6)
}

func testPalindrome() {
    var string = LinkList(data: "w")
    string.appendElement("e")

    print(string)
}


func testFunc() {
    LRUTest()
    var linkList = LinkList(data: Character("l"))
    linkList.appendElement(Character("e"))
    linkList.appendElement(Character("v"))
    linkList.insertElement("o", at: 3)
    print(linkList)
    print(linkList.removeLast()?.data)
    print(linkList)
}
testPalindrome()
