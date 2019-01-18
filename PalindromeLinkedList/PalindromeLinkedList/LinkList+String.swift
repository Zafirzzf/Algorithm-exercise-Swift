//
//  LinkList+String.swift
//  PalindromeLinkedList
//
//  Created by 周正飞 on 2019/1/18.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

extension LinkList where E == String {
    /// 判断回文字符串
    var isPalindrome: Bool {
        guard let header = header, header.next != nil else { return true }
        var fast = header
        var slow = header
        var pre: LinkNode<E>?
        while fast.next.notNone, fast.next!.next.notNone {
            fast = fast.next!.next!
            let next = slow.next!
            slow.next = pre
            pre = slow
            slow = next
        }
        if let end = fast.next {
            fast = end
            let next = slow.next!
            slow.next = pre
            pre = slow
            slow = next
        } else {
            slow = slow.next!
        }
        if slow.data != pre!.data { return false }
        while slow.next != nil {
            if slow.next!.data != pre!.next!.data { return false }
            pre = pre!.next
            slow = slow.next!
        }
        return true
    }
}




extension Optional {
    var notNone: Bool {
        return self != nil
    }
}
