import Foundation
import InputCertificateInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputLanguageInfoFeatureInterface
import StudentDomainInterface

final class InputInformationIntent: InputInformationIntentProtocol {
    private weak var model: (any InputInformationActionProtocol)?

    init(model: any InputInformationActionProtocol) {
        self.model = model
    }

    func completeToInputAllInfo(state: any InputInformationStateProtocol) {
        // TODO: 전체 정보 서버와 통신
    }
}

extension InputInformationIntent: InputProfileDelegate {
    func completeToInputProfile(input: InputProfileInformationObject) {
        model?.updateInputProfileInformationObject(object: input)
        model?.nextButtonDidTap()
    }
}

extension InputInformationIntent: InputSchoolLifeDelegate {
    func schoolLifePrevButtonDidTap() {
        model?.prevButtonDidTap()
    }

    func completeToInputSchoolLife(input: InputSchoolLifeInformationObject) {
        model?.nextButtonDidTap()
    }
}

extension InputInformationIntent: InputWorkDelegate {
    func workPrevButtonDidTap() {
        model?.prevButtonDidTap()
    }

    func completeToInputWork(input: InputWorkInformationObject) {
        model?.updateInputWorkInformationObject(object: input)
        model?.nextButtonDidTap()
    }
}

extension InputInformationIntent: InputMilitaryDelegate {
    func militaryPrevButtonDidTap() {
        model?.prevButtonDidTap()
    }

    func completeToInputMilitary(militaryServiceType: String) {
        let militaryServiceTypeEnum = MilitaryServiceType(rawValue: militaryServiceType) ?? .hope
        model?.updateMilitaryServiceType(type: militaryServiceTypeEnum)
        model?.nextButtonDidTap()
    }
}

extension InputInformationIntent: InputCertificateDelegate {
    func certificatePrevButtonDidTap() {
        model?.prevButtonDidTap()
    }

    func completeToInputCertificate() {
        model?.nextButtonDidTap()
    }
}

extension InputInformationIntent: InputLanguageDelegate {
    func languagePrevButtonDidTap() {
        model?.prevButtonDidTap()
    }

    func completeToInputLanguage(languages: [(name: String, score: String)]) {
        let languageCertificates: [InputStudentInformationRequestDTO.LanguageCertificate] = languages
            .map { .init(languageCertificateName: $0.name, score: $0.score) }
        model?.updateLanguages(languages: languageCertificates)
        model?.updateIsCompleteToInputAllInfo(isComplete: true)
    }
}
