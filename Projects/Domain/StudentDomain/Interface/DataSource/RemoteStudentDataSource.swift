import Foundation

public protocol RemoteStudentDataSource {
    func inputInformation(req: StudentRequestDTO) async throws
}
