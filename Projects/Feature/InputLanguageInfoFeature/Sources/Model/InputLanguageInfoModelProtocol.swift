import Foundation

protocol InputLanguageInfoStateProtocol {
    var languageList: [LanguageInputModel] { get }
}

protocol InputLanguageInfoActionProtocol: AnyObject {
    func updateLanguageName(name: String, at index: Int)
    func updateLanguageScore(score: String, at index: Int)
    func deleteLanguage(at index: Int)
    func appendLanguage()
}
