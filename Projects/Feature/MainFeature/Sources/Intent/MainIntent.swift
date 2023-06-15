import AuthDomainInterface
import Combine
import MainFeatureInterface
import StudentDomainInterface
import UserDomainInterface

final class MainIntent: MainIntentProtocol {
    private weak var model: (any MainActionProtocol)?
    private weak var mainDelegate: (any MainDelegate)?
    private let fetchStudentListUseCase: any FetchStudentListUseCase
    private let logoutUseCase: any LogoutUseCase
    private let withdrawalUseCase: any WithdrawalUseCase
    private let loadUserRoleUseCase: any LoadUserRoleUseCase

    init(
        model: any MainActionProtocol,
        mainDelegate: any MainDelegate,
        fetchStudentListUseCase: any FetchStudentListUseCase,
        logoutUseCase: any LogoutUseCase,
        withdrawalUseCase: any WithdrawalUseCase,
        loadUserRoleUseCase: any LoadUserRoleUseCase
    ) {
        self.mainDelegate = mainDelegate
        self.model = model
        self.fetchStudentListUseCase = fetchStudentListUseCase
        self.logoutUseCase = logoutUseCase
        self.withdrawalUseCase = withdrawalUseCase
        self.loadUserRoleUseCase = loadUserRoleUseCase

        model.updateUserRole(role: loadUserRoleUseCase.execute())
    }

    func reachedBottom(page: Int, isLast: Bool) {
        guard !isLast else { return }
        Task {
            let studentList = try await fetchStudentListUseCase.execute(req: .init(page: page, size: 20, techStacks: ["swift"], salarySort: .asc))
            model?.appendContent(content: studentList.studentList)
            model?.updateTotalSize(totalSize: studentList.totalSize)
            model?.updatePage(page: page + 1)
            model?.updateIsLast(isLast: studentList.isLast)
        }
    }

    func existActionSheetIsRequired() {
        model?.updateIsPresentedExistActionSheet(isPresented: true)
    }

    func existActionSheetDismissed() {
        model?.updateIsPresentedExistActionSheet(isPresented: false)
    }

    func logoutDialogIsRequired() {
        model?.updateIsPresentedLogoutDialog(isPresented: true)
    }

    func logoutDialogDismissed() {
        model?.updateIsPresentedLogoutDialog(isPresented: false)
    }

    func logoutDialogIsComplete() {
        Task {
            do {
                try await logoutUseCase.execute()
                mainDelegate?.logout()
            } catch {
                model?.updateIsError(isError: true)
            }
        }
        model?.updateIsPresentedLogoutDialog(isPresented: false)
    }

    func withdrawalDialogIsRequired() {
        model?.updateIsPresentedWithdrawalDialog(isPresented: true)
    }

    func withdrawalDialogDismissed() {
        model?.updateIsPresentedWithdrawalDialog(isPresented: false)
    }

    func withdrawalDialogIsComplete() {
        Task {
            do {
                try await withdrawalUseCase.execute()
                mainDelegate?.logout()
            } catch {
                model?.updateIsError(isError: true)
            }
        }
        model?.updateIsPresentedWithdrawalDialog(isPresented: false)
    }

    func studentDidSelect(userID: String) {
        model?.updateSelectedUserID(userID: userID)
    }

    func studentDetailDismissed() {
        model?.updateSelectedUserID(userID: nil)
    }
}
