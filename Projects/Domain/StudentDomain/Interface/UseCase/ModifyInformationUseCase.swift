import Foundation

public protocol ModifyInformationUseCase {
    func execute(req: ModifyStudentInformationRequestDTO) async throws
}
