import AuthDomainInterface
import BaseDomain

final class RemoteMajorDataSourceImpl: BaseRemoteDataSource<MajorEndpoint>, RemoteMajorDataSource {
    func fetchList() async throws -> [String] {
        try await request(.fetchList, dto: MajorListResponseDTO.self).major
    }
}
