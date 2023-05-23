public protocol MajorDomainBuildable {
    var fetchMajorListUseCase: any FetchMajorListUseCase { get }
    var majorRepository: any MajorRepository { get }
}
