import Foundation

public protocol StudentUseCase {
    func execute(req: StudentRequestDTO) async throws
}
