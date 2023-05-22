import Foundation

public protocol DreamBookUploadUseCase {
    func execute(file: Data) async throws -> String
}
