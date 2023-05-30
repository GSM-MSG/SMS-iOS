protocol FilterStateProtocol {
    var isError: Bool { get }
    var isSuccess: Bool { get }
}

protocol FilterActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updateIsSuccess(isSuccess: Bool)
}
