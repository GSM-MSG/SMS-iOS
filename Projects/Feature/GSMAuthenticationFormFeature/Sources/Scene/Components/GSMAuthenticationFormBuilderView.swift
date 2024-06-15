import DesignSystem
import Foundation
import SwiftUI

enum FieldChanges {
    case text(String)
    case number(Int)
    case boolean(Bool)
    case file(URL)
    case select(String)
}

enum FieldInteraction {
    case fieldChanges(key: String, fieldChanges: FieldChanges)
    case fieldAdd(area: Int, section: Int, field: Int)
}

struct GSMAuthenticationFormBuilderView: View {
    @Environment(\.fileFieldPresenter) var fileFieldPresenter
    @Environment(\.optionPickerPresenter) var optionPickerPresenter
    private let uiModel: GSMAuthenticationFormUIModel
    private let onFieldInteraction: (FieldInteraction) -> Void
    private typealias Area = GSMAuthenticationFormUIModel.Area
    private typealias Section = Area.Section
    private typealias Field = Section.Field

    init(
        uiModel: GSMAuthenticationFormUIModel,
        onFieldInteraction: @escaping (FieldInteraction) -> Void
    ) {
        self.uiModel = uiModel
        self.onFieldInteraction = onFieldInteraction
    }

    var body: some View {
        ScrollView {
            GSMAuthenticationFileDownloadView(uiModel: uiModel.files)

            areaList(areas: uiModel.areas)
        }
    }

    @ViewBuilder
    private func areaList(areas: [Area]) -> some View {
        LazyVStack(spacing: 16) {
            ForEach(uiModel.areas, id: \.title) { area in
                SMSSeparator()
                    .padding(.bottom, 4)

                HStack(spacing: 16) {
                    SMSText(area.title, font: .title1)

                    Spacer()

                    SMSIcon(.downChevron)
                        .rotationEffect(false ? .degrees(90) : .degrees(0))
                        .buttonWrapper {
                        }

                    SMSIcon(.xmarkOutline)
                        .buttonWrapper {
                        }
                }
                .padding(.horizontal, 20)

                sectionList(sections: area.sections)
                    .padding(.horizontal, 20)
            }
        }

    }

    @ViewBuilder
    private func sectionList(sections: [Section]) -> some View {
        LazyVStack(spacing: 0) {
            ForEach(sections, id: \.sectionId) { section in
                VStack {
                    fieldList(key: section.sectionId, fields: section.fields)

                    if section.currentFieldCount != 1 {
                        HStack {
                            SMSChip("추가") {
                            }

                            Spacer()

                            SMSIcon(.trash)
                        }
                    }
                }
                .titleWrapper(section.title)
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 20)
        }
    }

    @ViewBuilder
    private func fieldList(key: String, fields: [Field]) -> some View {
        LazyVStack(spacing: 16) {
            ForEach(fields, id: \.fieldId) { field in
                fieldView(key: field.fieldId, field: field)
                    .titleWrapper(
                        field.scoreDescription ?? "",
                        position: .bottom(.leading),
                        font: .caption1,
                        color: .neutral(.n30)
                    )
            }
        }
    }

    @ViewBuilder
    private func fieldView(key: String, field: Field) -> some View {
        switch field.type {
            case let .text(value):
                textTypeFieldView(key: key, placeholder: field.placeholder, text: value)

            case let .number(value):
                numberTypeFieldView(key: key, placeholder: field.placeholder, number: value)

            case let .boolean(isSelected):
                booleanTypeFieldView(key: key, isSelected: isSelected)

            case let .file(fileName):
                fileTypeFieldView(key: key, placeholder: field.placeholder, fileName: fileName)

            case let .select(selectedValue, values):
                selectTypeFieldView(
                    key: key,
                    placeholder: field.placeholder,
                    selectedValue: selectedValue,
                    values: values
            )
        }
    }

    @ViewBuilder
    private func textTypeFieldView(
        key: String,
        placeholder: String?,
        text: String?
    ) -> some View {
        SMSTextField(
            placeholder ?? "",
            text: Binding(
                get: { text ?? "" },
                set: { newValue in
                    onFieldInteraction(.fieldChanges(key: key, fieldChanges: .text(newValue)))
                }
            )
        )
    }

    @ViewBuilder
    private func numberTypeFieldView(
        key: String,
        placeholder: String?,
        number: Int?
    ) -> some View {
        SMSTextField(
            placeholder ?? "",
            text: Binding(
                get: {
                    if let number {
                        "\(number)"
                    } else {
                        ""
                    }
                },
                set: { newValue in
                    guard let numberValue = Int(newValue) else { return }
                    onFieldInteraction(.fieldChanges(key: key, fieldChanges: .number(numberValue)))
                }
            )
        )
    }

    @ViewBuilder
    private func booleanTypeFieldView(
        key: String,
        isSelected: Bool?
    ) -> some View {
        SMSSegmentedControl(
            options: ["True", "False"],
            selectedOption: (isSelected ?? false) ? "True" : "False"
        ) { option in
            switch option {
            case "True":
                onFieldInteraction(.fieldChanges(key: key, fieldChanges: .boolean(true)))

            case "False":
                onFieldInteraction(.fieldChanges(key: key, fieldChanges: .boolean(false)))

            default:
                return
            }
        }
    }

    @ViewBuilder
    private func fileTypeFieldView(
        key: String,
        placeholder: String?,
        fileName: String?
    ) -> some View {
        SMSFileField(
            placeholder,
            fileText: fileName
        ) { result in
            switch result {
            case let .success(url):
                onFieldInteraction(.fieldChanges(key: key, fieldChanges: .file(url)))

            default:
                return
            }
        }
    }

    @ViewBuilder
    private func selectTypeFieldView(
        key: String,
        placeholder: String?,
        selectedValue: String?,
        values: [String]
    ) -> some View {
        SMSTextField(
            placeholder ?? "",
            text: Binding(
                get: { selectedValue ?? "" },
                set: { _ in }
            )
        )
        .disabled(true)
        .overlay(alignment: .trailing) {
            SMSIcon(.downChevron)
                .padding(.trailing, 12)
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    optionPickerPresenter.presentOptionPicker(
                        options: values,
                        onOptionSelect: { selectedOption in
                            onFieldInteraction(.fieldChanges(key: key, fieldChanges: .select(selectedOption)))
                        }
                    )
                }
        )
    }
}
