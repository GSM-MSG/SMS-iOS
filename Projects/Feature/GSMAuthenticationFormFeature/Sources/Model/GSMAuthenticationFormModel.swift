import Foundation
import AuthenticationDomainInterface
import FoundationUtil

final class GSMAuthenticationFormModel: ObservableObject, GSMAuthenticationFormStateProtocol {
    @Published var uiModel: GSMAuthenticationFormUIModel = .init(areas: [], files: [])
    @Published var fieldContents: [GSMAuthenticationFormFieldModel] = []
    var authenticationEntity: AuthenticationFormEntity?
}

extension GSMAuthenticationFormModel: GSMAuthenticationFormActionProtocol {
    func updateGSMAuthenticationFormUIModel(uiModel: GSMAuthenticationFormUIModel) {
        self.uiModel = uiModel
    }

    func updateAuthenticationEntity(authenticationEntity: AuthenticationFormEntity) {
        self.authenticationEntity = authenticationEntity
    }

    func updateFieldContents(fields: [GSMAuthenticationFormFieldModel]) {
        self.fieldContents = fields
    }

    func appendField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    ) {
        guard let authenticationEntity else { return }
        assert(
            authenticationEntity.areas[area]
                .sections[sectionIndex]
                .groups.count == 1,
            "section : group = 1 : 1 관계인 정책"
        )
        guard let selectedGroup = authenticationEntity.areas[area]
            .sections[sectionIndex]
            .groups
            .first
        else { return }

        let fields = selectedGroup.fields.map {
            GSMAuthenticationFormUIModel.Area.Section.Group.Field.init(
                fieldId: $0.fieldId,
                type: toUIFieldType(field: $0),
                scoreDescription: $0.scoreDescription,
                placeholder: $0.placeholder
            )
        }

        uiModel.areas[area].sections[sectionIndex].groups.insert(
            .init(
                groupId: selectedGroup.groupId,
                maxScore: selectedGroup.maxScore,
                fields: fields
            ),
            at: groupIndex
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

    func deleteField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    ) {
        uiModel.areas[area].sections[sectionIndex].groups.remove(at: groupIndex)
    }
}

private extension GSMAuthenticationFormModel {
    func toUIFieldType(
        field: FieldEntity
    ) -> GSMAuthenticationFormUIModel.Area.Section.Group.Field.FieldType {
        switch field.type {
        case .text: return .text(value: nil)
        case .number: return .number(value: nil)
        case .boolean: return .boolean(selectedValue: nil, values: field.values?.map { $0.value } ?? [])
        case .file: return .file(fileName: nil)
        case .select: return .select(selectedValue: nil, values: field.values?.map { $0.value } ?? [])
        }
    }
}
