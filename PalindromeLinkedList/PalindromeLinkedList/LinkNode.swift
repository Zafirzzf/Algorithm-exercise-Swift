//
//  LinkNode.swift
//  PalindromeLinkedList
//
//  Created by 周正飞 on 2019/1/15.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

class LinkNode<E: Equatable>: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(self.data)"
    }
    var next: LinkNode?
    var data: E
    init(data: E) {
        self.data = data
    }
}
