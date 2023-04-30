import Foundation

final class SigninModel: ObservableObject, SigninStateProtocol {
    @Published var code: String = ""
    @Published var isError: Bool = false
}

extension SigninModel: SigninActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }
}
