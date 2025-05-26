import Foundation

/// 사용자의 구독 상태를 정의하는 열거형
public enum SubscriptionStatus: String, Codable {
    /// 구독 없음
    case none
    /// 트라이얼 기간
    case trial
    /// 활성 구독
    case active
    /// 만료된 구독
    case expired
} 