import BaseDomain
import Foundation
import TechStackDomainInterface

final class RemoteTechStackDataSourceImpl:
    BaseRemoteDataSource<TechStackEndpoint>,
    RemoteTechStackDataSource {
    func fetchTechStackList(keyword: String) async throws -> [String] {
        try await request(.fetchTechStackList(keyword: keyword), dto: FetchTechStackListResponseDTO.self)
            .techStack
    }
}
