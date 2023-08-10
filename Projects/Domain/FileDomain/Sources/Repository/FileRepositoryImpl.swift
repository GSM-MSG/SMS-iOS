import FileDomainInterface
import Foundation

struct FileRepositoryImpl: FileRepository {
    private let remoteFileDataSource: any RemoteFileDataSource

    init(remoteFileDataSource: any RemoteFileDataSource) {
        self.remoteFileDataSource = remoteFileDataSource
    }

    func imageUpload(image: Data, fileName: String) async throws -> String {
        try await remoteFileDataSource.imageUpload(image: image, fileName: fileName)
    }
}
