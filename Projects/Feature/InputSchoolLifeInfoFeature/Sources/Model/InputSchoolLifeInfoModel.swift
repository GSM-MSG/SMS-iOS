import Foundation

enum InputSchoolLifeErrorField: Hashable {
    case gsmAuthentication
    case hwp
}

final class InputSchoolLifeInfoModel: ObservableObject, InputSchoolLifeInfoStateProtocol {
    @Published var authenticationScroe: String = ""
    @Published var isPresentedHWPFileImporter: Bool = false
    @Published var hwpFileURL: URL?
    var hwpFilename: String {
        guard let hwpFileURL else {
            return ""
        }
        return hwpFileURL.lastPathComponent
    }
    @Published var errorField: Set<InputSchoolLifeErrorField> = []
}

extension InputSchoolLifeInfoModel: InputSchoolLifeInfoActionProtocol {
    func updateAuthenticationScore(score: String) {
        self.authenticationScroe = score
    }

    func updateIsPresentedHWPFileImporter(isPresented: Bool) {
        self.isPresentedHWPFileImporter = isPresented
    }

    func updateHWPFileURL(url: URL) {
        self.hwpFileURL = url
    }

    func updateErrorField(field: Set<InputSchoolLifeErrorField>) {
        self.errorField = field
    }
}
