import Foundation

public protocol StudentRepository {
    func inputInformation(req: InputStudentInformationRequestDTO) async throws
}
