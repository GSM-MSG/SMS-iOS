import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import StudentDomainInterface

final class InputInformationModel: ObservableObject, InputInformationStateProtocol {
    @Published var phase: InformationPhase = .profile
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    var errorMessage: String = "알 수 없는 오류가 발생했습니다."
    var inputProfileInformationObject: InputProfileInformationObject?
    var inputSchoolLifeInformationObject: InputSchoolLifeInformationObject?
    var inputWorkInfomationObject: InputWorkInformationObject?
    var certificates: [String] = []
    var militaryServiceType: MilitaryServiceType?
    var languages: [InputStudentInformationRequestDTO.LanguageCertificate] = []
    @Published var isCompleteToInputAllInfo: Bool = false
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

    func updateCertificates(certificates: [String]) {
        self.certificates = certificates
    }

    func updateMilitaryServiceType(type: MilitaryServiceType) {
        self.militaryServiceType = type
    }

    func updateLanguages(languages: [InputStudentInformationRequestDTO.LanguageCertificate]) {
        self.languages = languages
    }

    func updateIsCompleteToInputAllInfo(isComplete: Bool) {
        self.isCompleteToInputAllInfo = isComplete
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updateErrorMessage(message: String) {
        self.errorMessage = message
    }
}
