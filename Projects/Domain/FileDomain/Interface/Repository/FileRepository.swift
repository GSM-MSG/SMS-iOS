import Foundation

public protocol FileRepository {
    func dreamBookUpload(file: Data, fileName: String) async throws -> String
    func imageUpload(image: Data, fileName: String) async throws -> String
}
