import DesignSystem
import Foundation
import InputProfileInfoFeatureInterface
import Validator

final class InputProfileInfoIntent: InputProfileInfoIntentProtocol {
    private weak var model: (any InputProfileInfoActionProtocol)?
    private weak var inputProfileDelegate: (any InputProfileDelegate)?

    init(
        model: any InputProfileInfoActionProtocol,
        inputProfileDelegate: any InputProfileDelegate
    ) {
        self.model = model
        self.inputProfileDelegate = inputProfileDelegate
    }

    func updateIntroduce(introduce: String) {
        model?.updateIntroduce(introduce: introduce)
    }

    func updateEmail(email: String) {
        model?.updateEmail(email: email)
    }

    func updateMajor(major: String) {
        model?.updateMajor(major: major)
    }

    func updatePortfolioURL(portfolioURL: String) {
        model?.updatePortfolioURL(portfolioURL: portfolioURL)
    }

    func updateTechStack(techStack: String) {
        model?.updateTeckStack(techStack: techStack)
    }

    func majorSheetIsRequired() {
        model?.updateIsPresentedMajorSheet(isPresented: true)
    }

    func majorSheetDismissed() {
        model?.updateIsPresentedMajorSheet(isPresented: false)
    }

    func imagePickerIsRequired() {
        model?.updateIsPresentedImagePicker(isPresented: true)
    }

    func imagePickerDismissed() {
        model?.updateIsPresentedImagePicker(isPresented: false)
    }

    func imageDidSelected(imageResult: PickedImageResult?) {
        model?.updateProfileImage(imageResult: imageResult)
    }

    func nextButtonDidTap(state: any InputProfileInfoStateProtocol) {
        var errorSet = Set<InputProfileErrorField>()
        if state.profileImage == nil {
            errorSet.insert(.profile)
        }

        let stringSizeValidator = StringSizeValidator(min: 1, max: 50)
        if !stringSizeValidator.validate(state.introduce) {
            errorSet.insert(.introduce)
        }

        let emailValidator = EmailValidator()
        if !emailValidator.validate(state.email) {
            errorSet.insert(.email)
        }

        if state.major.isEmpty {
            errorSet.insert(.major)
        }

        let urlValidator = URLValidator()
        if !urlValidator.validate(state.portfolioURL) {
            errorSet.insert(.portfoilo)
        }

        model?.updateErrorFieldSet(set: errorSet)
        guard
            errorSet.isEmpty,
            let pickedImage = state.profileImage
        else {
            return
        }
        let input = InputProfileInformationObject(
            profileImageData: pickedImage.uiImage.jpegData(compressionQuality: 0.2) ?? .init(),
            profileImageFilename: pickedImage.fileName,
            introduce: state.introduce,
            contactEmail: state.email,
            major: state.major,
            portfoiloURL: state.portfolioURL,
            techStack: state.techStack.components(separatedBy: ",")
                .prefix(5)
                .map { $0.trimmingCharacters(in: .whitespaces) }
        )
        inputProfileDelegate?.completeToInputProfile(input: input)
    }
}
