import Foundation

public struct InputStudentInformationRequestDTO: Encodable {
    public let contactEmail: String
    public let introduce: String
    public let major: String
    public let profileImgURL: String
    public let techStacks: [String]

    public init(
        contactEmail: String,
        introduce: String,
        major: String,
        profileImgURL: String,
        techStacks: [String]
    ) {
        self.contactEmail = contactEmail
        self.introduce = introduce
        self.major = major
        self.profileImgURL = profileImgURL
        self.techStacks = techStacks
    }

    enum CodingKeys: String, CodingKey {
        case contactEmail
        case introduce
        case major
        case profileImgURL = "profileImgUrl"
        case techStacks
    }
}
