import Foundation
import UserDomainInterface
import StudentDomainInterface
import EventLimiter

final class StudentDetailIntent: StudentDetailIntentProtocol {
    private let userID: String
    private weak var model: (any StudentDetailActionProtocol)?
    private let loadUserRoleUseCase: any LoadUserRoleUseCase
    private let fetchStudentDetailUseCase: any FetchStudentDetailUseCase
    private let throttler = Throttler(for: 1)

    init(
        userID: String,
        model: any StudentDetailActionProtocol,
        loadUserRoleUseCase: any LoadUserRoleUseCase,
        fetchStudentDetailUseCase: any FetchStudentDetailUseCase
    ) {
        self.userID = userID
        self.model = model
        self.loadUserRoleUseCase = loadUserRoleUseCase
        self.fetchStudentDetailUseCase = fetchStudentDetailUseCase
    }

    func onAppear() {
        let userRole = loadUserRoleUseCase.execute()
        model?.updateUserRole(role: userRole)
        model?.updateIsLoading(isLoading: true)

        Task(priority: .userInitiated) {
            defer { model?.updateIsLoading(isLoading: false)}
            do {
                let studentDetailEntity = try await self.fetchStudentDetailUseCase.execute(
                    userID: userID,
                    viewee: userRole.toDetailViewTpye
                )
                model?.updateStudentDetailEntity(entity: studentDetailEntity)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func dreamBookDownloadButtonDidTap(dreamBookFileURL: String) {
        guard let url = URL(string: dreamBookFileURL) else { return }
        throttler {
            self.model?.updateIsDownloading(isDownloading: true)
            Task(priority: .background) {
                do {
                    let (dreamBookFileData, _) = try await URLSession.shared.data(from: url)
                    let hwpDocument = HWPDocument(hwpData: dreamBookFileData)
                    self.model?.updateHWPDocument(hwpDocument: hwpDocument)
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    self.model?.updateIsDownloading(isDownloading: false)
                    self.model?.updateIsPresentedDreamBookExporter(isPresented: true)
                } catch {
                    self.model?.updateIsDownloading(isDownloading: false)
                }
            }
        }
    }

    deinit {
        print("DEIIN")
    }

    func dreamBookFileExporterDismissed() {
        model?.updateIsPresentedDreamBookExporter(isPresented: false)
    }
}

private extension UserRoleType {
    var toDetailViewTpye: FetchStudentDetailViewType {
        switch self {
        case .guest: return .guest
        case .student: return .student
        case .teacher: return .teacher
        }
    }
}
