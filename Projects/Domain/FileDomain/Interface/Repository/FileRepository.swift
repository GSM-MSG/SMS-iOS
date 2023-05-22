import Foundation

public protocol FileRepository {
    func dreamBookUpload(file: Data) async throws -> String
}
