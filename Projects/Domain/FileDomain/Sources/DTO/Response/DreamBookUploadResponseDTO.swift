import Foundation

public struct DreamBookUploadResponseDTO: Decodable {
    public let fileURL: String

    enum CodingKeys: String, CodingKey {
        case fileURL = "fileUrl"
    }
}
