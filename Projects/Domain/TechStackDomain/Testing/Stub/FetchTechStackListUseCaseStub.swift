import TechStackAppendFeatureInterface

public struct FetchTechStackListUseCaseStub: FetchTechStackListUseCase {
    public init() {}

    public func execute(keyword: String) async throws -> [String] {
        return ["Swift", "Kotlin", "Java", "JavaScript", "PHP", "Ruby", "Go", "Python", "Objective-C"]
}
