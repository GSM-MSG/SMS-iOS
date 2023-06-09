import Foundation
import StudentDomainInterface

public struct FetchStudentListResponseDTO: Decodable {
    public let content: [SingleStudentResponseDTO]
    public let totalSize: Int
    public let isLast: Bool

    public struct SingleStudentResponseDTO: Decodable {
        public let profileImg: String
        public let name: String
        public let major: String
        public let techStack: [String]
    }

    enum CodingKeys: String, CodingKey {
        case content, totalSize
        case isLast = "last"
    }
}

public extension FetchStudentListResponseDTO.SingleStudentResponseDTO {
    func toDomain() -> SingleStudentEntity {
        SingleStudentEntity(
            profileImageURL: profileImg,
            name: name,
            major: major,
            techStack: techStack
        )
    }
}

public extension FetchStudentListResponseDTO {
    func toDomain() -> PagedStudentListEntity {
        PagedStudentListEntity(
            studentList: content.map { $0.toDomain() },
            totalSize: totalSize,
            isLast: isLast
        )
    }
}
