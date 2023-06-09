import Foundation
import FoundationUtil
import InputLanguageInfoFeatureInterface
import Validator

final class InputLanguageInfoIntent: InputLanguageInfoIntentProtocol {
    private weak var model: (any InputLanguageInfoActionProtocol)?
    private weak var languageDelegate: (any InputLanguageDelegate)?

    init(
        model: any InputLanguageInfoActionProtocol,
        languageDelegate: any InputLanguageDelegate
    ) {
        self.model = model
        self.languageDelegate = languageDelegate
    }

    func updateLanguageName(name: String, at index: Int) {
        model?.updateLanguageName(name: name, at: index)
    }

    func updateLanguageScore(score: String, at index: Int) {
        let stringSizeValidator = StringSizeValidator(min: 0, max: 20)
        model?.updateLanguageScore(score: score, at: index)
    }

    func deleteLanguage(at index: Int) {
        model?.deleteLanguage(at: index)
    }

    func languageAppendButtonDidTap() {
        model?.appendLanguage()
    }

    func prevButtonDidTap() {
        languageDelegate?.languagePrevButtonDidTap()
    }

    func completeButtonDidTap(languages: [LanguageInputModel]) {
        let tupledLanguages = languages
            .map {
                (
                    name: $0.languageName.trimmingCharacters(in: .whitespacesAndNewlines),
                    score: $0.languageScore.trimmingCharacters(in: .whitespacesAndNewlines)
                )
            }
            .filter { $0.isNotEmpty && $1.isNotEmpty }
        languageDelegate?.completeToInputLanguage(languages: tupledLanguages)
    }
}
