import StudentDomainInterface

public final class FetchStudentDetailUseCaseSpy: FetchStudentDetailUseCase {
    public var executeCallCount = 0

    public init() {}

    public func execute(
        userID: String,
        viewee: FetchStudentDetailViewType
    ) async throws -> StudentDetailEntity {
        executeCallCount += 1
        return .init(
            name: "name",
            introduce: "introduce",
            major: "major",
            profileImageURL: "https://avatars.githubusercontent.com/u/74440939?v=4",
            techStacks: [],
            projects: [],
            prizes: []
        )
    }
}
