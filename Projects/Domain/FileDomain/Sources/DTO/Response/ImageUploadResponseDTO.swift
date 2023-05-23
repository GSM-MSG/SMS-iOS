import Foundation

public struct ImageUploadResponseDTO: Decodable {
    public let fileURL: String

    enum CodingKeys: String, CodingKey {
        case fileURL = "fileUrl"
    }
}
