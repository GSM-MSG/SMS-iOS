protocol MyPageLanguageIntentProtocol {
    func updateLanguageName(name: String, at index: Int)
    func updateLanguageScore(score: String, at index: Int)
    func deleteLanguage(at index: Int)
    func languageAppendButtonDidTap()
}

extension MyPageIntent: MyPageLanguageIntentProtocol {
    func updateLanguageName(name: String, at index: Int) {
        model?.updateLanguageName(name: name, at: index)
    }

    func updateLanguageScore(score: String, at index: Int) {
        model?.updateLanguageScore(score: score, at: index)
    }

    func deleteLanguage(at index: Int) {
        model?.deleteLanguage(at: index)
    }

    func languageAppendButtonDidTap() {
        model?.appendLanguage()
    }
}
