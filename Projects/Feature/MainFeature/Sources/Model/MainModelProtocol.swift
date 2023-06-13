import StudentDomainInterface

protocol MainStateProtocol {
    var page: Int { get }
    var totalSize: Int { get }
    var isLast: Bool { get }
    var isError: Bool { get }
    var isPresentedExistActionSheet: Bool { get }
    var isPresentedLogoutDialog: Bool { get }
    var isPresentedWithdrawalDialog: Bool { get }
    var isPresentedFilterPage: Bool { get }
    var content: [SingleStudentEntity] { get }
    var selectedUserID: String? { get }
}

protocol MainActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updatePage(page: Int)
    func updateTotalSize(totalSize: Int)
    func updateIsLast(isLast: Bool)
    func updateIsPresentedExistActionSheet(isPresented: Bool)
    func updateIsPresentedLogoutDialog(isPresented: Bool)
    func updateIsPresentedWithdrawalDialog(isPresented: Bool)
    func updateIsPresentedFilterPage(isPresented: Bool)
    func appendContent(content: [SingleStudentEntity])
    func updateSelectedUserID(userID: String?)
}
