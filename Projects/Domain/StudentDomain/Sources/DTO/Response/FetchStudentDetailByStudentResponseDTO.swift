import StudentDomainInterface
import Foundation

public struct FetchStudentDetailByStudentResponseDTO: Decodable {
    public let name: String
    public let introduce: String
    public let grade: Int
    public let classNum: Int
    public let number: Int
    public let department: DepartmentType
    public let major: String
    public let profileImg: String
    public let techStacks: [String]
    public let projects: [ProjectResponseDTO]
    public let prizes: [PrizeResponseDTO]

    enum CodingKeys: String, CodingKey {
        case name, introduce, grade, classNum, number, department, major, techStacks, projects, prizes
        case profileImg = "profileImgUrl"
    }
}

public extension FetchStudentDetailByStudentResponseDTO {
    func toDomain() -> StudentDetailEntity {
        StudentDetailEntity(
            name: name,
            introduce: introduce,
            major: major,
            profileImageURL: profileImg,
            techStacks: techStacks,
            projects: projects.map { $0.toDomain() },
            prizes: prizes.map { $0.toDomain() },
            detailInfoByStudent: .init(
                grade: grade,
                class: classNum,
                number: number,
                department: department
            )
        )
    }
}
