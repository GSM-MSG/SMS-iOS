struct GSMAuthenticationFormFieldModel {
    let sectionId: String
    let sectionType: GSMAuthenticationFormUIModel.Area.Section.Field.FieldType
    let objects: [Object]

    struct Object {
        let selectId: String
        let value: GSMAuthenticationFormUIModel.Area.Section.Field.FieldType
    }
}
