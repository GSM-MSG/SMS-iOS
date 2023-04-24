protocol SigninStateProtocol {
    var code: String { get }
    var isError: Bool { get }
}

protocol SigninActionProtocol: AnyObject {
    func onApper()
    func signin(code: String)
    func updateIsError(isError: Bool)
}
