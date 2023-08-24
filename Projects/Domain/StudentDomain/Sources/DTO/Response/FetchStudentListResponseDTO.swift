import Foundation
import StudentDomainInterface

public struct FetchStudentListResponseDTO: Decodable {
    public let content: [SingleStudentResponseDTO]
    public let totalSize: Int
    public let isLast: Bool

    public struct SingleStudentResponseDTO: Decodable {
        public let id: String
        public let profileImg: String
        public let name: String
        public let major: String
        public let techStacks: [String]
    }

    enum CodingKeys: String, CodingKey {
        case content, totalSize
        case isLast = "last"
    }
}

public extension FetchStudentListResponseDTO.SingleStudentResponseDTO {
    func toDomain() -> SingleStudentEntity {
        SingleStudentEntity(
            id: id,
            profileImageURL: profileImg,
            name: name,
            major: major,
            techStacks: techStacks
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
