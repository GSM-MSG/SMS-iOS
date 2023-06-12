import Foundation
import NeedleFoundation
import TechStackDomainInterface
import JwtStoreInterface

public protocol TechStackDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class TechStackDomainComponent: Component<TechStackDomainDependency>, TechStackDomainBuildable {
    public var fetchTechStackListUseCase: any FetchTechStackListUseCase {
        FetchTechStackListUseCaseImpl(techStackRepository: techStackRepository)
    }
    public var techStackRepository: any TechStackRepository {
        TechStackRepositoryImpl(remoteTechStackDataSource: remoteTechStackDataSource)
    }
    var remoteTechStackDataSource: any RemoteTechStackDataSource {
        RemoteTechStackDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
