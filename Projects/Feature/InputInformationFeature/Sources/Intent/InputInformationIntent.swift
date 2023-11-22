import FileDomainInterface
import Foundation
import InputInformationFeatureInterface
import InputProfileInfoFeatureInterface
import StudentDomainInterface
import ConcurrencyUtil
import DateUtil

final class InputInformationIntent: InputInformationIntentProtocol {
    private weak var model: (any InputInformationActionProtocol)?
    private weak var inputInformationDelegate: (any InputInformationDelegate)?
    private let imageUploadUseCase: any ImageUploadUseCase
    private let inputInformationUseCase: any InputInformationUseCase

    init(
        model: any InputInformationActionProtocol,
        inputInformationDelegate: any InputInformationDelegate,
        imageUploadUseCase: any ImageUploadUseCase,
        inputInformationUseCase: any InputInformationUseCase
    ) {
        self.model = model
        self.inputInformationDelegate = inputInformationDelegate
        self.imageUploadUseCase = imageUploadUseCase
        self.inputInformationUseCase = inputInformationUseCase
    }

    func completeToInputAllInfo(state: any InputInformationStateProtocol) {
        guard
            let inputProfileInfo = state.inputProfileInformationObject,
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

                let inputInformationRequest = try await InputStudentInformationRequestDTO(
                    contactEmail: inputProfileInfo.contactEmail,
                    gsmAuthenticationScore: state.gsmAuthenticationScore,
                    introduce: inputProfileInfo.introduce,
                    major: inputProfileInfo.major,
                    portfolioURL: inputProfileInfo.portfoiloURL,
                    profileImgURL: profileImageURL,
                    techStacks: inputProfileInfo.techStacks
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
