import Foundation
import UserDomainInterface

final class StudentDetailIntent: StudentDetailIntentProtocol {
    private weak var model: (any StudentDetailActionProtocol)?
    private let loadUserRoleUseCase: any LoadUserRoleUseCase

    init(
        model: any StudentDetailActionProtocol,
        loadUserRoleUseCase: any LoadUserRoleUseCase
    ) {
        self.model = model
        self.loadUserRoleUseCase = loadUserRoleUseCase
    }

    func onAppear() {
        let userRole = loadUserRoleUseCase.execute()
        model?.updateUserRole(role: userRole)
    }
}
