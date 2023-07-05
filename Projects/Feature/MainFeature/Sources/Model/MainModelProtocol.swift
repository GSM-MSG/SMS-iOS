import StudentDomainInterface
import UserDomainInterface

protocol MainStateProtocol {
    var page: Int { get }
    var totalSize: Int { get }
    var isLast: Bool { get }
    var isError: Bool { get }
    var isRefresh: Bool { get }
    var isPresentedExistActionSheet: Bool { get }
    var isPresentedLogoutDialog: Bool { get }
    var isPresentedWithdrawalDialog: Bool { get }
    var isPresentedFilterPage: Bool { get }
    var content: [SingleStudentEntity] { get }
    var selectedUserID: String? { get }
    var currentUserRole: UserRoleType { get }
    var filterOption: FilterOption? { get }
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
    func updateContent(content: [SingleStudentEntity])
    func updateIsRefresh(isRefresh: Bool)
    func updateSelectedUserID(userID: String?)
    func updateUserRole(role: UserRoleType)
    func updateFilterOption(filterOpion: FilterOption?)
}
