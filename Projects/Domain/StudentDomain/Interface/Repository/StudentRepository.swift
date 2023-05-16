import Foundation

public protocol StudentRepository {
    func inputInformation(req: StudentRequestDTO) async throws
}
