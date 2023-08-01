import Foundation

final class MyPageModel: ObservableObject, MyPageStateProtocol {
    // MARK: Profile
    @Published var profileURL: String = ""
    @Published var introduce: String = ""
    @Published var email: String = ""
    @Published var major: String = ""
    @Published var majorList: [String] = []
    @Published var portfolioURL: String = ""
    @Published var techStacks: [String] = []
    @Published var isSelfEntering: Bool = false
    @Published var isPresentedMajorSheet: Bool = false
    @Published var isPresentedImageMethodPicker: Bool = false
    @Published var isPresentedProfileCamera: Bool = false
    @Published var isPresentedProfileImage: Bool = false
    @Published var isPresentedTechStackAppend: Bool = false
}

extension MyPageModel: MyPageActionProtocol {}
