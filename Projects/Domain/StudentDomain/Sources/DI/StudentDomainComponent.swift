import NeedleFoundation
import StudentDomainInterface
import JwtStoreInterface

public protocol StudentDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class StudentDomainComponent: Component<StudentDomainDependency>, StudentDomainBuildable {
    public var inputInformationUseCase: any InputInformationUseCase {
        InputInformationCaseImpl(studentRepository: studentRepository)
    }
    public var fetchStudentListUseCase: any FetchStudentListUseCase {
        FetchStudentListUseCaseImpl(studentRepository: studentRepository)
    }
    public var fetchStudentDetailUseCase: any FetchStudentDetailUseCase {
        FetchStudentDetailUseCaseImpl(studentRepository: studentRepository)
    }
    public var modifyInformationUseCase: any ModifyInformationUseCase {
        ModifyInformationUseCaseImpl(studentRepository: studentRepository)
    }
    public var createPortfolioLinkUseCase: any CreatePortfolioLinkUseCase {
        CreatePortfolioLinkUseCaseImpl(studentRepository: studentRepository)
    }
    public var studentRepository: any StudentRepository {
        StudentRepositoryImpl(remoteStudentDataSource: remoteStudentDataSource)
    }
    var remoteStudentDataSource: any RemoteStudentDataSource {
        RemoteStudentDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
