protocol SigninStateProtocol {
    var code: String { get }
    var isError: Bool { get }
}

protocol SigninActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
}
