public protocol RemoteUserDataSource {
    func fetchMyMiniProfile() async throws -> String
    func fetchMyProfile() async throws -> MyPageEntity
}
