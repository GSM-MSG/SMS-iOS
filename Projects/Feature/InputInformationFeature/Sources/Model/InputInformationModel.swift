import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import StudentDomainInterface

final class InputInformationModel: ObservableObject, InputInformationStateProtocol {
    @Published var phase: InformationPhase = .profile
    var inputProfileInformationObject: InputProfileInformationObject?
    var inputSchoolLifeInformationObject: InputSchoolLifeInformationObject?
    var inputWorkInfomationObject: InputWorkInformationObject?
    var languages: [InputStudentInformationRequestDTO.LanguageCertificate] = []
    var isCompleteToInputAllInfo: Bool = false
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

    func updateInputWorkInformationObject(object: InputWorkInformationObject) {
        self.inputWorkInfomationObject = object
    }

    func updateLanguages(languages: [InputStudentInformationRequestDTO.LanguageCertificate]) {
        self.languages = languages
    }

    func updateIsCompleteToInputAllInfo(isComplete: Bool) {
        self.isCompleteToInputAllInfo = isComplete
    }
}
