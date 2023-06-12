import Foundation

public protocol TechStackDomainBuildable {
    var techStackRepository: any TechStackRepository { get }
    var fetchTechStackListUseCase: any FetchTechStackListUseCase { get }
}
