struct GSMAuthenticationFormFieldModel {
    let sectionId: String
    let sectionType: GSMAuthenticationFormUIModel.Area.Section.Group.Field.FieldType
    let objects: [Object]

    struct Object {
        let selectId: String
        let value: GSMAuthenticationFormUIModel.Area.Section.Group.Field.FieldType
    }
}
