import Foundation

public protocol FileRepository {
    func dreamBookUpload(fileUrl: String) async throws -> String
}
