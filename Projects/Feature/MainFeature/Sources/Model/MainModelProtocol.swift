protocol MainStateProtocol {
    var isError: Bool { get }
    var isSuccess: Bool { get }
}

protocol MainActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updateIsSuccess(isSuccess: Bool)
}
