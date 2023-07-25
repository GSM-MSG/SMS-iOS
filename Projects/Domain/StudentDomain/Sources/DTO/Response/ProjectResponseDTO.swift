import Foundation
import StudentDomainInterface

public struct ProjectResponseDTO: Decodable {
    public let name: String
    public let iconImageURL: String
    public let previewImageURLs: [String]
    public let description: String
    public let links: [LinkResponseDTO]
    public let techStacks: [String]
    public let myActivity: String
    public let inProgress: InProgressResponseDTO

    enum CodingKeys: String, CodingKey {
        case name
        case iconImageURL = "icon"
        case previewImageURLs = "previewImages"
        case description
        case links
        case techStacks
        case myActivity
        case inProgress
    }
}

extension ProjectResponseDTO {
    public struct LinkResponseDTO: Decodable {
        public let name: String
        public let url: String
    }

    public struct InProgressResponseDTO: Decodable {
        public let start: String
        public let end: String?
    }
}

extension ProjectResponseDTO {
    func toDomain() -> ProjectEntity {
        ProjectEntity(
            name: name,
            iconImageURL: iconImageURL,
            previewImageURLs: previewImageURLs,
            description: description,
            links: links.map { $0.toDomain() },
            techStacks: techStacks,
            myActivity: myActivity,
            inProgress: inProgress.toDomain()
        )
    }
}

extension ProjectResponseDTO.LinkResponseDTO {
    func toDomain() -> ProjectEntity.LinkEntity {
        ProjectEntity.LinkEntity(name: name, url: url)
    }
}

extension ProjectResponseDTO.InProgressResponseDTO {
    func toDomain() -> ProjectEntity.InProgressEntity {
        .init(start: start, end: end)
    }
}
