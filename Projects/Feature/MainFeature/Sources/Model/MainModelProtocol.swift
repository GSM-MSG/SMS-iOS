import StudentDomainInterface

protocol MainStateProtocol {
    var page: Int { get }
    var totalSize: Int { get }
    var isLast: Bool { get }
    var isError: Bool { get }
    var isSuccess: Bool { get }
    var content: [SingleStudentEntity] { get }
}

protocol MainActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updateIsSuccess(isSuccess: Bool)
    func updatePage(page: Int)
    func updateTotalSize(totalSize: Int)
    func updateIsLast(isLast: Bool)
    func appendContent(content: [SingleStudentEntity])
}
