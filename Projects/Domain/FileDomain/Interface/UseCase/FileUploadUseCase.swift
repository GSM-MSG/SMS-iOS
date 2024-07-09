import Foundation

public protocol FileUploadUseCase {
    func execute(file: Data, fileName: String) async throws -> String
}
