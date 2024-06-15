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
