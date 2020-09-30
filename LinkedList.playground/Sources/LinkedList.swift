import Foundation

public class Node<Value> {

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

public struct LinkedList<Value> {
    
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
      // 1
      var currentNode = head
      var currentIndex = 0
      
      // 2
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
      }
      
      return currentNode
    }
    
    // 1
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
                                -> Node<Value> {
      // 2
      guard tail !== node else {
        append(value)
        return tail!
      }
      // 3
      node.next = Node(value: value, next: node.next)
      return node.next!
    }
    
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
    
    public mutating func removeLast() -> Value? { nil }
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
