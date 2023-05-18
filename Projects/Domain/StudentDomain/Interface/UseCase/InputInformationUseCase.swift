import Foundation

public protocol InputInformationUseCase {
    func execute(req: InputStudentInformationRequestDTO) async throws
}
