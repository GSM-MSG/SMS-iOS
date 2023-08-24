import Foundation

enum InputSchoolLifeErrorField: Hashable {
    case gsmAuthentication
}

final class InputSchoolLifeInfoModel: ObservableObject, InputSchoolLifeInfoStateProtocol {
    @Published var authenticationScore: String = ""
    @Published var errorField: Set<InputSchoolLifeErrorField> = []
    var isDisabledNextButton: Bool {
        authenticationScore.isEmpty
    }
}

extension InputSchoolLifeInfoModel: InputSchoolLifeInfoActionProtocol {
    func updateAuthenticationScore(score: String) {
        self.authenticationScore = score
    }

    func updateErrorField(field: Set<InputSchoolLifeErrorField>) {
        self.errorField = field
    }
}
