import Foundation

public struct InputStudentInformationRequestDTO: Encodable {
    public let contactEmail: String
    public let introduce: String
    public let major: String
    public let profileImgURL: String
    public let techStacks: [String]
    public let prizes: [Prize]

    public init(
        contactEmail: String,
        introduce: String,
        major: String,
        profileImgURL: String,
        techStacks: [String],
        prizes: [Prize] = []
    ) {
        self.contactEmail = contactEmail
        self.introduce = introduce
        self.major = major
        self.profileImgURL = profileImgURL
        self.techStacks = techStacks
        self.prizes = prizes
    }

    enum CodingKeys: String, CodingKey {
        case contactEmail
        case introduce
        case major
        case profileImgURL = "profileImgUrl"
        case techStacks
        case prizes
    }
}

public extension InputStudentInformationRequestDTO {
    struct Prize: Encodable {
        public let name: String
        public let type: String
        public let date: String

        public init(
            name: String,
            type: String,
            date: String
        ) {
            self.name = name
            self.type = type
            self.date = date
        }
    }
}
