public protocol FileDomainBuildable {
    var dreamBookUploadUseCase: any DreamBookUploadUseCase { get }
    var fileRepository: any FileRepository { get }
}
