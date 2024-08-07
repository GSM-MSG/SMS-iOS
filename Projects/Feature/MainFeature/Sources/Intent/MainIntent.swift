import FilterFeatureInterface
import MyPageFeatureInterface
import Combine
import MainFeatureInterface
import StudentDomainInterface
import UserDomainInterface

final class MainIntent: MainIntentProtocol {
    private weak var model: (any MainActionProtocol)?
    private weak var mainDelegate: (any MainDelegate)?
    private let fetchStudentListUseCase: any FetchStudentListUseCase
    private let loadUserRoleUseCase: any LoadUserRoleUseCase

    init(
        model: any MainActionProtocol,
        mainDelegate: any MainDelegate,
        fetchStudentListUseCase: any FetchStudentListUseCase,
        loadUserRoleUseCase: any LoadUserRoleUseCase
    ) {
        self.mainDelegate = mainDelegate
        self.model = model
        self.fetchStudentListUseCase = fetchStudentListUseCase
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

    func filterIsRequired() {
        model?.updateIsPresentedFilterPage(isPresented: true)
    }

    func filterDismissed() {
        model?.updateIsPresentedFilterPage(isPresented: false)
    }

    func myPageIsRequired() {
        model?.updateIsPresentedMypage(isPresented: true)
    }

    func myPageDismissed() {
        model?.updateIsPresentedMypage(isPresented: false)
    }

    func studentDidSelect(userID: String) {
        model?.updateSelectedUserID(userID: userID)
    }

    func studentDetailDismissed() {
        model?.updateSelectedUserID(userID: nil)
    }

    func logout() {
        mainDelegate?.logout()
    }

    func exitIsRequired() {
        model?.updateIsPresentedExitDialog(isPresented: true)
    }

    func exitIsDismissed() {
        model?.updateIsPresentedExitDialog(isPresented: false)
    }

    func myInfoBottomSheetIsRequired() {
        model?.updateIsPresentedMyInfoBottomSheet(isPresented: true)
    }

    func myInfoBottomSheetIsDismissed() {
        model?.updateIsPresentedMyInfoBottomSheet(isPresented: false)
    }

    func authentificationPageIsRequired() {
        model?.updateIsPresentedAuthentification(isPresented: true)
    }

    func authentificationPageIsDismissed() {
        model?.updateIsPresentedAuthentification(isPresented: false)
    }
}

extension MainIntent: FilterDelegate {
    func filterDidCompleted(filterOption: FilterOptionDTO?) {
        model?.updateFilterOption(filterOpion: .init(dto: filterOption ?? .init()))
        model?.updatePage(page: 1)
        self.refresh(filterOption: .init(dto: filterOption ?? .init()))
    }
}

extension MainIntent: MyPageDelegate {
    func completeModify() {
        self.refresh(filterOption: .init(dto: .init()))
    }
}
