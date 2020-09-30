//: [Previous](@previous)

import Foundation

example(of: "pop") {
    var list: LinkedList<Int> = [3,2,1]
    
    print("Before popping list: \(list)")
    let poppedValue = list.pop()
    print("After popping list: \(list)\n")
    print("Popped value: " + String(describing: poppedValue))
}

//: [Next](@next)
