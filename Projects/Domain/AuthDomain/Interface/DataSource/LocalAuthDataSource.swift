import Foundation

public protocol LocalAuthDataSource {
    func logout() async throws
    func withdrawal() async throws
    func clearToken()
}
