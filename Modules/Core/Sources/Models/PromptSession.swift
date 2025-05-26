import Foundation

/// 프롬프트 생성 세션을 나타내는 모델
public struct PromptSession: Codable, Identifiable {
    /// 고유 식별자
    public let id: UUID
    /// 세션 제목
    public let title: String
    /// 출력 형식
    public let outputFormat: OutputFormat
    /// 프롬프트 데이터 항목들
    public let promptData: [PromptItem]
    /// 생성된 프롬프트
    public let resultPrompt: String
    /// 샘플 응답
    public let sampleResponse: String
    /// 생성 일시
    public let createdAt: Date
    
    /// PromptSession 인스턴스를 생성합니다.
    /// - Parameters:
    ///   - id: 고유 식별자 (기본값: 새로 생성된 UUID)
    ///   - title: 세션 제목
    ///   - outputFormat: 출력 형식
    ///   - promptData: 프롬프트 데이터 항목들
    ///   - resultPrompt: 생성된 프롬프트
    ///   - sampleResponse: 샘플 응답
    ///   - createdAt: 생성 일시 (기본값: 현재 일시)
    public init(
        id: UUID = UUID(),
        title: String,
        outputFormat: OutputFormat,
        promptData: [PromptItem],
        resultPrompt: String,
        sampleResponse: String,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.outputFormat = outputFormat
        self.promptData = promptData
        self.resultPrompt = resultPrompt
        self.sampleResponse = sampleResponse
        self.createdAt = createdAt
    }
} 