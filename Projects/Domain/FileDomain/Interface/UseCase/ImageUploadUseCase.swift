import Foundation

public protocol ImageUploadUseCase {
    func execute(image: Data, fileName: String) async throws -> String
}
