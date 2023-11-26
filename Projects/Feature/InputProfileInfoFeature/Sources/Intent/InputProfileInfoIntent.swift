import DesignSystem
import Foundation
import InputProfileInfoFeatureInterface
import Validator
import MajorDomainInterface

final class InputProfileInfoIntent: InputProfileInfoIntentProtocol {
    private weak var model: (any InputProfileInfoActionProtocol)?
    private weak var inputProfileDelegate: (any InputProfileDelegate)?
    private let fetchMajorListUseCase: any FetchMajorListUseCase

    init(
        model: any InputProfileInfoActionProtocol,
        inputProfileDelegate: any InputProfileDelegate,
        fetchMajorListUseCase: any FetchMajorListUseCase
    ) {
        self.model = model
        self.inputProfileDelegate = inputProfileDelegate
        self.fetchMajorListUseCase = fetchMajorListUseCase
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

    func techStackAppendIsRequired() {
        model?.updateIsPresentedTeckStackAppend(isPresented: true)
    }

    func techStackAppendDismissed() {
        model?.updateIsPresentedTeckStackAppend(isPresented: false)
    }

    func techStackAppendDidComplete(techStacks: [String]) {
        model?.updateTeckStacks(techStacks: Array(techStacks.prefix(5)))
    }

    func removeTechStack(techStack: String) {
        model?.removeTeckStacks(techStack: techStack)
    }

    func majorSheetIsRequired() {
        model?.updateIsPresentedMajorSheet(isPresented: true)
    }

    func majorSheetDismissed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.model?.updateIsPresentedMajorSheet(isPresented: false)
        }
    }

    func imagePickerIsRequired() {
        model?.updateIsPresentedImagePicker(isPresented: true)
    }

    func imagePickerDismissed() {
        model?.updateIsPresentedImagePicker(isPresented: false)
    }

    func imageMethodPickerIsRequired() {
        model?.updateIsPresentedImageMethodPicker(isPresented: true)
    }

    func imageMethodPickerDismissed() {
        model?.updateIsPresentedImageMethodPicker(isPresented: false)
    }

    func imageDidSelected(imageResult: PickedImageResult?) {
        model?.updateProfileImage(imageResult: imageResult)
    }

    func completeButtonDidTap(state: any InputProfileInfoStateProtocol) {
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
            techStacks: state.techStacks
        )
        inputProfileDelegate?.completeToInputProfile(input: input)
    }

    func cameraIsRequired() {
        model?.updateIsPresentedCamera(isPresented: true)
    }

    func cameraDismissed() {
        model?.updateIsPresentedCamera(isPresented: false)
    }

    func activeSelfEntering() {
        model?.updateIsSelfEntering(isSelfEntering: true)
    }

    func deActiveSelfEntering() {
        model?.updateIsSelfEntering(isSelfEntering: false)
    }

    func onLoad() {
        Task {
            let majorList = try await fetchMajorListUseCase.execute()
            model?.updateMajorList(majorList: majorList)
        }
    }
}
