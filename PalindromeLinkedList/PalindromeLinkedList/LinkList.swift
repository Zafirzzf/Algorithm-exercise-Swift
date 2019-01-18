//
//  LinkList.swift
//  PalindromeLinkedList
//
//  Created by 周正飞 on 2019/1/15.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

struct LinkList<E: Equatable>: CustomDebugStringConvertible {
    private(set) var header: LinkNode<E>?
    init(data: E) {
        self.header = LinkNode(data: data)
    }
    init() {}
    
    var debugDescription: String {
        guard var currNode = header else { return "空"}
        var allElements: [String] = ["\(currNode.data)"]
        while currNode.next != nil {
            currNode = currNode.next!
            allElements.append("\(currNode.data)")
        }
        return allElements.joined()
    }
}
/// 查找数据
extension LinkList {
    subscript(index: Int) -> LinkNode<E> {
        guard var currNode = header else { fatalError() }
        for _ in 0 ..< index {
            guard let nextNode = currNode.next else {
                fatalError("越界")
            }
            currNode = nextNode
        }
        return currNode
    }
    
    var count: Int {
        var number = 0
        var currNode = header
        while currNode != nil {
            number += 1
            currNode = currNode!.next
        }
        return number
    }
    
    func elementData(condition: @escaping (E) -> Bool) -> E? {
        return element(condition: condition)?.data
    }
    
    func element(condition: @escaping (E) -> Bool) -> LinkNode<E>? {
        var currNode = header
        while currNode != nil {
            if condition(currNode!.data) { return currNode }
            currNode = currNode!.next
        }
        return nil
    }
    
    func index(of condition: @escaping (E) -> Bool) -> Int? {
        var currNode = header
        var index = 0
        while currNode != nil {
            if condition(currNode!.data) { return index }
            currNode = currNode!.next
            index += 1
        }
        return nil
    }
    
    func index(of element: E) -> Int? {
        var currNode = header
        var index = 0
        while currNode != nil {
            if element == currNode!.data { return index }
            currNode = currNode!.next
            index += 1
        }
        return nil
    }
}
/// 添加数据
extension LinkList {
    
    // 添加数据
    mutating func appendElement(_ data: E) {
        guard var currNode = header else {
            header = LinkNode(data: data)
            return
        }
        while currNode.next != nil {
            currNode = currNode.next!
        }
        currNode.next = LinkNode(data: data)
    }
    
    mutating func insertElement(_ new: E, at index: Int) {
        guard var currNode = header else {
            if index == 0 {
                header = LinkNode(data: new)
            }
            return
        }
        var preNode = currNode
        let newNode = LinkNode(data: new)
        if index == 0 {
            header = newNode
            newNode.next = currNode
            return
        }
        for i in 0 ..< index {
            guard let nextNode = currNode.next else {
                if index == i + 1 {
                    appendElement(new)
                } else {
                    fatalError("插入的索引index溢出")
                }
                return
            }
            preNode = currNode
            currNode = nextNode
        }
        preNode.next = newNode
        newNode.next = currNode
    }
}

// MARK: - 删除数据
extension LinkList {
    @discardableResult
    mutating func removeLast() -> LinkNode<E>? {
        guard var currNode = header else { return nil }
        while currNode.next?.next != nil {
            currNode = currNode.next!
        }
        let last = currNode.next
        currNode.next = nil
        return last
    }
    // 删除指定数据
    @discardableResult
    mutating func remove(_ node: LinkNode<E>) -> LinkNode<E> {
        guard var currNode = header else { fatalError() }
        if header! === node {
            header = header!.next
            return node
        }
        while !(currNode.next === node) {
            guard let next = currNode.next else {
                fatalError("链表中没有找到删除的元素")
            }
            currNode = next
        }
        currNode.next = node.next
        node.next = nil
        return node
    }
}

