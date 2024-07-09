public protocol FileDomainBuildable {
    var imageUploadUseCase: any ImageUploadUseCase { get }
    var fileUploadUseCase: any FileUploadUseCase { get }
    var fileRepository: any FileRepository { get }
}
