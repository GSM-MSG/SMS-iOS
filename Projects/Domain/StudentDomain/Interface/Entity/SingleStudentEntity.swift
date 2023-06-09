import Foundation

public struct SingleStudentEntity: Equatable {
    public let profileImageURL: String
    public let name: String
    public let major: String
    public let techStack: [String]

    public init(profileImageURL: String, name: String, major: String, techStack: [String]) {
        self.profileImageURL = profileImageURL
        self.name = name
        self.major = major
        self.techStack = techStack
    }
}
