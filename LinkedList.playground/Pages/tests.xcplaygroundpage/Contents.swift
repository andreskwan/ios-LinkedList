//: [Previous](@previous)

import XCTest

final class UnitTests: XCTestCase {
    
    //MARK: Utilities
    func testToArray_returnsAnEmptyArray_givenAnEmptyList() {
        // Given
        let list = LinkedList<Int>()
        
        // When
        let array = list.toArray()
        
        // Then
        XCTAssertEqual(array, [])
    }
    
    func testToArray_returnsArrayWithOneElement_givenAListWithOneElement() {
        // Given
        var list = LinkedList<Int>()
        
        // When
        list.append(88)
        
        // Then
        XCTAssertEqual(list.toArray(), [88])
    }
    
    func testToArray_returnsArray_givenAList() {
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
    
    //MARK: Adding values to the list
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
    
    //what should happen if there is not a node after?
    //first I need to find the node
    //then insert after it.
    func testNodeAt_returnsNil_givenAnEmptyList() {
        // Given
        let list: LinkedList<Int> = []
        
        // When
        let node:Node<Int>? = list.node(at: 1000)
        
        // Then
        XCTAssertNil(node)
    }
    
    func testNodeAt_outOfBoundsIndex_returnsNil_givenAListWithOneElement() {
        // Given
        let list: LinkedList<Int> = [1]
        
        // When
        let node:Node<Int>? = list.node(at: 1000)
        
        // Then
        XCTAssertNil(node)
    }
    
    func testNodeAt_inBoundsIndex_returnsNode_givenAListWithOneElement() {
        // Given
        let list: LinkedList<Int> = [1]
        
        // When
        let node:Node<Int>? = list.node(at: 0)
        
        // Then
        XCTAssertEqual(list.head, node)
    }
    
    //    func testInsertAfter_gotListWithOneElement_givenAnEmptyList(){
    //        // Given
    //        var list: LinkedList<Int> = []
    //
    //        // When
    //        list.insert(1, after: <#T##Node<Int>#>)
    //    }
    //
    //    func testInsert() {
    //        // Given
    //        var list: LinkedList<Int> = [1,2,4]
    //
    //        // When
    //        guard let node1 = list.node(at: 1) else {
    //            XCTFail("Node at Index 1 should exist")
    //            return
    //        }
    //        let insertedNode = list.insert(3, after: node1)
    //
    //        // Then
    //        XCTAssertEqual(insertedNode.value, 3)
    //        XCTAssertEqual(list.head?.value, 1)
    //        XCTAssertEqual(list.tail?.value, 4)
    //    }
    //
    //    func testInsertAfterTail() {
    //        // Given
    //        var list: LinkedList<Int> = [1,2,3]
    //
    //        // When
    //        guard let node2 = list.node(at: 2) else {
    //            XCTFail("Node at Index 2 should exist")
    //            return
    //        }
    //        let insertedNode = list.insert(4, after: node2)
    //
    //        // Then
    //        XCTAssert(insertedNode === list.tail)
    //        XCTAssertEqual(insertedNode.value, 4)
    //        XCTAssertEqual(list.head?.value, 1)
    //        XCTAssertEqual(list.tail?.value, 4)
    //    }
    
    //MARK: Removing values from the list
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
    
    func testRemoveLast_returnsNil_ListIsEmpty_givenAnEmptyList() {
        // Given
        var list = LinkedList<Int>()
        
        // When
        let value = list.removeLast()
        
        // Then
        XCTAssertEqual(value, nil)
        XCTAssertTrue(list.isEmpty)
    }
    
    func testRemoveLast_returnsValueRemoved_ListIsEmpty_GivenAListWithOneElement() {
        // Given
        var list:LinkedList<Int> = [1]
        
        // When
        let value = list.removeLast()
        
        // Then
        XCTAssertEqual(value, 1)
        XCTAssertTrue(list.isEmpty)
    }
    
    func testRemoveLast_returnsValueRemoved_ListWithOneElement_givenAListWithTwoElements() {
        // Given
        var list:LinkedList<Int> = [1,2]
        list.description
        
        // When
        let value = list.removeLast()
        
        // Then
        XCTAssertEqual(value, 2)
        XCTAssertEqual(list.toArray(),[1])
        XCTAssertEqual(list.toArray().count, 1)
    }
    
    func testRemoveLast_returnsValueRemoved_ListWithTwoElementsAndNewTail_givenAListWithThreeElements() {
        // Given
        var list:LinkedList<Int> = [1,2,3]
        list.description
        
        // When
        let value = list.removeLast()
        
        // Then
        XCTAssertEqual(value, 3)
        XCTAssertEqual(list.toArray(),[1,2])
        //I added this assertion because I notice that I also need to check the tail value after
        //modifications.
        XCTAssertEqual(list.tail?.value, 2)
    }
    
    func testRemoveLast_returnsValueRemoved_givenAList() {
        // Given
        var list: LinkedList<Int> = [1, 2, 3, 4, 5, 6]
        list.description
        
        // When
        let value = list.removeLast()
        list.description
        
        // Then
        XCTAssertEqual(value, 6)
        XCTAssertEqual(list.toArray(), [1, 2, 3, 4, 5])
        XCTAssertEqual(list.tail?.value, 5)
    }
    
    
}

UnitTests.defaultTestSuite.run()


//: [Next](@next)
