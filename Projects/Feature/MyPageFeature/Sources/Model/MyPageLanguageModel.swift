import StudentDomainInterface

struct LanguageModel: Equatable {
    var name: String
    var score: String
}

protocol MyPageLanguageInfoStateProtocol {
    var languageList: [LanguageModel] { get }
}

protocol MyPageLanguageInfoActionProtocol: AnyObject {
    func updateLanguageName(name: String, at index: Int)
    func updateLanguageScore(score: String, at index: Int)
    func updateLanguageScores(languages: [LanguageModel])
    func deleteLanguage(at index: Int)
    func appendLanguage()
}

extension MyPageModel: MyPageLanguageInfoActionProtocol {
    func updateLanguageName(name: String, at index: Int) {
        guard languageList[safe: index] != nil else { return }
        languageList[index].name = name
    }

    func updateLanguageScore(score: String, at index: Int) {
        guard languageList[safe: index] != nil else { return }
        languageList[index].score = score
    }

    func updateLanguageScores(languages: [LanguageModel]) {
        self.languageList = languages
    }

    func deleteLanguage(at index: Int) {
        languageList.remove(at: index)
    }

    func appendLanguage() {
        languageList.append(LanguageModel(name: "", score: ""))
    }
}
