//: [Previous](@previous)

import Foundation

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
        
    //create a list in this way is impractical
    //that is why we need a LinkedList that manages the nodes
    node1.next = node2
    node2.next = node3
    
    print(node1)
}
//: [Next](@next)
