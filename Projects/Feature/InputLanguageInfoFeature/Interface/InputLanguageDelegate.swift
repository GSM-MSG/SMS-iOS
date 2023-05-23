public protocol InputLanguageDelegate: AnyObject {
    func languagePrevButtonDidTap()
    func completeToInputLanguage(languages: [(name: String, score: String)])
}
