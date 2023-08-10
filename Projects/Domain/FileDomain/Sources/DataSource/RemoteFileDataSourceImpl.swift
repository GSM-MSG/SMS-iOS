import FileDomainInterface
import Foundation
import BaseDomain

final class RemoteFileDataSourceImpl: BaseRemoteDataSource<FileEndpoint>, RemoteFileDataSource {
    func imageUpload(image: Data, fileName: String) async throws -> String {
        try await request(
            .imageUpload(image: image, fileName: fileName),
            dto: ImageUploadResponseDTO.self
        )
        .fileURL
    }
}
