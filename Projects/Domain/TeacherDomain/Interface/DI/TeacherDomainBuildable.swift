public protocol TeacherDomainBuildable {
    var commonSignupUseCase: any CommonSignupUseCase { get }
    var principalSignupUseCase: any PrincipalSignupUseCase { get }
    var deputyPrincipalSignupUseCase: any DeputyPrincipalSignupUseCase { get }
    var directorSignupUseCase: any DirectorSignupUseCase { get }
    var homeRoomSignupUseCase: any HomeRoomSignupUseCase { get }
    var teacherRepository: any TeacherRepository { get }
}
