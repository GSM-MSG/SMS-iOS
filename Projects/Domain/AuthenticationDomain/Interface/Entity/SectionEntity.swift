public struct SectionEntity {
    public let sectionId: String
    public let title: String
    public let maxCount: Double
    public let fields: [FieldEntity]

    public init(sectionId: String, title: String, maxCount: Double, fields: [FieldEntity]) {
        self.sectionId = sectionId
        self.title = title
        self.maxCount = maxCount
        self.fields = fields
    }
}
