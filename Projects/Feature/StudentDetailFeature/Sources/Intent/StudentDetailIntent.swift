import Foundation
import UserDomainInterface
import StudentDomainInterface

final class StudentDetailIntent: StudentDetailIntentProtocol {
    private let userID: String
    private weak var model: (any StudentDetailActionProtocol)?
    private let loadUserRoleUseCase: any LoadUserRoleUseCase
    private let fetchStudentDetailUseCase: any FetchStudentDetailUseCase

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
