import Foundation

protocol GSMAuthenticationFormIntentProtocol {
    func onAppear()
    func saveButtonDidTap(state: any GSMAuthenticationFormStateProtocol)
    func appendField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    )
    func deleteField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
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
}
