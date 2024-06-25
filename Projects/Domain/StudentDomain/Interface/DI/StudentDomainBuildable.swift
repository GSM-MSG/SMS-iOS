public protocol StudentDomainBuildable {
    var inputInformationUseCase: any InputInformationUseCase { get }
    var studentRepository: any StudentRepository { get }
    var fetchStudentListUseCase: any FetchStudentListUseCase { get }
    var fetchStudentDetailUseCase: any FetchStudentDetailUseCase { get }
    var modifyInformationUseCase: any ModifyInformationUseCase { get }
    var createPortfolioLinkUseCase: any CreatePortfolioLinkUseCase { get }
}
