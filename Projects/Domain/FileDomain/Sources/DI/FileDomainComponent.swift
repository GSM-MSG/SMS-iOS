import NeedleFoundation
import FileDomainInterface
import JwtStoreInterface

public protocol FileDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class FileDomainComponent: Component<FileDomainDependency>, FileDomainBuildable {
    public var dreamBookUploadUseCase: any DreamBookUploadUseCase {
        DreamBookUploadUseCaseImpl(fileRepository: fileRepository)
    }
    public var fileRepository: any FileRepository {
        FileRepositoryImpl(remoteFileDataSource: remoteFileDataSource)
    }
    var remoteFileDataSource: any RemoteFileDataSource {
        RemoteFileDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
