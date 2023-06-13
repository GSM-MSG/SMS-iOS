import AuthDomainInterface
import Combine
import Foundation
import UserDomainInterface
import SigninFeatureInterface

final class SigninIntent: SigninIntentProtocol {
    private weak var model: (any SigninActionProtocol)?
    private weak var signinDelegate: (any SigninDelegate)?
    private let loginUseCase: any LoginUseCase
    private let saveUserRoleUseCase: any SaveUserRoleUseCase
    private let clearTokenUseCase: any ClearTokenUseCase

    init(
        model: any SigninActionProtocol,
        signinDelegate: any SigninDelegate,
        loginUseCase: any LoginUseCase,
        saveUserRoleUseCase: any SaveUserRoleUseCase,
        clearTokenUseCase: any ClearTokenUseCase
    ) {
        self.model = model
        self.signinDelegate = signinDelegate
        self.loginUseCase = loginUseCase
        self.saveUserRoleUseCase = saveUserRoleUseCase
        self.clearTokenUseCase = clearTokenUseCase
    }

    func signin(code: String) {
        Task {
            do {
                let userSignupInfo = try await self.loginUseCase.execute(code: code)
                saveUserRoleUseCase.execute(role: userSignupInfo.userRole)
                signinDelegate?.successToSignin(isAlreadySignUp: userSignupInfo.isAlreadySignup)
            } catch {
                model?.updateIsError(isError: true)
            }
        }
    }

    func guestSigninButtonDidTap() {
        saveUserRoleUseCase.execute(role: .guest)
        clearTokenUseCase.execute()
        signinDelegate?.guestSignin()
    }
}
