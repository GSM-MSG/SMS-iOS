import Foundation

public protocol RemoteFileDataSource {
    func dreamBookUpload(file: Data, fileName: String) async throws -> String
}
