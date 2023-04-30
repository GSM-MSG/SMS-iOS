import AuthDomainInterface
import Foundation
import Nimble
import Quick
@testable import AuthDomain
@testable import AuthDomainTesting

final class LoginUseCaseSpec: QuickSpec {
    override func spec() {
        var loginUseCase: LoginUseCaseImpl!
        var authRepositorySpy: AuthRepositorySpy!

        beforeEach {
            authRepositorySpy = AuthRepositorySpy()
            loginUseCase = LoginUseCaseImpl(authRepository: authRepositorySpy)
        }

        describe("LoginUseCase에서") {
            context("code를 비운상태로 execute을 실행하면") {
                it("AuthDomainError.invalidGAuthCode error가 throw되고, callCount가 +1 된다.") {
                    await expect { try await loginUseCase.execute(code: "") }
                        .to(throwError(AuthDomainError.invalidGAuthCode))

                    expect { authRepositorySpy.loginCallCount }
                        .to(equal(1))
                }
            }

            context("code를 정상적으로 보내면서 execute을 실행하면") {
                it("아무 에러도 나지 않고, callCount가 +1 된다.") {
                    await expect { try await authRepositorySpy.login(code: UUID().uuidString) }
                        .toNot(throwError())

                    expect { authRepositorySpy.loginCallCount }
                        .to(equal(1))
                }
            }
        }
    }
}
