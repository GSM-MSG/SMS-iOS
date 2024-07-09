import FileDomainInterface
import Foundation

public final class FileUploadUseCaseSpy: FileUploadUseCase {
    var executeCallCount = 0
    public func execute(file: Data, fileName: String) async throws -> String {
        executeCallCount += 1
        return "A"
    }
    public init(executeCallCount: Int = 0) {
        self.executeCallCount = executeCallCount
    }
}
