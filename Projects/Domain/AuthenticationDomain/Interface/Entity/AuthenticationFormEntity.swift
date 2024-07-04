import Foundation

public struct AuthenticationFormEntity {
    public let files: [File]
    public let areas: [Area]

    public init(files: [File], areas: [Area]) {
        self.files = files
        self.areas = areas
    }
}

extension AuthenticationFormEntity {
    public struct Area {
        public let title: String
        public let sections: [SectionEntity]
        public init(title: String, sections: [SectionEntity]) {
            self.title = title
            self.sections = sections
        }
    }

    public struct File {
        public let name: String
        public let url: String
        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
}

public struct SectionEntity {
    public let sectionId: String
    public let title: String
    public let maxCount: Int
    public let groups: [GroupEntity]

    public init(sectionId: String, title: String, maxCount: Int, groups: [GroupEntity]) {
        self.sectionId = sectionId
        self.title = title
        self.maxCount = maxCount
        self.groups = groups
    }
}

public struct GroupEntity {
    public let groupId: String
    public let maxScore: Double
    public let fields: [FieldEntity]

    public init(groupId: String, maxScore: Double, fields: [FieldEntity]) {
        self.groupId = groupId
        self.maxScore = maxScore
        self.fields = fields
    }
}

public struct FieldEntity {
    public let fieldId: String
    public let type: FieldType
    public let scoreDescription: String?
    public let values: [ValueEntity]?
    public let placeholder: String?

    public init(fieldId: String, type: FieldType, scoreDescription: String?, values: [ValueEntity]?, placeholder: String?) {
        self.fieldId = fieldId
        self.type = type
        self.scoreDescription = scoreDescription
        self.values = values
        self.placeholder = placeholder
    }
}

public struct ValueEntity {
    public let selectId: String
    public let value: String

    public init(selectId: String, value: String) {
        self.selectId = selectId
        self.value = value
    }
}
