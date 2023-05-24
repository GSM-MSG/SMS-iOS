import Foundation

enum InputSchoolLifeErrorField: Hashable {
    case gsmAuthentication
    case hwp
}

final class InputSchoolLifeInfoModel: ObservableObject, InputSchoolLifeInfoStateProtocol {
    @Published var authenticationScore: String = ""
    @Published var isPresentedHWPFileImporter: Bool = false
    @Published var hwpFileURL: URL?
    var hwpFilename: String {
        guard let hwpFileURL else {
            return ""
        }
        return hwpFileURL.lastPathComponent
    }
    @Published var errorField: Set<InputSchoolLifeErrorField> = []
    var isDisabledNextButton: Bool {
        authenticationScore.isEmpty ||
        hwpFileURL == nil
    }
}

extension InputSchoolLifeInfoModel: InputSchoolLifeInfoActionProtocol {
    func updateAuthenticationScore(score: String) {
        self.authenticationScore = score
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
