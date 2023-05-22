import FileDomainInterface
import Foundation
import BaseDomain

final class RemoteFileDataSourceImpl: BaseRemoteDataSource<FileEndpoint>, RemoteFileDataSource {
    func dreamBookUpload(file: Data) async throws -> String {
        try await request(.dreamBookUpload(file: file), dto: DreamBookUploadResponseDTO.self).fileUrl
    }
}
