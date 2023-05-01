import Foundation

final class SigninModel: ObservableObject, SigninStateProtocol {
    @Published var isError: Bool = false
    @Published var isSuccess: Bool = false
}

extension SigninModel: SigninActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updateIsSuccess(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
}
