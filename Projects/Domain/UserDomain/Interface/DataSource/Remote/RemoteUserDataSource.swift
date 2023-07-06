public protocol RemoteUserDataSource {
    func fetchMyMiniProfile() async throws -> String
}
