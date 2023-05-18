import Foundation
import FoundationUtil

final class InputLanguageInfoModel: ObservableObject, InputLanguageInfoStateProtocol {
    @Published var languageList: [LanguageInputModel] = [
        .init(languageName: "", languageScore: "")
    ]
}

extension InputLanguageInfoModel: InputLanguageInfoActionProtocol {
    func updateLanguageName(name: String, at index: Int) {
        guard let indexedLanguage = languageList[safe: index] else { return }
        let newLanuageInputModel = LanguageInputModel(
            languageName: name,
            languageScore: indexedLanguage.languageScore
        )
        languageList[index] = newLanuageInputModel
    }

    func updateLanguageScore(score: String, at index: Int) {
        guard let indexedLanguage = languageList[safe: index] else { return }
        let newLanuageInputModel = LanguageInputModel(
            languageName: indexedLanguage.languageName,
            languageScore: score
        )
        languageList[index] = newLanuageInputModel
    }

    func deleteLanguage(at index: Int) {
        languageList.remove(at: index)
    }

    func appendLanguage() {
        languageList.append(
            .init(languageName: "", languageScore: "")
        )
    }
}
