//: [Previous](@previous)

import XCTest


final class UnitTests: XCTestCase {
    
    func testToArray() {
        // Given
        let list = LinkedList<Int>()
        
        // When
        
        // Then
        XCTAssertEqual(list.toArray(), [])
    }
    
    func testToArray_whenOneElement() {
        // Given
        var list = LinkedList<Int>()
        
        // When
        list.append(88)
        // Then
        XCTAssertEqual(list.toArray(), [88])
    }
    
    func testToArray_whenTwoElements() {
        // Given
        var list = LinkedList<Int>()
        
        // When
        list.append(88)
        list.append(9)
        list.append(6)
        list.append(609)
        list.append(6009)
        // Then
        XCTAssertEqual(list.toArray(), [88, 9, 6, 609, 6009])
    }
    
    func testPush() {
        // Given
        var list = LinkedList<Int>()
        
        // When
        list.push(3)
        list.push(2)
        list.push(1)
        
        // Then
        XCTAssertEqual(list.toArray(), [1,2,3])
    }
    
    func testAppend() {
        // Given
        var list = LinkedList<Int>()
        
        // Then
        XCTAssertEqual(list.toArray(), [])
        
        // When
        list.append(1)
        list.append(2)
        list.append(3)
        
        // Then
        XCTAssertEqual(list.toArray(), [1,2,3])
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 3)
    }
    
    func testInsert() {
        // Given
        var list: LinkedList<Int> = [1,2,4]
        
        // When
        guard let node1 = list.node(at: 1) else {
            XCTFail("Node at Index 1 should exist")
            return
        }
        let insertedNode = list.insert(3, after: node1)
        
        // Then
        XCTAssertEqual(insertedNode.value, 3)
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 4)
    }
    
    func testInsertAfterTail() {
        // Given
        var list: LinkedList<Int> = [1,2,3]
        
        // When
        guard let node2 = list.node(at: 2) else {
            XCTFail("Node at Index 2 should exist")
            return
        }
        let insertedNode = list.insert(4, after: node2)
        
        // Then
        XCTAssert(insertedNode === list.tail)
        XCTAssertEqual(insertedNode.value, 4)
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 4)
    }
    
    func testPop() {
        // Given
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        
        // When
        let value = list.pop()
        
        // Then
        XCTAssertEqual(value, 1)
        XCTAssertEqual(list.toArray(), [2, 3])
    }
    
    
//    func testRemoveLast() {
//        // Given
//        var list = LinkedList<Int>()
//        list.append(1)
//        list.append(2)
//        list.append(3)
//        
//        // When
//        let value = list.removeLast()
//        
//        // Then
//        XCTAssertEqual(value, 3)
//        XCTAssertEqual(list.toArray(), [1,2])
//    }
    
}

UnitTests.defaultTestSuite.run()


//: [Next](@next)
