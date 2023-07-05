import Foundation
import StudentDomainInterface
import UserDomainInterface

// swiftlint: disable identifier_name
final class MainModel: ObservableObject, MainStateProtocol {
    @Published var page: Int = 1
    @Published var totalSize: Int = 0
    @Published var isLast: Bool = false
    @Published var isError: Bool = false
    @Published var isRefresh: Bool = false
    @Published var isPresentedExistActionSheet: Bool = false
    @Published var isPresentedLogoutDialog: Bool = false
    @Published var isPresentedWithdrawalDialog: Bool = false
    var content: [SingleStudentEntity] {
        get { _content }
        set {
            _content = newValue
                .map {
                    SingleStudentEntity(
                        id: $0.id,
                        profileImageURL: $0.profileImageURL,
                        name: $0.name.replacingOccurrences(of: "**", with: "소금"),
                        major: $0.major,
                        techStack: $0.techStack
                    )
                }
        }
    }
    @Published var _content: [SingleStudentEntity] = []
    @Published var isPresentedFilterPage: Bool = false
    @Published var selectedUserID: String?
    @Published var currentUserRole: UserRoleType = .guest
    @Published var filterOption: FilterOption?
}
// swiftlint: enable identifier_name

extension MainModel: MainActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updatePage(page: Int) {
        self.page = page
    }

    func updateTotalSize(totalSize: Int) {
        self.totalSize = totalSize
    }

    func updateIsLast(isLast: Bool) {
        self.isLast = isLast
    }

    func updateIsPresentedExistActionSheet(isPresented: Bool) {
        self.isPresentedExistActionSheet = isPresented
    }

    func updateIsPresentedLogoutDialog(isPresented: Bool) {
        self.isPresentedLogoutDialog = isPresented
    }

    func updateIsPresentedWithdrawalDialog(isPresented: Bool) {
        self.isPresentedWithdrawalDialog = isPresented
    }

    func updateIsPresentedFilterPage(isPresented: Bool) {
        self.isPresentedFilterPage = isPresented
    }

    func appendContent(content: [SingleStudentEntity]) {
        self.content.append(contentsOf: content)
    }

    func updateContent(content: [SingleStudentEntity]) {
        self.content = content
    }

    func updateSelectedUserID(userID: String?) {
        self.selectedUserID = userID
    }

    func updateIsRefresh(isRefresh: Bool) {
        self.isRefresh = isRefresh
    }

    func updateUserRole(role: UserRoleType) {
        self.currentUserRole = role
    }

    func updateFilterOption(filterOpion: FilterOption?) {
        self.filterOption = filterOpion
    }
}
