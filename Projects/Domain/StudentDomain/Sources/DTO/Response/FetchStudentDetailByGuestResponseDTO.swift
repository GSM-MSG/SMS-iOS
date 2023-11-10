import Foundation
import StudentDomainInterface

public struct FetchStudentDetailByGuestResponseDTO: Decodable {
    public let name: String
    public let introduce: String
    public let major: String
    public let profileImg: String
    public let techStacks: [String]
    public let projects: [ProjectResponseDTO]
    public let prizes: [PrizeResponseDTO]

    public init(
        name: String,
        introduce: String,
        major: String,
        profileImg: String,
        techStacks: [String],
        projects: [ProjectResponseDTO],
        prizes: [PrizeResponseDTO]
    ) {
        self.name = name
        self.introduce = introduce
        self.major = major
        self.profileImg = profileImg
        self.techStacks = techStacks
        self.projects = projects
        self.prizes = prizes
    }

    enum CodingKeys: String, CodingKey {
        case name, introduce, major, techStacks, projects, prizes
        case profileImg = "profileImgUrl"
    }
}

public extension FetchStudentDetailByGuestResponseDTO {
    func toDomain() -> StudentDetailEntity {
        StudentDetailEntity(
            name: name,
            introduce: introduce,
            major: major,
            profileImageURL: profileImg,
            techStacks: techStacks,
            projects: projects.map { $0.toDomain() },
            prizes: prizes.map { $0.toDomain() }
        )
    }
}
