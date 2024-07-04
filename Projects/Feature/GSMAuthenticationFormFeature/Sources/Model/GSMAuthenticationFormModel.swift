import Foundation
import AuthenticationDomainInterface
import FoundationUtil

final class GSMAuthenticationFormModel: ObservableObject, GSMAuthenticationFormStateProtocol {
    @Published var uiModel: GSMAuthenticationFormUIModel = .init(areas: [], files: [])
    @Published var fieldContents: [GSMAuthenticationFormFieldModel] = []
}

extension GSMAuthenticationFormModel: GSMAuthenticationFormActionProtocol {
    func updateGSMAuthenticationFormUIModel(uiModel: GSMAuthenticationFormUIModel) {
        self.uiModel = uiModel
    }

    func updateFieldContents(fields: [GSMAuthenticationFormFieldModel]) {
        self.fieldContents = fields
    }

    func appendField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fields: [GSMAuthenticationFormUIModel.Area.Section.Group.Field]
    ) {
        uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields.append(
            .init(
                fieldId: fields.first?.fieldId ?? "",
                type: fields.first?.type ?? .text(value: ""),
                scoreDescription: fields.first?.scoreDescription,
                placeholder: fields.first?.placeholder
            )
        )
    }

    func updateTextField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, text: String) {
        uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type = .text(value: text)
    }

    func updateNumberField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, number: Int) {
        uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type = .number(value: number)
    }

    func updateBoolField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, select: String) {
        uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type =
            .boolean(selectedValue: select, values: uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].findFieldTypeValue())
    }

    func updateFileField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, file: String) {
        uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type = .file(fileName: file)
    }

    func updateSelectField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, select: String) {
        uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type =
            .select(selectedValue: select, values: uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].findFieldTypeValue())
    }

    func deleteField(area: Int, sectionIndex: Int, groupIndex: Int) {
        uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields.remove(at: uiModel.areas[area].sections[sectionIndex].groups[groupIndex].fields.endIndex - 1)
    }
}
