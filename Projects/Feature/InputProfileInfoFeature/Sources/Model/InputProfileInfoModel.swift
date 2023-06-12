import DesignSystem
import Foundation

final class InputProfileInfoModel: ObservableObject, InputProfileInfoStateProtocol {
    @Published var introduce: String = ""
    @Published var email: String = ""
    @Published var major: String = ""
    @Published var majorList: [String] = []
    @Published var portfolioURL: String = ""
    @Published var techStacks: [String] = []
    @Published var isPresentedMajorSheet: Bool = false
    @Published var isPresentedImagePicker: Bool = false
    @Published var isPresentedImageMethodPicker: Bool = false
    @Published var isPresentedCamera: Bool = false
    @Published var isSelfEntering: Bool = false
    @Published var inputProfileErrorFieldSet: Set<InputProfileErrorField> = []
    @Published var profileImage: PickedImageResult?
    @Published var isPresentedTechStackAppend: Bool = false
    var isDisabledNextButton: Bool {
        introduce.isEmpty ||
        email.isEmpty ||
        major.isEmpty ||
        portfolioURL.isEmpty
    }
}

extension InputProfileInfoModel: InputProfileInfoActionProtocol {
    func updateIntroduce(introduce: String) {
        self.introduce = introduce
    }

    func updateEmail(email: String) {
        self.email = email
    }

    func updateMajor(major: String) {
        self.major = major
    }

    func updateMajorList(majorList: [String]) {
        self.majorList = majorList
    }

    func updatePortfolioURL(portfolioURL: String) {
        self.portfolioURL = portfolioURL
    }

    func appendTeckStacks(techStacks: [String]) {
        self.techStacks.append(contentsOf: techStacks)
    }

    func updateIsPresentedTeckStackAppend(isPresented: Bool) {
        self.isPresentedTechStackAppend = isPresented
    }

    func updateIsPresentedMajorSheet(isPresented: Bool) {
        self.isPresentedMajorSheet = isPresented
    }

    func updateIsPresentedImagePicker(isPresented: Bool) {
        self.isPresentedImagePicker = isPresented
    }

    func updateIsPresentedImageMethodPicker(isPresented: Bool) {
        self.isPresentedImageMethodPicker = isPresented
    }

    func updateIsPresentedCamera(isPresented: Bool) {
        self.isPresentedCamera = isPresented
    }

    func updateIsSelfEntering(isSelfEntering: Bool) {
        self.isSelfEntering = isSelfEntering
    }

    func updateProfileImage(imageResult: PickedImageResult?) {
        self.profileImage = imageResult
    }

    func updateErrorFieldSet(set: Set<InputProfileErrorField>) {
        self.inputProfileErrorFieldSet = set
    }
}
