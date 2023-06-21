import Foundation

public struct LanguageCertificateEntity: Equatable {
    public let name: String
    public let score: String

    public init(name: String, score: String) {
        self.name = name
        self.score = score
    }
}
