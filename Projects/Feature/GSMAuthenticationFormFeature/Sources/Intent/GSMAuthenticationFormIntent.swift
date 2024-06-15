import AuthenticationDomainInterface
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

    func onAppear() {
        Task {
            do {
                let uiModel = try await fetchAuthenticationFormUseCase.execute(
                    uuid: "54030dd1-0f3b-498a-b644-747769dfdca2"
                )

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
                    uuid: "54030dd1-0f3b-498a-b644-747769dfdca2",
                    req: convertToDTO(model: state.uiModel)
                )
            }
        }
    }

    func convertToDTO(model: GSMAuthenticationFormUIModel) -> InputAuthenticationRequestDTO {
        var contents = [Content]()

        // 끄어어어억
        for area in model.areas {
            for section in area.sections {
                var objects = [Object]()

                for field in section.fields {
                    let sectionType: FieldType
                    let value: String
                    let selectID: String

                    switch field.type {
                    case .text(let textValue):
                        sectionType = .text
                        value = textValue ?? ""
                        selectID = section.sectionId
                    case .number(let numberValue):
                        sectionType = .number
                        value = numberValue.map { String($0) } ?? ""
                        selectID = section.sectionId
                    case .boolean(let boolValue):
                        sectionType = .boolean
                        value = boolValue.map { String($0) } ?? ""
                        selectID = section.sectionId
                    case .file(let fileName):
                        sectionType = .file
                        value = fileName ?? ""
                        selectID = section.sectionId
                    case .select(let selectedValue, let values):
                        sectionType = .select
                        value = selectedValue ?? ""
                        selectID = values.first(where: { $0 == selectedValue }) ?? ""
                    }

                    let object = Object(
                        fieldID: field.fieldId,
                        sectionType: sectionType,
                        value: value,
                        selectID: selectID
                    )

                    objects.append(object)
                }

                let content = Content(sectionID: section.sectionId, objects: objects)
                contents.append(content)
            }
        }

        return InputAuthenticationRequestDTO(contents: contents)
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
            currentFieldCount: maxCount,
            fields: fields.map { $0.toModel() }
        )
    }
}

extension FieldEntity {
    func toModel() -> GSMAuthenticationFormUIModel.Area.Section.Field {
        GSMAuthenticationFormUIModel.Area.Section.Field.init(
            fieldId: fieldId,
            type: transformType(type: type),
            scoreDescription: scoreDescription,
            placeholder: placeholder
        )
    }

    func transformType(type: FieldType) -> GSMAuthenticationFormUIModel.Area.Section.Field.FieldType {
        switch type {
        case .text: .text(value: nil)
        case .number: .number(value: nil)
        case .boolean: .boolean(isSelcted: nil)
        case .file: .file(fileName: nil)
        case .select: .select(selectedValue: nil, values: [])
        }
    }
}
