import AuthenticationDomainInterface
import Foundation
import ConcurrencyUtil
import DateUtil

final class GSMAuthenticationFormIntent: GSMAuthenticationFormIntentProtocol {
    weak var model: (any GSMAuthenticationFormActionProtocol)?
    private let fetchAuthenticationFormUseCase: any FetchAuthenticationFormUseCase
    private let inputAuthenticationUseCase: any InputAuthenticationUseCase

    init(
        model: any GSMAuthenticationFormActionProtocol,
        fetchAuthenticationFormUseCase: any FetchAuthenticationFormUseCase,
        inputAuthenticationUseCase: any InputAuthenticationUseCase
    ) {
        self.model = model
        self.fetchAuthenticationFormUseCase = fetchAuthenticationFormUseCase
        self.inputAuthenticationUseCase = inputAuthenticationUseCase
    }

    func appendField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fields: [GSMAuthenticationFormUIModel.Area.Section.Group.Field]
    ) {
        model?.appendField(
            area: area,
            sectionIndex: sectionIndex,
            groupIndex: groupIndex,
            fields: fields
        )
    }

    func deleteField(area: Int, sectionIndex: Int, groupIndex: Int) {
        model?.deleteField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex)
    }

    func onAppear() {
        Task {
            do {
                let uiModel = try await fetchAuthenticationFormUseCase.execute()

                model?.updateGSMAuthenticationFormUIModel(
                    uiModel: .init(
                        areas: uiModel.areas.map { $0.toModel() },
                        files: uiModel.files.map { $0.toModel() }
                    )
                )
            }
        }
    }

    func saveButtonDidTap(state: any GSMAuthenticationFormStateProtocol) {
        Task {
            do {
                try await inputAuthenticationUseCase.execute(
                    req: convertToDTO(model: state.uiModel)
                )
            }
        }
    }

    func convertToDTO(model: GSMAuthenticationFormUIModel) -> InputAuthenticationRequestDTO {
        let contents: [Content] = model.areas.flatMap { area in
                area.sections.map { section in
                    let objects: [Object] = section.groups.map { group in
                        let fields: [Field] = group.fields.map { field in
                            let fieldType: FieldType
                            let value: String
                            let selectID: String
                            
                            switch field.type {
                            case .text(let textValue):
                                fieldType = .text
                                value = textValue ?? ""
                                selectID = ""
                            case .number(let numberValue):
                                fieldType = .number
                                value = numberValue.map { String($0) } ?? ""
                                selectID = ""
                            case .boolean(let selectedValue, let values):
                                fieldType = .boolean
                                value = selectedValue ?? ""
                                selectID = values.joined(separator: ",")
                            case .file(let fileName):
                                fieldType = .file
                                value = fileName ?? ""
                                selectID = ""
                            case .select(let selectedValue, let values):
                                fieldType = .select
                                value = selectedValue ?? ""
                                selectID = values.joined(separator: ",")
                            }
                            
                            return Field(fieldID: field.fieldId, fieldType: fieldType, value: value, selectID: selectID)
                        }
                        return Object(groupId: group.groupId, fields: fields)
                    }
                    return Content(sectionID: section.sectionId, objects: objects)
                }
            }
            
            return InputAuthenticationRequestDTO(contents: contents)
    }

    func updateTextField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, text: String) {
        model?.updateTextField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex, fieldIndex: fieldIndex, text: text)
    }

    func updateNumberField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, number: Int) {
        model?.updateNumberField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex, fieldIndex: fieldIndex, number: number)
    }

    func updateBoolField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, select: String) {
        model?.updateBoolField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex, fieldIndex: fieldIndex, select: select)
    }

    func updateFileField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, file: String) {
        model?.updateFileField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex, fieldIndex: fieldIndex, file: file)
    }

    func updateSelectField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, select: String) {
        model?.updateSelectField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex, fieldIndex: fieldIndex, select: select)
    }
}

extension AuthenticationFormEntity.File {
    func toModel() -> GSMAuthenticationFormUIModel.File {
        GSMAuthenticationFormUIModel.File.init(name: name, url: url)
    }
}

extension AuthenticationFormEntity.Area {
    func toModel() -> GSMAuthenticationFormUIModel.Area {
        GSMAuthenticationFormUIModel.Area.init(
            title: title,
            sections: sections.map { $0.toModel() }
        )
    }
}

extension SectionEntity {
    func toModel() -> GSMAuthenticationFormUIModel.Area.Section {
        GSMAuthenticationFormUIModel.Area.Section.init(
            title: title,
            sectionId: sectionId,
            maxCount: maxCount,
            currentFieldCount: 0,
            groups: groups.map { $0.toModel() }
        )
    }
}

extension GroupEntity {
    func toModel() -> GSMAuthenticationFormUIModel.Area.Section.Group {
        GSMAuthenticationFormUIModel.Area.Section.Group.init(
            groupId: groupId,
            maxScore: maxScore,
            fields: fields.map { $0.toModel() }
        )
    }
}

extension FieldEntity {
    func toModel() -> GSMAuthenticationFormUIModel.Area.Section.Group.Field {
        return GSMAuthenticationFormUIModel.Area.Section.Group.Field.init(
            fieldId: fieldId,
            type: transformType(type: type),
            scoreDescription: scoreDescription,
            placeholder: placeholder
        )
    }

    func transformType(type: FieldType) -> GSMAuthenticationFormUIModel.Area.Section.Group.Field.FieldType {
        let value: [String] = values?.map { $0.value } ?? []

        switch type {
        case .text: return .text(value: nil)
        case .number: return .number(value: nil)
        case .boolean: return .boolean(selectedValue: nil, values: value)
        case .file: return .file(fileName: nil)
        case .select: return .select(selectedValue: nil, values: value)
        }
    }
}
