import AuthDomainInterface
import SigninFeatureInterface

struct SiginFactoryImpl: signinfa {
    private let loginUseCase: any LoginUseCase

    init(loginUseCase: any LoginUseCase) {
        self.loginUseCase = loginUseCase
    }

    func make
}
