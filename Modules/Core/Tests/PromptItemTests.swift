import XCTest
@testable import Core

final class PromptItemTests: XCTestCase {
    func testPromptItemInitialization() {
        // Given
        let id = UUID()
        let key = "testKey"
        let value = "testValue"
        
        // When
        let item = PromptItem(id: id, key: key, value: value)
        
        // Then
        XCTAssertEqual(item.id, id)
        XCTAssertEqual(item.key, key)
        XCTAssertEqual(item.value, value)
    }
    
    func testPromptItemDefaultInitialization() {
        // When
        let item = PromptItem(key: "testKey", value: "testValue")
        
        // Then
        XCTAssertNotNil(item.id)
        XCTAssertEqual(item.key, "testKey")
        XCTAssertEqual(item.value, "testValue")
    }
    
    func testPromptItemCodable() throws {
        // Given
        let item = PromptItem(key: "testKey", value: "testValue")
        
        // When
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let data = try encoder.encode(item)
        let decoded = try decoder.decode(PromptItem.self, from: data)
        
        // Then
        XCTAssertEqual(item.id, decoded.id)
        XCTAssertEqual(item.key, decoded.key)
        XCTAssertEqual(item.value, decoded.value)
    }
    
    func testPromptItemIdentifiable() {
        // Given
        let item1 = PromptItem(key: "key1", value: "value1")
        let item2 = PromptItem(key: "key2", value: "value2")
        
        // Then
        XCTAssertNotEqual(item1.id, item2.id)
    }
} 