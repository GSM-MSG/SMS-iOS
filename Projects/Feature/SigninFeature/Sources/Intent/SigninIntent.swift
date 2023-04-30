import Combine
import AuthDomainInterface

final class SigninIntent: SigninIntentProtocol {
    private let loginUseCase: any LoginUseCase
    private weak var model: (any SigninActionProtocol)?

    init(
        loginUseCase: any LoginUseCase,
        model: any SigninActionProtocol
    ) {
        self.loginUseCase = loginUseCase
        self.model = model
    }

    func signin(code: String) {
        Task {
            do {
                try await loginUseCase.execute(code: code)
            } catch {
                model?.updateIsError(isError: true)
            }
        }
    }
}
