import Foundation

public protocol FileRepository {
    func imageUpload(image: Data, fileName: String) async throws -> String
}
