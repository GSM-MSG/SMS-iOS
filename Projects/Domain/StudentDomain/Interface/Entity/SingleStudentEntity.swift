import Foundation

public struct SingleStudentEntity: Equatable {
    public let id: String
    public let profileImageURL: String
    public let name: String
    public let major: String
    public let techStacks: [String]

    public init(id: String, profileImageURL: String, name: String, major: String, techStacks: [String]) {
        self.id = id
        self.profileImageURL = profileImageURL
        self.name = name
        self.major = major
        self.techStacks = techStacks
    }
}
