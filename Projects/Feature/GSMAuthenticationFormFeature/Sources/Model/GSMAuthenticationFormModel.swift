import Foundation
import AuthenticationDomainInterface
import FoundationUtil

final class GSMAuthenticationFormModel: ObservableObject, GSMAuthenticationFormStateProtocol {
    @Published var uiModel: GSMAuthenticationFormUIModel = .init(areas: [], files: [])
    @Published var fieldContents: [GSMAuthenticationFormFieldModel] = []
    @Published var stateModel: GSMAuthenticationStateModel = .init(name: "", score: 0, markingBoardType: .underReview)
    @Published var isLoading: Bool = false
    @Published var isSubmitting: Bool = false
    @Published var isPresentedSubmitDialog: Bool = false
    var authenticationEntity: AuthenticationFormEntity?
    var authenticationStateEntity: AuthenticationStateEntity?
    @Published var areas: [GSMAuthenticationFormUIModel.Area] = []
    @Published var files: [GSMAuthenticationFormUIModel.File] = []
}

extension GSMAuthenticationFormModel: GSMAuthenticationFormActionProtocol {
    func updateGSMAuthenticationFormUIModel(uiModel: GSMAuthenticationFormUIModel) {
        self.uiModel = uiModel
        self.areas = uiModel.areas
        self.files = uiModel.files
    }

    func updateAuthenticationEntity(authenticationEntity: AuthenticationFormEntity) {
        self.authenticationEntity = authenticationEntity
    }

    func updateFieldContents(fields: [GSMAuthenticationFormFieldModel]) {
        self.fieldContents = fields
    }

    func updateAuthenticationStateEntity(
        authenticationStateEntity: AuthenticationStateEntity
    ) {
        self.authenticationStateEntity = authenticationStateEntity
    }

    func updateAuthenticationStateModel(stateModel: GSMAuthenticationStateModel) {
        self.stateModel = stateModel
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

        areas[area].sections[sectionIndex].groups.insert(
            .init(
                groupId: selectedGroup.groupId,
                maxScore: selectedGroup.maxScore,
                fields: fields
            ),
            at: groupIndex
        )
    }

    func updateTextField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, text: String) {
        areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type = .text(value: text)
    }

    func updateNumberField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, number: Int) {
        areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type = .number(value: number)
    }

    func updateBoolField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, select: String) {
        areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type =
            .boolean(selectedValue: select, values: areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].findFieldTypeValue())
    }

    func updateFileField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, file: String) {
        areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type = .file(fileName: file)
    }

    func updateSelectField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, select: String) {
        areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].type =
            .select(selectedValue: select, values: areas[area].sections[sectionIndex].groups[groupIndex].fields[fieldIndex].findFieldTypeValue())
    }

    func deleteField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    ) {
        areas[area].sections[sectionIndex].groups.remove(at: groupIndex)
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateIsSubmitting(isSubmitting: Bool) {
        self.isSubmitting = isSubmitting
    }

    func updateIsPresentedSubmitDialog(isPresentedSubmitDialog: Bool) {
        self.isPresentedSubmitDialog = isPresentedSubmitDialog
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
