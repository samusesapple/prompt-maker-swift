import XCTest
@testable import Core

final class SubscriptionStatusTests: XCTestCase {
    func testSubscriptionStatusRawValues() {
        // Given
        let none = SubscriptionStatus.none
        let trial = SubscriptionStatus.trial
        let active = SubscriptionStatus.active
        let expired = SubscriptionStatus.expired
        
        // Then
        XCTAssertEqual(none.rawValue, "none")
        XCTAssertEqual(trial.rawValue, "trial")
        XCTAssertEqual(active.rawValue, "active")
        XCTAssertEqual(expired.rawValue, "expired")
    }
    
    func testSubscriptionStatusCodable() throws {
        // Given
        let statuses: [SubscriptionStatus] = [.none, .trial, .active, .expired]
        
        for status in statuses {
            // When
            let encoder = JSONEncoder()
            let decoder = JSONDecoder()
            let data = try encoder.encode(status)
            let decoded = try decoder.decode(SubscriptionStatus.self, from: data)
            
            // Then
            XCTAssertEqual(status, decoded)
        }
    }
} 