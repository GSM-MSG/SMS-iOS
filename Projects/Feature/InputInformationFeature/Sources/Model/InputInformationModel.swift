import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface

final class InputInformationModel: ObservableObject, InputInformationStateProtocol {
    @Published var phase: InformationPhase = .profile
    @Published var inputProfileInformationObject: InputProfileInformationObject?
    @Published var inputSchoolLifeInformationObject: InputSchoolLifeInformationObject?
}

extension InputInformationModel: InputInformationActionProtocol {
    func prevButtonDidTap() {
        guard let currentIndex = InformationPhase.allCases.firstIndex(of: phase),
              currentIndex > 0
        else { return }
        phase = InformationPhase.allCases[currentIndex - 1]
    }

    func nextButtonDidTap() {
        guard let currentIndex = InformationPhase.allCases.firstIndex(of: phase),
              currentIndex < InformationPhase.allCases.count - 1
        else { return }
        phase = InformationPhase.allCases[currentIndex + 1]
    }

    func updateInputProfileInformationObject(object: InputProfileInformationObject) {
        self.inputProfileInformationObject = object
    }

    func updateInputSchoolLifeInformationObject(object: InputSchoolLifeInformationObject) {
        self.inputSchoolLifeInformationObject = object
    }
}
