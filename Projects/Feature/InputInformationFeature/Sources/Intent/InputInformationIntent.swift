import Foundation
import InputCertificateInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputLanguageInfoFeatureInterface
import InputInformationFeatureInterface
import StudentDomainInterface
import FileDomainInterface

final class InputInformationIntent: InputInformationIntentProtocol {
    private weak var model: (any InputInformationActionProtocol)?
    private weak var inputInformationDelegate: (any InputInformationDelegate)?
    private let dreamBookUploadUseCase: any DreamBookUploadUseCase
    private let imageUploadUseCase: any ImageUploadUseCase
    private let inputInformationUseCase: any InputInformationUseCase

    init(
        model: any InputInformationActionProtocol,
        inputInformationDelegate: any InputInformationDelegate,
        dreamBookUploadUseCase: any DreamBookUploadUseCase,
        imageUploadUseCase: any ImageUploadUseCase,
        inputInformationUseCase: any InputInformationUseCase
    ) {
        self.model = model
        self.inputInformationDelegate = inputInformationDelegate
        self.dreamBookUploadUseCase = dreamBookUploadUseCase
        self.imageUploadUseCase = imageUploadUseCase
        self.inputInformationUseCase = inputInformationUseCase
    }

    func completeToInputAllInfo(state: any InputInformationStateProtocol) {
        guard
            let inputProfileInfo = state.inputProfileInformationObject,
            let inputSchoolLifeInfo = state.inputSchoolLifeInformationObject,
            let inputWorkInfo = state.inputWorkInfomationObject,
            let militaryServiceType = state.militaryServiceType
        else {
            model?.updateIsCompleteToInputAllInfo(isComplete: false)
            return
        }

        model?.updateIsLoading(isLoading: true)
        Task {
            do {
                async let profileImageURL = imageUploadUseCase.execute(
                    image: inputProfileInfo.profileImageData,
                    fileName: inputProfileInfo.profileImageFilename
                )
                async let dreamBookURL = dreamBookUploadUseCase.execute(
                    file: inputSchoolLifeInfo.hwpData,
                    fileName: inputSchoolLifeInfo.hwpFilename
                )

                let inputInformationRequest = try await InputStudentInformationRequestDTO(
                    certificate: state.certificates,
                    contactEmail: inputProfileInfo.contactEmail,
                    dreamBookFileURL: dreamBookURL,
                    formOfEmployment: FormOfEmployment(rawValue: inputWorkInfo.formOfEmployment) ?? .fullTime,
                    gsmAuthenticationScore: inputSchoolLifeInfo.gsmAuthenticationScore,
                    introduce: inputProfileInfo.introduce,
                    languageCertificate: state.languages,
                    major: inputProfileInfo.major,
                    militaryService: militaryServiceType,
                    portfolioURL: inputProfileInfo.portfoiloURL,
                    profileImgURL: profileImageURL,
                    region: inputWorkInfo.workRegion,
                    salary: inputWorkInfo.salary,
                    techStack: inputProfileInfo.techStack
                )

                try await inputInformationUseCase.execute(req: inputInformationRequest)
                inputInformationDelegate?.completeToInputInformation()
                model?.updateIsLoading(isLoading: false)
            } catch {
                model?.updateErrorMessage(message: error.localizedDescription)
                model?.updateIsLoading(isLoading: false)
                model?.updateIsCompleteToInputAllInfo(isComplete: false)
            }
        }
    }

    func errorAlertDismissed() {
        model?.updateIsError(isError: true)
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
        model?.updateInputSchoolLifeInformationObject(object: input)
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

    func completeToInputCertificate(certificates: [String]) {
        model?.updateCertificates(certificates: certificates)
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
