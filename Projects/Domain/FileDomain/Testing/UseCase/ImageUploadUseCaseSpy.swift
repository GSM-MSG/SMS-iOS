import FileDomainInterface
import Foundation

final class ImageUploadUseCaseSpy: ImageUploadUseCase {
    var executeCallCount = 0
    func execute(image: Data, fileName: String) async throws -> String {
        executeCallCount += 1
        return "A"
    }
}
