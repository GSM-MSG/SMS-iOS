import Foundation

final class InputSchoolLifeInfoModel: ObservableObject, InputSchoolLifeInfoStateProtocol {
    @Published var authenticationScroe: String = ""
    @Published var isPresentedHWPFileImporter: Bool = false
}

extension InputSchoolLifeInfoModel: InputSchoolLifeInfoActionProtocol {
    func updateAuthenticationScore(score: String) {
        self.authenticationScroe = score
    }

    func updateIsPresentedHWPFileImporter(isPresented: Bool) {
        self.isPresentedHWPFileImporter = isPresented
    }
}
