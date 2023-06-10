import TechStackDomainInterface

public struct FetchTechStackListUseCaseStub: FetchTechStackListUseCase {
    public init() {}

    public func execute(keyword: String) async throws -> [String] {
        ["Swift", "Kotlin", "Java", "JavaScript", "PHP", "Ruby", "Go", "Python", "Objective-C"]
    }
}
