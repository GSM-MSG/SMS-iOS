import Foundation

public struct FileUploadResponseDTO: Decodable {
    public let fileURL: String

    enum CodingKeys: String, CodingKey {
        case fileURL = "fileUrl"
    }
}
