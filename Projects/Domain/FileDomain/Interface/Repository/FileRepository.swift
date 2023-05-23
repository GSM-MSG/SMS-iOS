import Foundation

public protocol FileRepository {
    func dreamBookUpload(file: Data, fileName: String) async throws -> String
}
