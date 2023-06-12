import Foundation

public struct FetchStudentDetailByGuestResponseDTO: Decodable {
    public let name: String
    public let introduce: String
    public let major: String
    public let profileImg: String
    public let techStack: [String]

    public init(name: String, introduce: String, major: String, profileImg: String, techStack: [String]) {
        self.name = name
        self.introduce = introduce
        self.major = major
        self.profileImg = profileImg
        self.techStack = techStack
    }
}
