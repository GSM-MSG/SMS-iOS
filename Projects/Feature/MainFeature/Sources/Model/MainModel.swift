import Foundation
import StudentDomainInterface
import UserDomainInterface

// swiftlint: disable identifier_name
final class MainModel: ObservableObject, MainStateProtocol {
    @Published var page: Int = 1
    @Published var totalSize: Int = 0
    @Published var isLast: Bool = false
    @Published var isRefresh: Bool = false

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
                        techStacks: $0.techStacks
                    )
                }
        }
    }
    @Published var _content: [SingleStudentEntity] = []
    @Published var isPresentedFilterPage: Bool = false
    @Published var isPresentedMyPage: Bool = false
    @Published var isPresentedMyInfoBottomSheet: Bool = false
    @Published var isPresentedAuthentification: Bool = false
    @Published var isPresntedExit: Bool = false
    @Published var selectedUserID: String?
    @Published var currentUserRole: UserRoleType = .guest
    @Published var filterOption: FilterOption?
}
// swiftlint: enable identifier_name

extension MainModel: MainActionProtocol {
    func updatePage(page: Int) {
        self.page = page
    }

    func updateTotalSize(totalSize: Int) {
        self.totalSize = totalSize
    }

    func updateIsLast(isLast: Bool) {
        self.isLast = isLast
    }

    func updateIsPresentedFilterPage(isPresented: Bool) {
        self.isPresentedFilterPage = isPresented
    }

    func updateIsPresentedMypage(isPresented: Bool) {
        self.isPresentedMyPage = isPresented
    }

    func updateIsPresentedExitDialog(isPresented: Bool) {
        self.isPresntedExit = isPresented
    }

    func updateIsPresentedMyInfoBottomSheet(isPresented: Bool) {
        self.isPresentedMyInfoBottomSheet = isPresented
    }

    func updateIsPresentedAuthentification(isPresented: Bool) {
        self.isPresentedAuthentification = isPresented
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
