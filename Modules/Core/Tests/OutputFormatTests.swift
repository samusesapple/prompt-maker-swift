import XCTest
@testable import Core

final class OutputFormatTests: XCTestCase {
    func testOutputFormatRawValues() {
        // Given
        let json = OutputFormat.json
        let text = OutputFormat.text
        let table = OutputFormat.table
        
        // Then
        XCTAssertEqual(json.rawValue, "json")
        XCTAssertEqual(text.rawValue, "text")
        XCTAssertEqual(table.rawValue, "table")
    }
    
    func testOutputFormatCodable() throws {
        // Given
        let formats: [OutputFormat] = [.json, .text, .table]
        
        for format in formats {
            // When
            let encoder = JSONEncoder()
            let decoder = JSONDecoder()
            let data = try encoder.encode(format)
            let decoded = try decoder.decode(OutputFormat.self, from: data)
            
            // Then
            XCTAssertEqual(format, decoded)
        }
    }
} 