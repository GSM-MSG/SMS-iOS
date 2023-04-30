protocol SigninStateProtocol {
    var code: String { get }
    var isError: Bool { get }
    var isSuccess: Bool { get }
}

protocol SigninActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updateIsSuccess(isSuccess: Bool)
}
