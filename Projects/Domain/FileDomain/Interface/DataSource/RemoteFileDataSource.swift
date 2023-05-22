import Foundation

public protocol RemoteFileDataSource {
    func dreamBookUpload(file: Data) async throws -> String
}
