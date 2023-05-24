import Foundation

public protocol RemoteStudentDataSource {
    func inputInformation(req: InputStudentInformationRequestDTO) async throws
}
