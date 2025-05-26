import Foundation

/// 사용자 세션 정보를 나타내는 모델
public struct UserSession: Codable, Identifiable {
    /// 고유 식별자 (UserDefaults 키로 사용)
    public var id: String { "user_session" }
    /// 로그인 상태
    public let isLoggedIn: Bool
    /// 트라이얼 사용 여부
    public let isTrialUsed: Bool
    /// 구독 상태
    public let subscriptionStatus: SubscriptionStatus
    
    /// UserSession 인스턴스를 생성합니다.
    /// - Parameters:
    ///   - isLoggedIn: 로그인 상태
    ///   - isTrialUsed: 트라이얼 사용 여부
    ///   - subscriptionStatus: 구독 상태
    public init(
        isLoggedIn: Bool = false,
        isTrialUsed: Bool = false,
        subscriptionStatus: SubscriptionStatus = .none
    ) {
        self.isLoggedIn = isLoggedIn
        self.isTrialUsed = isTrialUsed
        self.subscriptionStatus = subscriptionStatus
    }
} 