import Foundation

struct LanguageInputModel: Equatable {
    let languageName: String
    let languageScore: String

    init(languageName: String, languageScore: String) {
        self.languageName = languageName
        self.languageScore = languageScore
    }
}
