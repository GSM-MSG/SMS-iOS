import Foundation

public protocol FileRepository {
    func imageUpload(image: Data, fileName: String) async throws -> String
    func fileUpload(file: Data, fileName: String) async throws -> String
}
