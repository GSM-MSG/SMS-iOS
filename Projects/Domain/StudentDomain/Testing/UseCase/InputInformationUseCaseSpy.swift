import StudentDomainInterface

final class InputInformationUseCaseSpy: InputInformationUseCase {
    var executeCallCount = 0
    func execute(req: InputStudentInformationRequestDTO) async throws {
        executeCallCount += 1
    }
}
