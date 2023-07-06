import Foundation

struct FetchMyMiniProfileResponseDTO: Decodable {
    let profileImageURL: String

    enum CodingKeys: String, CodingKey {
        case profileImageURL = "profileImgUrl"
    }
}
