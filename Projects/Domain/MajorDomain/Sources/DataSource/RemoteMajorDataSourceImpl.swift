import MajorDomainInterface
import BaseDomain

final class RemoteMajorDataSourceImpl: BaseRemoteDataSource<MajorEndpoint>, RemoteMajorDataSource {
    func fetchMajorList() async throws -> [String] {
        try await request(.fetchMajorList, dto: MajorListResponseDTO.self).major
    }
}
