import Foundation

public protocol InputInformationUseCase {
    func execute(req: StudentRequestDTO) async throws
}
