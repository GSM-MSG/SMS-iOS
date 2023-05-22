public protocol MajorDomainBuildable {
    var fetchListUseCase: any FetchListUseCase { get }
    var majorRepository: any MajorRepository { get }
}
