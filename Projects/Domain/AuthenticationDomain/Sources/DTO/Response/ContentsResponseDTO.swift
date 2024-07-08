import Foundation
import AuthenticationDomainInterface

public struct AuthenticationFormResponseDTO: Decodable {
    public let files: [FilesResponseDTO]
    public let contents: [ContentsResponseDTO]

    public init(files: [FilesResponseDTO], contents: [ContentsResponseDTO]) {
        self.files = files
        self.contents = contents
    }
}

public struct FilesResponseDTO: Decodable {
    public let name: String
    public let url: String
}

public struct ContentsResponseDTO: Decodable {
    public let title: String
    public let sections: [SectionsResponseDTO]

    public struct SectionsResponseDTO: Decodable {
        public let sectionId: String
        public let sectionName: String
        public let maxCount: Int
        public let groups: [GroupsResponseDTO]
    }

    public struct GroupsResponseDTO: Decodable {
        public let groupId: String
        public let maxScore: Double
        public let fields: [FieldsResponseDTO]
    }

    public struct FieldsResponseDTO: Decodable {
        public let fieldId: String
        public let fieldType: FieldType
        public let scoreDescription: String?
        public let values: [ValuesResponseDTO]?
        public let example: String?

        enum CodingKeys: String, CodingKey {
            case fieldId, fieldType, scoreDescription, values
            case example = "placeholder"
        }
    }

    public struct ValuesResponseDTO: Decodable {
        public let selectId: String
        public let value: String
    }
}

extension AuthenticationFormResponseDTO {
    func toDomain() -> AuthenticationFormEntity {
        AuthenticationFormEntity(
            files: files.map { $0.toDomain() },
            areas: contents.map { $0.toDomain() }
        )
    }
}

extension FilesResponseDTO {
    func toDomain() -> AuthenticationFormEntity.File {
        AuthenticationFormEntity.File(name: name, url: url)
    }
}

extension ContentsResponseDTO {
    func toDomain() -> AuthenticationFormEntity.Area {
        AuthenticationFormEntity.Area(title: title, sections: sections.map { $0.toDomain() })
    }
}

extension ContentsResponseDTO.SectionsResponseDTO {
    func toDomain() -> SectionEntity {
        SectionEntity(
            sectionId: sectionId,
            title: sectionName,
            maxCount: maxCount,
            groups: groups.map { $0.toDomain() }
        )
    }
}

extension ContentsResponseDTO.GroupsResponseDTO {
    func toDomain() -> GroupEntity {
        GroupEntity(
            groupId: groupId,
            maxScore: maxScore,
            fields: fields.map { $0.toDomain() }
        )
    }
}

extension ContentsResponseDTO.FieldsResponseDTO {
    func toDomain() -> FieldEntity {
        FieldEntity(
            fieldId: fieldId,
            type: fieldType,
            scoreDescription: scoreDescription,
            values: values.map { $0.map { $0.toDomain() } },
            placeholder: example
        )
    }
}

extension ContentsResponseDTO.ValuesResponseDTO {
    func toDomain() -> ValueEntity {
        ValueEntity(selectId: selectId, value: value)
    }
}
