import Combine
import AuthDomainInterface
import SigninFeatureInterface

final class SigninIntent: SigninIntentProtocol {
    private weak var model: (any SigninActionProtocol)?
    private weak var signinDelegate: (any SigninDelegate)?
    private let loginUseCase: any LoginUseCase

    init(
        model: any SigninActionProtocol,
        signinDelegate: any SigninDelegate,
        loginUseCase: any LoginUseCase
    ) {
        self.loginUseCase = loginUseCase
        self.signinDelegate = signinDelegate
        self.model = model
    }

    func signin(code: String) {
        Task {
            do {
                let isAlreadySignup = try await loginUseCase.execute(code: code)
                signinDelegate?.successToSignin(isAlreadySignUp: isAlreadySignup)
            } catch {
                model?.updateIsError(isError: true)
            }
        }
    }
}
