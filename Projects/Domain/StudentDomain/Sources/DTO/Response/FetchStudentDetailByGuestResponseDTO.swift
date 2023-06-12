import Foundation
import StudentDomainInterface

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

public extension FetchStudentDetailByGuestResponseDTO {
    func toDomain() -> StudentDetailEntity {
        StudentDetailEntity(
            name: name,
            introduce: introduce,
            major: major,
            profileImageURL: profileImg,
            techStacks: techStack
        )
    }
}
