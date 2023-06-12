import Foundation
import StudentDomainInterface

final class MainModel: ObservableObject, MainStateProtocol {
    @Published var page: Int = 1
    @Published var totalSize: Int = 0
    @Published var isLast: Bool = false
    @Published var isError: Bool = false
    @Published var content: [SingleStudentEntity] =  []
    @Published var selectedUserID: String?
}

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

    func appendContent(content: [SingleStudentEntity]) {
        self.content.append(contentsOf: content)
    }

    func updateSelectedUserID(userID: String?) {
        self.selectedUserID = userID
    }
}
