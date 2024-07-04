import Foundation
protocol GSMAuthenticationFormStateProtocol {
    var uiModel: GSMAuthenticationFormUIModel { get }
}

protocol GSMAuthenticationFormActionProtocol: AnyObject {
    func updateGSMAuthenticationFormUIModel(uiModel: GSMAuthenticationFormUIModel)

    func appendField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fields: [GSMAuthenticationFormUIModel.Area.Section.Group.Field]
    )

    func updateTextField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        text: String
    )
    func updateNumberField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        number: Int
    )
    func updateBoolField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        select: String
    )
    func updateFileField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        file: String
    )
    func updateSelectField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        select: String
    )

    func deleteField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    )
}
