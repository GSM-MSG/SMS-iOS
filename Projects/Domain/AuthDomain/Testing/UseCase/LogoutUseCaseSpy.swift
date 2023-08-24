import AuthDomainInterface

final class LogoutUseCaseSpy: LogoutUseCase {
    var executeCallCount = 0
    var executeHandler: () async throws -> Void = {}

    func execute() async throws {
        executeCallCount += 1
        try await executeHandler()
    }
}
