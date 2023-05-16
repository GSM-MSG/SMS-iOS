import Foundation

final class InputProfileInfoModel: ObservableObject, InputProfileInfoStateProtocol {
    @Published var introduce: String = ""
    @Published var email: String = ""
    @Published var major: String = ""
    @Published var portfolioURL: String = ""
    @Published var techStack: String = ""
    @Published var isPresentedMajorSheet: Bool = false
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

    func updatePortfolioURL(portfolioURL: String) {
        self.portfolioURL = portfolioURL
    }

    func updateTeckStack(techStack: String) {
        self.techStack = techStack
    }

    func updateIsPresentedMajorSheet(isPresented: Bool) {
        self.isPresentedMajorSheet = isPresented
    }
}
