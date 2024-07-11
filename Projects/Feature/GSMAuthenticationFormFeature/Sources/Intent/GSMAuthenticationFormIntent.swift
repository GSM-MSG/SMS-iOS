import AuthenticationDomainInterface
import FileDomainInterface
import Foundation
import ConcurrencyUtil
import DateUtil

final class GSMAuthenticationFormIntent: GSMAuthenticationFormIntentProtocol {
    weak var model: (any GSMAuthenticationFormActionProtocol)?
    private let fetchAuthenticationFormUseCase: any FetchAuthenticationFormUseCase
    private let inputAuthenticationUseCase: any InputAuthenticationUseCase
    private let fileUploadUseCase: any FileUploadUseCase
    private let fetchAuthenticationStateUseCase: any FetchAuthenticationStateUseCase

    init(
        model: any GSMAuthenticationFormActionProtocol,
        fetchAuthenticationFormUseCase: any FetchAuthenticationFormUseCase,
        inputAuthenticationUseCase: any InputAuthenticationUseCase,
        fileUploadUseCase: any FileUploadUseCase,
        fetchAuthenticationStateUseCase: FetchAuthenticationStateUseCase
    ) {
        self.model = model
        self.fetchAuthenticationFormUseCase = fetchAuthenticationFormUseCase
        self.inputAuthenticationUseCase = inputAuthenticationUseCase
        self.fileUploadUseCase = fileUploadUseCase
        self.fetchAuthenticationStateUseCase = fetchAuthenticationStateUseCase
    }

    func viewOnAppear() {
        model?.updateIsLoading(isLoading: true)
        Task {
            do {
                let authenticationStateEntity = try await fetchAuthenticationStateUseCase.execute()

                model?.updateAuthenticationStateEntity(authenticationStateEntity: authenticationStateEntity)

                model?.updateAuthenticationStateModel(
                    stateModel:
                            .init(
                                name: authenticationStateEntity.name,
                                score: authenticationStateEntity.score,
                                grader: authenticationStateEntity.grader,
                                markingBoardType: authenticationStateEntity.markingBoardType
                            )
                )
                if authenticationStateEntity.markingBoardType != .notSubmitted {
                    model?.updateIsLoading(isLoading: false)
                }
            }
        }
    }

    func appendField(
        area: Int,
        sectionIndex: Int,
        groupIndex: Int
    ) {
        model?.appendField(
            area: area,
            sectionIndex: sectionIndex,
            groupIndex: groupIndex
        )
    }

    func deleteField(area: Int, sectionIndex: Int, groupIndex: Int) {
        model?.deleteField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex)
    }

    func formOnAppear() {
        Task {
            do {
                let authenticationEntity = try await fetchAuthenticationFormUseCase.execute()

                model?.updateAuthenticationEntity(authenticationEntity: authenticationEntity)
                model?.updateGSMAuthenticationFormUIModel(
                    uiModel: .init(
                        areas: authenticationEntity.areas.map { $0.toModel() },
                        files: authenticationEntity.files.map { $0.toModel() }
                    )
                )

                model?.updateIsLoading(isLoading: false)
            }
        }
    }

    func saveButtonDidTap(state: any GSMAuthenticationFormStateProtocol) {
        Task {
            do {
                guard let authenticationEntity = state.authenticationEntity else { return }
                try await inputAuthenticationUseCase.execute(
                    req: convertToDTO(
                        model: state.uiModel,
                        entity: authenticationEntity
                    )
                )
            }
        }
    }

    func convertToDTO(
        model: GSMAuthenticationFormUIModel,
        entity: AuthenticationFormEntity
    ) -> InputAuthenticationRequestDTO {
        let contents: [Content] = model.areas.enumerated().flatMap { areaIndex, area in
            area.sections.enumerated().map { sectionIndex, section in
                let objects: [Object] = section.groups.enumerated().map { objectIndex, group in
                    let fields: [Field] = group.fields.enumerated().map { fieldIndex, field in
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
                            selectID = entity.areas[areaIndex]
                                .sections[sectionIndex]
                                .groups[objectIndex]
                                .fields
                                .first { $0.fieldId == field.fieldId }?
                                .values?
                                .first { $0.value == selectedValue }?.selectId ?? ""
                        case .file(let fileName):
                            fieldType = .file
                            value = fileName ?? ""
                            selectID = ""
                        case .select(let selectedValue, let values):
                            fieldType = .select
                            value = selectedValue ?? ""
                            selectID = entity.areas[areaIndex]
                                .sections[sectionIndex]
                                .groups[objectIndex]
                                .fields
                                .first { $0.fieldId == field.fieldId }?
                                .values?
                                .first { $0.value == selectedValue }?.selectId ?? ""
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

    func updateFileField(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, file: Data, fileName: String) {
        Task {
            do {
                let fileUrl = try await fileUploadUseCase.execute(file: file, fileName: fileName)
                model?.updateFileField(area: area, sectionIndex: sectionIndex, groupIndex: groupIndex, fieldIndex: fieldIndex, file: fileUrl)
            }
        }
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
