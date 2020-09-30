//: [Previous](@previous)

import Foundation

example(of: "pop") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before popping list: \(list)")
  let poppedValue = list.pop()
  print("After popping list: \(list)\n")
  print("Popped value: " + String(describing: poppedValue))
}

//: [Next](@next)
