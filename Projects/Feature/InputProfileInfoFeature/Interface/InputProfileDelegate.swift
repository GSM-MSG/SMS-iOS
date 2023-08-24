import Foundation

public protocol InputProfileDelegate: AnyObject {
    func completeToInputProfile(input: InputProfileInformationObject)
}

public struct InputProfileInformationObject {
    public let profileImageData: Data
    public let profileImageFilename: String
    public let introduce: String
    public let contactEmail: String
    public let major: String
    public let portfoiloURL: String
    public let techStacks: [String]

    public init(
        profileImageData: Data,
        profileImageFilename: String,
        introduce: String,
        contactEmail: String,
        major: String,
        portfoiloURL: String,
        techStacks: [String]
    ) {
        self.profileImageData = profileImageData
        self.profileImageFilename = profileImageFilename
        self.introduce = introduce
        self.contactEmail = contactEmail
        self.major = major
        self.portfoiloURL = portfoiloURL
        self.techStacks = techStacks
    }
}
