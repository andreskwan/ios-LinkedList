//: [Previous](@previous)

import Foundation

example(of: "inserting at a particular index") {
    var list: LinkedList<Int> = [1, 2, 3]
    
    print("Before inserting: \(list)")
    var middleNode = list.node(at: 1)!
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    print("After inserting: \(list)")
}

//: [Next](@next)
