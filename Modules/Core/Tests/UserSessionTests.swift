import XCTest
@testable import Core

final class UserSessionTests: XCTestCase {
    func testUserSessionInitialization() {
        // Given
        let isLoggedIn = true
        let isTrialUsed = true
        let subscriptionStatus = SubscriptionStatus.active
        
        // When
        let session = UserSession(
            isLoggedIn: isLoggedIn,
            isTrialUsed: isTrialUsed,
            subscriptionStatus: subscriptionStatus
        )
        
        // Then
        XCTAssertEqual(session.id, "user_session")
        XCTAssertEqual(session.isLoggedIn, isLoggedIn)
        XCTAssertEqual(session.isTrialUsed, isTrialUsed)
        XCTAssertEqual(session.subscriptionStatus, subscriptionStatus)
    }
    
    func testUserSessionDefaultInitialization() {
        // When
        let session = UserSession()
        
        // Then
        XCTAssertEqual(session.id, "user_session")
        XCTAssertFalse(session.isLoggedIn)
        XCTAssertFalse(session.isTrialUsed)
        XCTAssertEqual(session.subscriptionStatus, .none)
    }
    
    func testUserSessionCodable() throws {
        // Given
        let session = UserSession(
            isLoggedIn: true,
            isTrialUsed: true,
            subscriptionStatus: .active
        )
        
        // When
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let data = try encoder.encode(session)
        let decoded = try decoder.decode(UserSession.self, from: data)
        
        // Then
        XCTAssertEqual(session.id, decoded.id)
        XCTAssertEqual(session.isLoggedIn, decoded.isLoggedIn)
        XCTAssertEqual(session.isTrialUsed, decoded.isTrialUsed)
        XCTAssertEqual(session.subscriptionStatus, decoded.subscriptionStatus)
    }
    
    func testUserSessionIdentifiable() {
        // Given
        let session1 = UserSession()
        let session2 = UserSession()
        
        // Then
        XCTAssertEqual(session1.id, session2.id) // UserSession은 항상 동일한 id를 가짐
    }
} 