protocol SigninStateProtocol {
    var isError: Bool { get }
    var isSuccess: Bool { get }
}

protocol SigninActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updateIsSuccess(isSuccess: Bool)
}
