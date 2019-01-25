import Cocoa

var numbers = [1,5,3,6,3,6,7,2,8]

func sortNumbers(_ numbers: inout [Int]) {
    var new = [Int]()
    for number in numbers {
        let preCount = new.count
        for i in 0 ..< preCount {
            if new[i] > number {
                new.insert(number, at: i)
                break
            }
        }
        if new.count == preCount {
            new.append(number)
        }
        print(new)
    }
    numbers = new
}
sortNumbers(&numbers)
numbers
