public protocol StudentDomainBuildable {
    var inputInformationUseCase: any InputInformationUseCase { get }
    var studentRepository: any StudentRepository { get }
    var fetchStudentListUseCase: any FetchStudentListUseCase { get }
    var fetchStudentDetailUSeCase: any FetchStudentDetailUseCase { get }
    var modifyInformationUseCase: any ModifyInformationUseCase { get }
}
