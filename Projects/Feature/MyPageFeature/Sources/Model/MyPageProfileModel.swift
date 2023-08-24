import Foundation

protocol MyPageProfileStateProtocol {
    var profileURL: String { get }
    var introduce: String { get }
    var email: String { get }
    var major: String { get }
    var majorList: [String] { get }
    var portfolioURL: String { get }
    var techStacks: [String] { get }
    var isSelfEntering: Bool { get }
    var isPresentedMajorSheet: Bool { get }
    var isPresentedImageMethodPicker: Bool { get }
    var isPresentedProfileCamera: Bool { get }
    var isPresentedProfileImage: Bool { get }
    var isPresentedTechStackAppend: Bool { get }
}

protocol MyPageProfileActionProtocol: AnyObject {
    func updateProfileURL(url: String)
    func updateIntroduce(introduce: String)
    func updateEmail(email: String)
    func updateMajor(major: String)
    func updateMajorList(majorList: [String])
    func updatePortfolioURL(portfolioURL: String)
    func updateTechStacks(techStacks: [String])
    func removeTechStack(techStack: String)
    func updateIsSelfEntering(isSelfEntering: Bool)
    func updateIsPresentedMajorSheet(isPresented: Bool)
    func updateIsPresentedImageMethodPicker(isPresented: Bool)
    func updateIsPresentedProfileCamera(isPresented: Bool)
    func updateIsPresentedProfileImage(isPresented: Bool)
    func updateIsPresentedTechStackAppend(isPresented: Bool)
}

extension MyPageModel: MyPageProfileActionProtocol {
    func updateProfileURL(url: String) {
        self.profileURL = url
    }

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

    func updateTechStacks(techStacks: [String]) {
        self.techStacks = techStacks
    }

    func removeTechStack(techStack: String) {
        self.techStacks.removeAll { $0 == techStack }
    }

    func updateIsSelfEntering(isSelfEntering: Bool) {
        self.isSelfEntering = isSelfEntering
    }

    func updateIsPresentedMajorSheet(isPresented: Bool) {
        self.isPresentedMajorSheet = isPresented
    }

    func updateIsPresentedImageMethodPicker(isPresented: Bool) {
        self.isPresentedImageMethodPicker = isPresented
    }

    func updateIsPresentedProfileCamera(isPresented: Bool) {
        self.isPresentedProfileCamera = isPresented
    }

    func updateIsPresentedProfileImage(isPresented: Bool) {
        self.isPresentedProfileImage = isPresented
    }

    func updateIsPresentedTechStackAppend(isPresented: Bool) {
        self.isPresentedTechStackAppend = isPresented
    }
}
