import DesignSystem
import Validator

protocol MyPageProfileIntentProtocol {
    func updateIntroduce(introduce: String)
    func updateEmail(email: String)
    func updateMajor(major: String)
    func updatePortfolioURL(portfolioURL: String)
    func techStackAppendIsRequired()
    func techStackAppendDismissed()
    func techStackAppendDidComplete(techStacks: [String])
    func removeTechStack(techStack: String)
    func majorSheetIsRequired()
    func majorSheetDismissed()
    func imagePickerIsRequired()
    func imagePickerDismissed()
    func imageMethodPickerIsRequired()
    func imageMethodPickerDismissed()
    func imageDidSelected(imageResult: PickedImageResult?)
    func cameraIsRequired()
    func cameraDismissed()
    func activeSelfEntering()
    func deActiveSelfEntering()
    func validateProfile(
        profileImageURL: String,
        introduce: String,
        email: String,
        major: String,
        portfolioURL: String
    ) -> Bool
}

extension MyPageIntent: MyPageProfileIntentProtocol {
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

    func techStackAppendIsRequired() {
        model?.updateIsPresentedTechStackAppend(isPresented: true)
    }

    func techStackAppendDismissed() {
        model?.updateIsPresentedTechStackAppend(isPresented: false)
    }

    func techStackAppendDidComplete(techStacks: [String]) {
        model?.updateTechStacks(techStacks: techStacks)
    }

    func removeTechStack(techStack: String) {
        model?.removeTechStack(techStack: techStack)
    }

    func majorSheetIsRequired() {
        model?.updateIsPresentedMajorSheet(isPresented: true)
    }

    func majorSheetDismissed() {
        model?.updateIsPresentedMajorSheet(isPresented: false)
    }

    func imagePickerIsRequired() {
        model?.updateIsPresentedProfileImage(isPresented: true)
    }

    func imagePickerDismissed() {
        model?.updateIsPresentedProfileImage(isPresented: false)
    }

    func imageMethodPickerIsRequired() {
        model?.updateIsPresentedImageMethodPicker(isPresented: true)
    }

    func imageMethodPickerDismissed() {
        model?.updateIsPresentedImageMethodPicker(isPresented: false)
    }

    func imageDidSelected(imageResult: PickedImageResult?) {
        guard let imageResult else { return }
        Task {
            do {
                async let profileURL = imageUpload(imageResult: imageResult)

                try await model?.updateProfileURL(url: profileURL)
            }
        }
    }

    func cameraIsRequired() {
        model?.updateIsPresentedProfileCamera(isPresented: true)
    }

    func cameraDismissed() {
        model?.updateIsPresentedProfileCamera(isPresented: false)
    }

    func activeSelfEntering() {
        model?.updateIsSelfEntering(isSelfEntering: true)
    }

    func deActiveSelfEntering() {
        model?.updateIsSelfEntering(isSelfEntering: false)
    }

    func validateProfile(
        profileImageURL: String,
        introduce: String,
        email: String,
        major: String,
        portfolioURL: String
    ) -> Bool {
        var errorSet = Set<MyPageProfileErrorField>()
        if profileImageURL.isEmpty {
            errorSet.insert(.profile)
        }

        let stringSizeValidator = StringSizeValidator(min: 1, max: 50)
        if !stringSizeValidator.validate(introduce) {
            errorSet.insert(.introduce)
        }

        let emailValidator = EmailValidator()
        if !emailValidator.validate(email) {
            errorSet.insert(.email)
        }

        if major.isEmpty {
            errorSet.insert(.major)
        }

        let urlValidator = URLValidator()
        if !urlValidator.validate(portfolioURL) {
            errorSet.insert(.portfoilo)
        }

        model?.updateProfileErrorFieldSet(set: errorSet)
        guard
            errorSet.isEmpty
        else {
            return true
        }

        return false
    }
}
