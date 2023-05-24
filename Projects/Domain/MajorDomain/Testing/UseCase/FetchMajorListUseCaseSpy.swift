import MajorDomainInterface

final class FetchMajorListUseCaseSpy: FetchMajorListUseCase {
    var executeCallCount = 0
    func execute() async throws -> [String] {
        executeCallCount += 1
        return [
            "A",
            "B",
            "C"
        ]
    }
}
