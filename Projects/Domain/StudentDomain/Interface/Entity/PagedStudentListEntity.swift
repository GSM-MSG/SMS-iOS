import Foundation

public struct PagedStudentListEntity: Equatable {
    public let studentList: [SingleStudentEntity]
    public let totalSize: Int
    public let isLast: Bool

    public init(studentList: [SingleStudentEntity], totalSize: Int, isLast: Bool) {
        self.studentList = studentList
        self.totalSize = totalSize
        self.isLast = isLast
    }
}
