import Foundation

/// 프롬프트의 개별 항목을 나타내는 모델
public struct PromptItem: Codable, Identifiable {
    /// 고유 식별자
    public let id: UUID
    /// 항목의 키
    public let key: String
    /// 항목의 값
    public let value: String
    
    /// PromptItem 인스턴스를 생성합니다.
    /// - Parameters:
    ///   - id: 고유 식별자 (기본값: 새로 생성된 UUID)
    ///   - key: 항목의 키
    ///   - value: 항목의 값
    public init(id: UUID = UUID(), key: String, value: String) {
        self.id = id
        self.key = key
        self.value = value
    }
} 