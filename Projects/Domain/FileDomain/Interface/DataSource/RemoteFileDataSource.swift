import Foundation

public protocol RemoteFileDataSource {
    func imageUpload(image: Data, fileName: String) async throws -> String
    func fileUpload(file: Data, fileName: String) async throws -> String
}
