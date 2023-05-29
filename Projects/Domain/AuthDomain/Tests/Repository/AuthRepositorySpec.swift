import AuthDomainInterface
import Foundation
import Nimble
import Quick
@testable import AuthDomain
@testable import AuthDomainTesting

final class AuthRepositorySpec: QuickSpec {
    override func spec() {
        var remoteAuthDataSourceSpy: RemoteAuthDataSourceSpy!
        var authRepositoryImpl: AuthRepositoryImpl!

        beforeEach {
            remoteAuthDataSourceSpy = RemoteAuthDataSourceSpy()
            authRepositoryImpl = AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSourceSpy)
        }

        describe("AuthRepositoryImpl에서") {
            context("code를 비운상태로 login을 실행하면") {
                it("AuthDomainError.failedToGAuthSignin error가 throw되고, loginCallCount가 +1 된다.") {
                    await expect { try await authRepositoryImpl.login(code: "") }
                        .to(throwError(AuthDomainError.failedToGAuthSignin))

                    expect { remoteAuthDataSourceSpy.loginCallCount }
                        .to(equal(1))
                }
            }

            context("code를 정상적으로 보내면서 login을 실행하면") {
                it("아무 에러도 나지 않고, loginCallCount가 +1 된다.") {
                    await expect { try await authRepositoryImpl.login(code: UUID().uuidString) }
                        .toNot(throwError())

                    expect { remoteAuthDataSourceSpy.loginCallCount }
                        .to(equal(1))
                }
            }
        }
    }
}
