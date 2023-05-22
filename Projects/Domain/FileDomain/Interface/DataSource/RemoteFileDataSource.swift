import Foundation

public protocol RemoteFileDataSource {
    func dreamBookUpload(fileUrl: String) async throws -> String
}
