import DesignSystem
import Foundation
import SwiftUI
import BaseFeature
import ViewUtil

enum FieldChanges {
    case text(String)
    case number(Int)
    case boolean(String)
    case file(String)
    case select(String)
}

enum FieldInteraction {
    case fieldChanges(area: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, fieldChanges: FieldChanges)
    case groupAdd(area: Int, section: Int, group: Int)
    case groupRemove(area: Int, section: Int, group: Int)
}

struct GSMAuthenticationFormBuilderView: View {
    @Environment(\.fileFieldPresenter) var fileFieldPresenter
    @Environment(\.optionPickerPresenter) var optionPickerPresenter
    private let uiModel: GSMAuthenticationFormUIModel
    private let onFieldInteraction: (FieldInteraction) -> Void
    private typealias Area = GSMAuthenticationFormUIModel.Area
    private typealias Section = Area.Section
    private typealias Group = Section.Group
    private typealias Field = Group.Field
    let intent: GSMAuthenticationFormIntentProtocol

    init(
        intent: GSMAuthenticationFormIntentProtocol,
        uiModel: GSMAuthenticationFormUIModel,
        onFieldInteraction: @escaping (FieldInteraction) -> Void
    ) {
        self.intent = intent
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
            ForEach(uiModel.areas.indices, id: \.self) { index in
                SMSSeparator()
                    .padding(.bottom, 4)

                HStack(spacing: 16) {
                    SMSText(areas[index].title, font: .title1)

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

                sectionList(areaIndex: index, sections: areas[index].sections)
                    .padding(.horizontal, 20)
            }
        }

    }

    @ViewBuilder
    private func sectionList(areaIndex: Int, sections: [Section]) -> some View {
        LazyVStack(spacing: 0) {
            ForEach(sections.indices, id: \.self) { index in
                VStack {
                    groupList(areaIndex: areaIndex, sectionIndex: index, groups: sections[index].groups, maxCount: sections[index].maxCount)
                }
                .titleWrapper(sections[index].title)
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 20)
        }
    }

    @ViewBuilder
    private func groupList(areaIndex: Int, sectionIndex: Int, groups: [Group], maxCount: Int) -> some View {
        LazyVStack(spacing: 16) {
            ForEach(groups.indices, id: \.self) { index in
                VStack {
                    fieldList(
                        areaIndex: areaIndex,
                        sectionIndex: sectionIndex,
                        groupIndex: index,
                        fields: groups[index].fields
                    )

                    HStack {
                        ConditionView(maxCount > groups.count && maxCount > 1) {
                            SMSChip("추가") {
                                onFieldInteraction(
                                    .groupAdd(area: areaIndex, section: sectionIndex, group: index)
                                )
                            }
                        }

                        Spacer()

                        ConditionView(maxCount > 1) {
                            Button {
                                onFieldInteraction(
                                    .groupRemove(area: areaIndex, section: sectionIndex, group: index)
                                )
                            } label: {
                                SMSIcon(.trash)
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func fieldList(areaIndex: Int, sectionIndex: Int, groupIndex: Int, fields: [Field]) -> some View {
        LazyVStack(spacing: 0) {
            ForEach(fields.indices, id: \.self) { index in
                fieldView(
                    areaIndex: areaIndex,
                    sectionIndex: sectionIndex,
                    groupIndex: groupIndex,
                    fieldIndex: index,
                    field: fields[index]
                )
                .titleWrapper(
                    fields[index].scoreDescription ?? "",
                    position: .bottom(.leading),
                    font: .caption1,
                    color: .neutral(.n30)
                )
            }
        }
    }

    @ViewBuilder
    private func fieldView(areaIndex: Int, sectionIndex: Int, groupIndex: Int, fieldIndex: Int, field: Field) -> some View {
        switch field.type {
        case let .text(value):
            textTypeFieldView(
                areaIndex: areaIndex,
                sectionIndex: sectionIndex,
                groupIndex: groupIndex,
                fieldIndex: fieldIndex,
                placeholder: field.placeholder,
                text: value
            )

        case let .number(value):
            numberTypeFieldView(
                areaIndex: areaIndex,
                sectionIndex: sectionIndex,
                groupIndex: groupIndex,
                fieldIndex: fieldIndex,
                placeholder: field.placeholder,
                number: value
            )

        case let .boolean(selectedValue, values):
            booleanTypeFieldView(
                areaIndex: areaIndex,
                sectionIndex: sectionIndex,
                groupIndex: groupIndex,
                fieldIndex: fieldIndex,
                selectedValue: selectedValue,
                values: values
            )

        case let .file(fileName):
            fileTypeFieldView(
                areaIndex: areaIndex,
                sectionIndex: sectionIndex,
                groupIndex: groupIndex,
                fieldIndex: fieldIndex,
                placeholder: field.placeholder,
                fileName: fileName
            )

        case let .select(selectedValue, values):
            selectTypeFieldView(
                areaIndex: areaIndex,
                sectionIndex: sectionIndex,
                groupIndex: groupIndex,
                fieldIndex: fieldIndex,
                placeholder: field.placeholder,
                selectedValue: selectedValue,
                values: values
            )
        }
    }

    @ViewBuilder
    private func textTypeFieldView(
        areaIndex: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        placeholder: String?,
        text: String?
    ) -> some View {
        SMSTextField(
            placeholder ?? "",
            text: Binding(
                get: { text ?? "" },
                set: { newValue in
                    onFieldInteraction(
                        .fieldChanges(
                            area: areaIndex,
                            sectionIndex: sectionIndex,
                            groupIndex: groupIndex,
                            fieldIndex: fieldIndex,
                            fieldChanges: .text(newValue)
                        )
                    )
                }
            )
        )
    }

    @ViewBuilder
    private func numberTypeFieldView(
        areaIndex: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
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
                    onFieldInteraction(
                        .fieldChanges(
                            area: areaIndex,
                            sectionIndex: sectionIndex,
                            groupIndex: groupIndex,
                            fieldIndex: fieldIndex,
                            fieldChanges: .number(numberValue)
                        )
                    )
                }
            )
        )
    }

    @ViewBuilder
    private func booleanTypeFieldView(
        areaIndex: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        selectedValue: String?,
        values: [String]
    ) -> some View {
        SMSSegmentedControl(
            options: values,
            selectedOption: selectedValue
        ) { option in
            switch option {
            case values[0]:
                onFieldInteraction(
                    .fieldChanges(
                        area: areaIndex,
                        sectionIndex: sectionIndex,
                        groupIndex: groupIndex,
                        fieldIndex: fieldIndex,
                        fieldChanges: .boolean(values[0])
                    )
                )

            case values[1]:
                onFieldInteraction(
                    .fieldChanges(
                        area: areaIndex,
                        sectionIndex: sectionIndex,
                        groupIndex: groupIndex,
                        fieldIndex: fieldIndex,
                        fieldChanges: .boolean(values[1])
                    )
                )

            default:
                return
            }
        }
    }

    @ViewBuilder
    private func fileTypeFieldView(
        areaIndex: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        placeholder: String?,
        fileName: String?
    ) -> some View {
        SMSFileField(
            placeholder,
            fileText: fileName
        ) { result in
            switch result {
            case let .success(url):
                onFieldInteraction(
                    .fieldChanges(
                        area: areaIndex,
                        sectionIndex: sectionIndex,
                        groupIndex: groupIndex,
                        fieldIndex: fieldIndex,
                        fieldChanges: .file(url.absoluteString)
                    )
                )

            default:
                return
            }
        }
    }

    @ViewBuilder
    private func selectTypeFieldView(
        areaIndex: Int,
        sectionIndex: Int,
        groupIndex: Int,
        fieldIndex: Int,
        placeholder: String?,
        selectedValue: String?,
        values: [String]
    ) -> some View {
        SMSTextField(
            placeholder ?? "",
            text: Binding(
                get: { selectedValue ?? "" },
                set: { _ in }
            ),
            isOnClear: false
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
                            onFieldInteraction(
                                .fieldChanges(
                                    area: areaIndex,
                                    sectionIndex: sectionIndex,
                                    groupIndex: groupIndex,
                                    fieldIndex: fieldIndex,
                                    fieldChanges: .select(selectedOption)
                                )
                            )
                        }
                    )
                }
        )
    }
}
