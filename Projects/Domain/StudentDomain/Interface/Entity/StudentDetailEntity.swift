import Foundation

public struct StudentDetailEntity: Equatable {
    public let name: String
    public let introduce: String
    public let major: String
    public let profileImageURL: String
    public let techStacks: [String]
    public let detailInfoByStudent: DetailInfoByStudent?
    public let detailInfoByTeacher: DetailInfoByTeacher?

    public init(
        name: String,
        introduce: String,
        major: String,
        profileImageURL: String,
        techStacks: [String],
        detailInfoByStudent: DetailInfoByStudent? = nil,
        detailInfoByTeacher: DetailInfoByTeacher? = nil
    ) {
        self.name = name
        self.introduce = introduce
        self.major = major
        self.profileImageURL = profileImageURL
        self.techStacks = techStacks
        self.detailInfoByStudent = detailInfoByStudent
        self.detailInfoByTeacher = detailInfoByTeacher
    }
}

extension StudentDetailEntity {
    public struct DetailInfoByStudent: Equatable {
        public let grade: Int
        public let `class`: Int
        public let number: Int
        public let department: DepartmentType

        public init(grade: Int, class: Int, number: Int, department: DepartmentType) {
            self.grade = grade
            self.class = `class`
            self.number = number
            self.department = department
        }
    }

    public struct DetailInfoByTeacher: Equatable {
        public let grade: Int
        public let `class`: Int
        public let number: Int
        public let department: DepartmentType

        public init(grade: Int, class: Int, number: Int, department: DepartmentType) {
            self.grade = grade
            self.class = `class`
            self.number = number
            self.department = department
        }
    }
}
