import Foundation

/// 프롬프트 출력 형식을 정의하는 열거형
public enum OutputFormat: String, Codable {
    /// JSON 형식의 출력
    case json
    /// 일반 텍스트 형식의 출력
    case text
    /// 테이블 형식의 출력
    case table
} 