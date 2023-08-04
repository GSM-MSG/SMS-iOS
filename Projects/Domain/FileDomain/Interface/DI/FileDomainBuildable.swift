public protocol FileDomainBuildable {
    var imageUploadUseCase: any ImageUploadUseCase { get }
    var fileRepository: any FileRepository { get }
}
