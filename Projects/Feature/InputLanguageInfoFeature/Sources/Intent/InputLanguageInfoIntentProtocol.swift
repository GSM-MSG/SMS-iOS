import Foundation

protocol InputLanguageInfoIntentProtocol {
    func updateLanguageName(name: String, at index: Int)
    func updateLanguageScore(score: String, at index: Int)
    func deleteLanguage(at index: Int)
    func languageAppendButtonDidTap()
    func prevButtonDidTap()
    func completeButtonDidTap(languages: [LanguageInputModel])
}
