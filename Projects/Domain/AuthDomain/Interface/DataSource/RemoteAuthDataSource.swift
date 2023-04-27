import Foundation

protocol RemoteAuthDataSource {
    func login(code: String) async throws
}
