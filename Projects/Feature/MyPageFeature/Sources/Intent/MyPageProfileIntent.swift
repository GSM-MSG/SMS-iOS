import DesignSystem

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
                async let profileImageURL = imageUploadUseCase.execute(
                    image: imageResult.uiImage.jpegData(compressionQuality: 0.2) ?? .init(),
                    fileName: imageResult.fileName
                )
                try await model?.updateProfileURL(url: profileImageURL)
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
}
