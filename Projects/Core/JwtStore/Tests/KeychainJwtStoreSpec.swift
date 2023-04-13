import JwtStoreInterface
import KeychainModuleTesting
import Nimble
@testable import JwtStore
import Quick

final class KeychainJwtStoreSpec: QuickSpec {
    // swiftlint: disable function_body_length
    override func spec() {
        var fakeKeychain: FakeKeychain!
        var sut: KeychainJwtStore!

        beforeEach {
            fakeKeychain = FakeKeychain()
            sut = KeychainJwtStore(keychain: fakeKeychain)
        }
        describe("KeychainJwtStore에서") {
            context("accessToken에 'asdf'를 save를 하면") {
                it("keychain에 '\(JwtStoreProperty.accessToken.rawValue)'에 'asdf'가 save된다") {
                    sut.save(property: .accessToken, value: "asdf")
                    let storedProperty = fakeKeychain.store[JwtStoreProperty.accessToken.rawValue]
                    expect { storedProperty }.to(equal("asdf"))
                }
            }

            context("refreshToken에 'asdf'를 save를 하면") {
                it("keychain에 '\(JwtStoreProperty.refreshToken.rawValue)'에 'asdf'가 save된다") {
                    sut.save(property: .refreshToken, value: "asdf")
                    let storedProperty = fakeKeychain.store[JwtStoreProperty.refreshToken.rawValue]
                    expect { storedProperty }.to(equal("asdf"))
                }
            }

            context("accessExpiresAt에 'asdf'를 save를 하면") {
                it("keychain에 '\(JwtStoreProperty.accessExpiresAt.rawValue)'에 'asdf'가 save된다") {
                    sut.save(property: .accessExpiresAt, value: "asdf")
                    let storedProperty = fakeKeychain.store[JwtStoreProperty.accessExpiresAt.rawValue]
                    expect { storedProperty }.to(equal("asdf"))
                }
            }

            context("refreshExpiresAt에 'asdf'를 save를 하면") {
                it("keychain에 '\(JwtStoreProperty.refreshExpiresAt.rawValue)'에 'asdf'가 save된다") {
                    sut.save(property: .refreshExpiresAt, value: "asdf")
                    let storedProperty = fakeKeychain.store[JwtStoreProperty.refreshExpiresAt.rawValue]
                    expect { storedProperty }.to(equal("asdf"))
                }
            }

            context("accessToken에 'fdsa'를 save하고 load하면") {
                it("load한 값은 'fdsa'다") {
                    sut.save(property: .accessToken, value: "fdsa")
                    let loadedData = sut.load(property: .accessToken)
                    expect { loadedData }.to(equal("fdsa"))
                }
            }

            context("refreshTOken에 'fdsa'를 save하고 load하면") {
                it("load한 값은 'fdsa'다") {
                    sut.save(property: .refreshToken, value: "fdsa")
                    let loadedData = sut.load(property: .refreshToken)
                    expect { loadedData }.to(equal("fdsa"))
                }
            }

            context("accessExpiresAt에 'fdsa'를 save하고 load하면") {
                it("load한 값은 'fdsa'다") {
                    sut.save(property: .accessExpiresAt, value: "fdsa")
                    let loadedData = sut.load(property: .accessExpiresAt)
                    expect { loadedData }.to(equal("fdsa"))
                }
            }

            context("refreshExpiresAt에 'fdsa'를 save하고 load하면") {
                it("load한 값은 'fdsa'다") {
                    sut.save(property: .refreshExpiresAt, value: "fdsa")
                    let loadedData = sut.load(property: .refreshExpiresAt)
                    expect { loadedData }.to(equal("fdsa"))
                }
            }

            context("accessToken에 'asdf'를 save를 하고 delete를 하면") {
                it("load한 값은 ''다") {
                    sut.save(property: .accessToken, value: "asdf")
                    expect { sut.load(property: .accessToken) }.to(equal("asdf"))
                    sut.delete(property: .accessToken)
                    expect { sut.load(property: .accessToken) }.to(equal(""))
                }
            }

            context("refreshToken에 'asdf'를 save를 하고 delete를 하면") {
                it("load한 값은 ''다") {
                    sut.save(property: .refreshToken, value: "asdf")
                    expect { sut.load(property: .refreshToken) }.to(equal("asdf"))
                    sut.delete(property: .refreshToken)
                    expect { sut.load(property: .refreshToken) }.to(equal(""))
                }
            }

            context("accessExpiresAt에 'asdf'를 save를 하고 delete를 하면") {
                it("load한 값은 ''다") {
                    sut.save(property: .accessExpiresAt, value: "asdf")
                    expect { sut.load(property: .accessExpiresAt) }.to(equal("asdf"))
                    sut.delete(property: .accessExpiresAt)
                    expect { sut.load(property: .accessExpiresAt) }.to(equal(""))
                }
            }

            context("refreshExpiresAt에 'asdf'를 save를 하고 delete를 하면") {
                it("load한 값은 ''다") {
                    sut.save(property: .refreshExpiresAt, value: "asdf")
                    expect { sut.load(property: .refreshExpiresAt) }.to(equal("asdf"))
                    sut.delete(property: .refreshExpiresAt)
                    expect { sut.load(property: .refreshExpiresAt) }.to(equal(""))
                }
            }
        }
    }
}
