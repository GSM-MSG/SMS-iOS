import Foundation

public struct InputAuthenticationRequestDTO: Encodable {
    public let contents: [Content]

    public init(contents: [Content]) {
        self.contents = contents
    }
}

public struct Content: Encodable {
    public let sectionID: String
    public let objects: [Object]

    public init(sectionID: String, objects: [Object]) {
        self.sectionID = sectionID
        self.objects = objects
    }

    enum CodingKeys: String, CodingKey {
        case sectionID = "sectionId"
        case objects
    }
}

public struct Object: Encodable {
    public let groupId: String
    public let fields: [Field]

    public init(groupId: String, fields: [Field]) {
        self.groupId = groupId
        self.fields = fields
    }

    enum CodingKeys: String, CodingKey {
        case groupId = "groupId"
        case fields
    }
}

// MARK: - Object
public struct Field: Encodable {
    public let fieldID: String
    public let fieldType: FieldType
    public let value: String
    public let selectID: String

    public init(fieldID: String, fieldType: FieldType, value: String, selectID: String) {
        self.fieldID = fieldID
        self.fieldType = fieldType
        self.value = value
        self.selectID = selectID
    }

    enum CodingKeys: String, CodingKey {
        case fieldID = "fieldId"
        case fieldType
        case value
        case selectID = "selectId"
    }
}
