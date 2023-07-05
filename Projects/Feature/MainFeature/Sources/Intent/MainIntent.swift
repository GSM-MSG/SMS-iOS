import AuthDomainInterface
import FilterFeatureInterface
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

    func reachedBottom(page: Int, isLast: Bool, filterOption: FilterOption?) {
        Task {
            let req: FetchStudentListRequestDTO
            if let filterOption {
                req = filterOption.toRequestDTO(page: page, size: 20)
            } else {
                req = FetchStudentListRequestDTO(page: page, size: 20)
            }
            let studentList = try await fetchStudentListUseCase.execute(req: req)
            model?.appendContent(content: studentList.studentList)
            model?.updateTotalSize(totalSize: studentList.totalSize)
            model?.updatePage(page: page + 1)
            model?.updateIsLast(isLast: studentList.isLast)
        }
    }

    func refresh(filterOption: FilterOption?) {
        model?.updateIsRefresh(isRefresh: true)
        Task {
            let req: FetchStudentListRequestDTO
            if let filterOption {
                req = filterOption.toRequestDTO(page: 1, size: 20)
            } else {
                req = FetchStudentListRequestDTO(page: 1, size: 20)
            }
            let studentList = try await fetchStudentListUseCase.execute(req: req)
            model?.updateContent(content: studentList.studentList)
            model?.updatePage(page: 2)
            model?.updateTotalSize(totalSize: studentList.totalSize)
            model?.updateIsLast(isLast: false)
            model?.updateIsRefresh(isRefresh: false)
        }
    }

    func existActionSheetIsRequired() {
        model?.updateIsPresentedExistActionSheet(isPresented: true)
    }

    func existActionSheetDismissed() {
        model?.updateIsPresentedExistActionSheet(isPresented: false)
    }

    func filterIsRequired() {
        model?.updateIsPresentedFilterPage(isPresented: true)
    }

    func filterDismissed() {
        model?.updateIsPresentedFilterPage(isPresented: false)
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

extension MainIntent: FilterDelegate {
    func filterDidCompleted(filterOption: FilterOptionDTO?) {
        model?.updateFilterOption(filterOpion: .init(dto: filterOption ?? .init()))
        model?.updatePage(page: 1)
    }
}
