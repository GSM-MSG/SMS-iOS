public protocol StudentDomainBuildable {
    var inputInformationUseCase: any InputInformationUseCase { get }
    var studentRepository: any StudentRepository { get }
}