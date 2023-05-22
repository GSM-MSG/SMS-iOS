import NeedleFoundation
import MajorDomainInterface
import JwtStoreInterface

public protocol MajorDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class MajorDomainComponent: Component<MajorDomainDependency>, MajorDomainBuildable {
    public var fetchListUseCase: any FetchListUseCase {
        FetchListUseCaseImpl(majorRepository: majorRepository)
    }
    public var majorRepository: any MajorRepository {
        MajorRepositoryImpl(remoteMajorDataSource: remoteMajorDataSource)
    }
    var remoteMajorDataSource: any RemoteMajorDataSource {
        RemoteMajorDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
