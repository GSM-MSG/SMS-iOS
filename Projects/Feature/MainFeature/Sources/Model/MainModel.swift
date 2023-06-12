import Foundation
import StudentDomainInterface

final class MainModel: ObservableObject, MainStateProtocol {
    @Published var page: Int = 1
    @Published var totalSize: Int = 0
    @Published var isLast: Bool = false
    @Published var isError: Bool = false
    @Published var isPresentedExistActionSheet: Bool = false
    @Published var isPresentedLogoutDialog: Bool = false
    @Published var isPresentedWithdrawalDialog: Bool = false
    @Published var content: [SingleStudentEntity] =  []
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

    func updateIsPresentedExistActionSheet(isPresented: Bool) {
        self.isPresentedExistActionSheet = isPresented
    }

    func updateIsPresentedLogoutDialog(isPresented: Bool) {
        self.isPresentedLogoutDialog = isPresented
    }

    func updateIsPresentedWithdrawalDialog(isPresented: Bool) {
        self.isPresentedWithdrawalDialog = isPresented
    }

    func appendContent(content: [SingleStudentEntity]) {
        self.content.append(contentsOf: content)
    }
}
