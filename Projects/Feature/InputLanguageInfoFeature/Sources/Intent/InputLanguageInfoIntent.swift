import Foundation

final class InputLanguageInfoIntent: InputLanguageInfoIntentProtocol {
    private weak var model: (any InputLanguageInfoActionProtocol)?

    init(model: any InputLanguageInfoActionProtocol) {
        self.model = model
    }

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
