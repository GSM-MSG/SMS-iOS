import StudentDomainInterface
import UserDomainInterface

protocol MainStateProtocol {
    var page: Int { get }
    var totalSize: Int { get }
    var isLast: Bool { get }
    var isRefresh: Bool { get }
    var isPresentedFilterPage: Bool { get }
    var isPresentedMyPage: Bool { get }
    var isPresntedExit: Bool { get }
    var isPresentedAuthentification: Bool { get }
    var isPresentedMyInfoBottomSheet: Bool { get }
    var content: [SingleStudentEntity] { get }
    var selectedUserID: String? { get }
    var currentUserRole: UserRoleType { get }
    var filterOption: FilterOption? { get }
}

protocol MainActionProtocol: AnyObject {
    func updatePage(page: Int)
    func updateTotalSize(totalSize: Int)
    func updateIsLast(isLast: Bool)
    func updateIsPresentedFilterPage(isPresented: Bool)
    func updateIsPresentedMypage(isPresented: Bool)
    func updateIsPresentedExitDialog(isPresented: Bool)
    func updateIsPresentedMyInfoBottomSheet(isPresented: Bool)
    func updateIsPresentedAuthentification(isPresented: Bool)
    func appendContent(content: [SingleStudentEntity])
    func updateContent(content: [SingleStudentEntity])
    func updateIsRefresh(isRefresh: Bool)
    func updateSelectedUserID(userID: String?)
    func updateUserRole(role: UserRoleType)
    func updateFilterOption(filterOpion: FilterOption?)
}
