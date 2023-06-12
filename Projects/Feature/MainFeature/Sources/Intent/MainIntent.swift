import Combine
import MainFeatureInterface
import StudentDomainInterface

final class MainIntent: MainIntentProtocol {
    private weak var model: (any MainActionProtocol)?
    private weak var mainDelegate: (any MainDelegate)?
    private let fetchStudentListUseCase: any FetchStudentListUseCase

    init(
        model: any MainActionProtocol,
        mainDelegate: any MainDelegate,
        fetchStudentListUseCase: any FetchStudentListUseCase
    ) {
        self.mainDelegate = mainDelegate
        self.model = model
        self.fetchStudentListUseCase = fetchStudentListUseCase
    }

    func reachedBottom(page: Int, isLast: Bool) {
        guard !isLast else { return }
        Task {
            let studentList = try await fetchStudentListUseCase.execute(req: .init(page: page, size: 20))
            model?.appendContent(content: studentList.studentList)
            model?.updateTotalSize(totalSize: studentList.totalSize)
            model?.updatePage(page: page + 1)
            model?.updateIsLast(isLast: studentList.isLast)
        }
    }

    func studentDidSelect(userID: String) {
        model?.updateSelectedUserID(userID: userID)
    }

    func studentDetailDismissed() {
        model?.updateSelectedUserID(userID: nil)
    }
}
