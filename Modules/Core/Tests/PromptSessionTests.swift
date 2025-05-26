import XCTest
@testable import Core

final class PromptSessionTests: XCTestCase {
    func testPromptSessionInitialization() {
        // Given
        let id = UUID()
        let title = "Test Session"
        let outputFormat = OutputFormat.json
        let promptData = [
            PromptItem(key: "key1", value: "value1"),
            PromptItem(key: "key2", value: "value2")
        ]
        let resultPrompt = "Generated prompt"
        let sampleResponse = "Sample response"
        let createdAt = Date()
        
        // When
        let session = PromptSession(
            id: id,
            title: title,
            outputFormat: outputFormat,
            promptData: promptData,
            resultPrompt: resultPrompt,
            sampleResponse: sampleResponse,
            createdAt: createdAt
        )
        
        // Then
        XCTAssertEqual(session.id, id)
        XCTAssertEqual(session.title, title)
        XCTAssertEqual(session.outputFormat, outputFormat)
        XCTAssertEqual(session.promptData.count, promptData.count)
        XCTAssertEqual(session.resultPrompt, resultPrompt)
        XCTAssertEqual(session.sampleResponse, sampleResponse)
        XCTAssertEqual(session.createdAt, createdAt)
    }
    
    func testPromptSessionDefaultInitialization() {
        // Given
        let title = "Test Session"
        let outputFormat = OutputFormat.json
        let promptData = [PromptItem(key: "key1", value: "value1")]
        let resultPrompt = "Generated prompt"
        let sampleResponse = "Sample response"
        
        // When
        let session = PromptSession(
            title: title,
            outputFormat: outputFormat,
            promptData: promptData,
            resultPrompt: resultPrompt,
            sampleResponse: sampleResponse
        )
        
        // Then
        XCTAssertNotNil(session.id)
        XCTAssertEqual(session.title, title)
        XCTAssertEqual(session.outputFormat, outputFormat)
        XCTAssertEqual(session.promptData.count, promptData.count)
        XCTAssertEqual(session.resultPrompt, resultPrompt)
        XCTAssertEqual(session.sampleResponse, sampleResponse)
        XCTAssertNotNil(session.createdAt)
    }
    
    func testPromptSessionCodable() throws {
        // Given
        let session = PromptSession(
            title: "Test Session",
            outputFormat: .json,
            promptData: [PromptItem(key: "key1", value: "value1")],
            resultPrompt: "Generated prompt",
            sampleResponse: "Sample response"
        )
        
        // When
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let data = try encoder.encode(session)
        let decoded = try decoder.decode(PromptSession.self, from: data)
        
        // Then
        XCTAssertEqual(session.id, decoded.id)
        XCTAssertEqual(session.title, decoded.title)
        XCTAssertEqual(session.outputFormat, decoded.outputFormat)
        XCTAssertEqual(session.promptData.count, decoded.promptData.count)
        XCTAssertEqual(session.resultPrompt, decoded.resultPrompt)
        XCTAssertEqual(session.sampleResponse, decoded.sampleResponse)
        XCTAssertEqual(session.createdAt.timeIntervalSince1970, decoded.createdAt.timeIntervalSince1970, accuracy: 0.001)
    }
    
    func testPromptSessionIdentifiable() {
        // Given
        let session1 = PromptSession(
            title: "Session 1",
            outputFormat: .json,
            promptData: [],
            resultPrompt: "",
            sampleResponse: ""
        )
        let session2 = PromptSession(
            title: "Session 2",
            outputFormat: .json,
            promptData: [],
            resultPrompt: "",
            sampleResponse: ""
        )
        
        // Then
        XCTAssertNotEqual(session1.id, session2.id)
    }
} 