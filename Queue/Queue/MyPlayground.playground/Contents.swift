import Cocoa

struct Queue<E> {
    
    var elements = [E?]()
    var head = 0
    init() { }
    
    mutating func enqueue(_ e: E) {
        elements.append(e)
    }
    
    mutating func dequeue() -> E? {
        guard elements.count > head, let first = elements[head] else { return nil }
        elements[head] = nil
        head += 1
        if head > 5 {
            elements.removeFirst(head)
            head = 0
        }
        return first
    }
}

var test = Queue<Int>()
for _ in 0 ... 15 {
    test.enqueue(Int.random(in: 1 ... 10))
}
test.elements
test.dequeue()
test.dequeue()
test.dequeue()
test.dequeue()
test.dequeue()
test.dequeue()
test.elements
