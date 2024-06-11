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
}

// MARK: - Object
public struct Object: Encodable {
    public let fieldID: String
    public let sectionType: FieldType
    public let value: String
    public let selectID: String

    public init(fieldID: String, sectionType: FieldType, value: String, selectID: String) {
        self.fieldID = fieldID
        self.sectionType = sectionType
        self.value = value
        self.selectID = selectID
    }
}
