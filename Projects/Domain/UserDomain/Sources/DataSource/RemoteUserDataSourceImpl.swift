import BaseDomain
import UserDomainInterface

final class RemoteUserDataSourceImpl: BaseRemoteDataSource<UserEndpoint>, RemoteUserDataSource {
    func fetchMyMiniProfile() async throws -> String {
        try await request(.fetchMyMiniProfile, dto: FetchMyMiniProfileResponseDTO.self)
            .profileImageURL
    }
}
