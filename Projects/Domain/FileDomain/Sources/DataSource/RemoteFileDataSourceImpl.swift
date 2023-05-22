import FileDomainInterface
import Foundation
import BaseDomain

final class RemoteFileDataSourceImpl: BaseRemoteDataSource<FileEndpoint>, RemoteFileDataSource {
    func dreamBookUpload(file: Data, fileName: String) async throws -> String {
        try await request(.dreamBookUpload(file: file), dto: DreamBookUploadResponseDTO.self).fileURL
    }
}
