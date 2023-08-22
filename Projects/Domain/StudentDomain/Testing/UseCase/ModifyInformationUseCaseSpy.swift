import StudentDomainInterface

final class ModifyInformationUseCaseSpy: ModifyInformationUseCase {
    var executeCallCount = 0
    func execute(req: ModifyStudentInformationRequestDTO) async throws {
        executeCallCount += 1
    }
}
