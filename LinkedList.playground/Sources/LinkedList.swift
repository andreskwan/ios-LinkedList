import Foundation

public class Node<Value: Equatable> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

extension Node: Equatable {
    public static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
}

public struct LinkedList<Value: Equatable> {
    
    public init(array: [Value]) {
        array.forEach{ append($0) }
    }
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public init(_ values: Value...) {
        _ = values.map{ push($0)}
    }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        guard !isEmpty else { return nil }
        guard toArray().count > index else { return nil }
        
        return head
    }
    
    
//    @discardableResult
//    public mutating func insert(_ value: Value,
//                                after node: Node<Value>) -> Node<Value> {
//
//       return nil
//    }
//
    /// Remove first element of the list
    @discardableResult
    public mutating func pop() -> Value? {
        print("\n--------pop() called--------")
        //why defer?
        defer {
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
            print("head?.value -> after removing the head \(String(describing: head?.value))")
            print("--------pop() returns--------\n")
        }
        print("head?.value -> before removing the head \(String(describing: head?.value))")
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        //what if the ll is empty?
        guard let head = head else { return nil }
        //what if it only has one element, head == tail
        guard head.next != nil else { return pop() }
        
        var current: Node<Value>? = head
        var previous: Node<Value>? = head
        
        //when nil, now is the tail
        while let nextNode = current?.next {
            previous = current
            current = nextNode
        }
        previous?.next = nil
        tail = previous
        return current?.value
    }
    
    //    @discardableResult
    //    public mutating func removeLast() -> Value? {
    //        //what if the ll is empty?
    //        guard head != nil else { return nil }
    //        //what if it only have one element head == tail
    //        guard head !== tail else { return pop() }
    //
    //        var nextNode = head?.next
    //        print("\n-------- Before While\nnextNode?.value: \(String(describing: nextNode?.value))")
    //        print("\n-------- Before While\nnextNode?.next: \(String(describing: nextNode?.next))")
    //        print("\n-------- Before While\ntail?.value: \(String(describing: tail?.value))")
    //        print("\n-------- Before While\ntail?.next: \(String(describing: tail?.next))")
    //        while nextNode?.next !== tail {
    //            nextNode = nextNode?.next
    //            print("\n-------- While\nnextNode?.value: \(String(describing: nextNode?.value))")
    //            fatalError()
    //        }
    //        defer {
    //            print("\n-------- Before\ntail?.value: \(String(describing: tail?.value))")
    //            print("\n-------- Before\nnextNode?.value: \(String(describing: nextNode?.value))")
    //            print("\n-------- Before\nnextNode?.next: \(String(describing: nextNode?.next))")
    //            nextNode?.next = nil
    //            tail = nextNode
    //            print("\n-------- After\nnextNode?.value: \(String(describing: nextNode?.value))")
    //            print("\n-------- After\nnextNode?.next: \(String(describing: nextNode?.next))")
    //            print("\n-------- After\ntail?.value: \(String(describing: tail?.value))")
    //        }
    //        return tail?.value
    //    }
}

//MARK: CustomStringConvertible
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList {
    public func toArray() -> [Value] {
        guard let head = self.head else { return [] }
        var array = Array<Value>()
        array.append(head.value)
        var node = head.next
        
        while let n = node {
            array.append(n.value)
            guard let m = n.next else {
                print("array: \(array)")
                return array
            }
            node = m
        }
        return array
    }
}

//MARK: ExpressibleByArrayLiteral
extension LinkedList: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Value
    
    public init(arrayLiteral elements: Value...) {
        self.init(array: elements)
    }
}

//MARK: Comparable
//extension Node: Comparable {
//    public static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
//        <#code#>
//    }

//    public static func < (lhs: Node<Value>, rhs: Node<Value>) where Value is Comparable -> Bool {
//        lhs.value < rhs.value
//    }
//}


//guard tail !== node else {
//    append(value)
//    return tail!
//}
//
//node.next = Node(value: value, next: node.next)
//return node.next!


//    var currentNode = head
//    var currentIndex = 0
//
//    while currentNode != nil && currentIndex < index {
//        currentNode = currentNode!.next
//        currentIndex += 1
//    }
//
//    return currentNode
//}
