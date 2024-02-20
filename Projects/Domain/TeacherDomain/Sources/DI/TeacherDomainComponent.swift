import Foundation
import NeedleFoundation
import TeacherDomainInterface
import JwtStoreInterface

public protocol TeacherDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class TeacherDomainComponent: Component<TeacherDomainDependency>, TeacherDomainBuildable {
    public var commonSignupUseCase: any CommonSignupUseCase {
        CommonSignupUseCaseImpl(teacherRepository: teacherRepository)
    }
    
    public var principalSignupUseCase: any PrincipalSignupUseCase {
        PrincipalSignupUseCaseImpl(teacherRepository: teacherRepository)
    }
    
    public var deputyPrincipalSignupUseCase: any DeputyPrincipalSignupUseCase {
        DeputyPrincipalSignupUseCaseImpl(teacherRepository: teacherRepository)
    }
    
    public var directorSignupUseCase: any DirectorSignupUseCase {
        DirectorSignupUseCaseImpl(teacherRepository: teacherRepository)
    }
    
    public var homeRoomSignupUseCase: any HomeRoomSignupUseCase {
        HomeRoomSignupUseCaseImpl(teacherRepository: teacherRepository)
    }
    
    public var teacherRepository: any TeacherRepository {
        TeacherRepositoryImpl(remoteTeacherDataSource: remoteTeacherDataSource)
    }
    
    public var remoteTeacherDataSource: any RemoteTeacherDataSource {
        RemoteTeacherDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
