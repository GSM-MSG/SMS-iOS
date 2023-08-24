import AuthDomainInterface

final class WithdrawalUseCaseSpy: WithdrawalUseCase {
    var executeCallCount = 0
    var executeHandler: () async throws -> Void = {}

    func execute() async throws {
        executeCallCount += 1
        try await executeHandler()
    }
}
