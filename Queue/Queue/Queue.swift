//
//  Queue.swift
//  Queue
//
//  Created by 周正飞 on 2019/1/24.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import Foundation

struct Queue<E> {
    
    private var elements = [E]()
    init() { }
    
    mutating func enqueue(_ e: E) {
        elements.append(e)
    }
    
    mutating func dequeue() -> E? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}
