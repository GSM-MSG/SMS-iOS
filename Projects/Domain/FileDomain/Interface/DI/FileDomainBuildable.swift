public protocol FileDomainBuildable {
    var dreamBookUploadUseCase: any DreamBookUploadUseCase { get }
    var imageUploadUseCase: any ImageUploadUseCase { get }
    var fileRepository: any FileRepository { get }
}
