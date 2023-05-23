import Foundation

public protocol DreamBookUploadUseCase {
    func execute(file: Data, fileName: String) async throws -> String
}
