//: [Previous](@previous)

import XCTest

final class UnitTests: XCTestCase {

//    func testRemoveLast_gotNil_givenAnEmptyList(){
    func testRemoveLast_gotNilForValueRemoved_EmptyList_givenAnEmptyList() {
        // Given
        var list = LinkedList<Int>()

        // When
        let value = list.removeLast()

        // Then
        XCTAssertEqual(value, nil)
        XCTAssertTrue(list.isEmpty)
    }

    func testRemoveLast_gotValueRemoved_EmptyList_GivenAListWithOneElement() {
        // Given
        var list:LinkedList<Int> = [1]

        // When
        let value = list.removeLast()

        // Then
        XCTAssertEqual(value, 1)
        XCTAssertTrue(list.isEmpty)
    }

    func testRemoveLast_gotValueRemoved_ListLengthOne_givenAListWithTwoElements() {
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
    
    func testRemoveLast_gotValueRemoved_ListLengTwoAndNewTail_givenAListWithThreeElements() {
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
    
//    func testRemoveLast() {
//        // Given
//        var list: LinkedList<Int> = [1, 2, 3]
//        list.description
//
//        // When
//        let value = list.removeLast()
//        list.description
//
//        // Then
//        XCTAssertEqual(value, 3)
//        XCTAssertEqual(list.toArray(), [1,2])
//    }
    
}

UnitTests.defaultTestSuite.run()


//: [Next](@next)
