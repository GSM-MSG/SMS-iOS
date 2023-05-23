import FileDomainInterface
import Foundation

struct FileRepositoryImpl: FileRepository {
    private let remoteFileDataSource: any RemoteFileDataSource

    init(remoteFileDataSource: any RemoteFileDataSource) {
        self.remoteFileDataSource = remoteFileDataSource
    }

    func dreamBookUpload(file: Data, fileName: String) async throws -> String {
        try await remoteFileDataSource.dreamBookUpload(file: file, fileName: fileName)
    }
}
