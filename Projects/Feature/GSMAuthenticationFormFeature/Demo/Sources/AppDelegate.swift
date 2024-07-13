import SwiftUI
@testable import GSMAuthenticationFormFeature
import AuthenticationDomainTesting
import FileDomainTesting

@main
struct GSMAuthenticationFormDemoApp: App {
    var body: some Scene {
        WindowGroup {
            FormBuilderAreaListView(
                areas: [
                    GSMAuthenticationFormUIModel.Area(
                        title: "Area 1",
                        sections: [
                            GSMAuthenticationFormUIModel.Area.Section(
                                title: "Section 1",
                                sectionId: "sec1",
                                maxCount: 5,
                                currentFieldCount: 3,
                                groups: [
                                    GSMAuthenticationFormUIModel.Area.Section.Group(
                                        groupId: "group1",
                                        maxScore: 100.0,
                                        fields: [
                                            GSMAuthenticationFormUIModel.Area.Section.Group.Field(
                                                fieldId: "field1",
                                                type: .text(value: "Sample text"),
                                                scoreDescription: "Description 1",
                                                placeholder: "Enter text"
                                            ),
                                            GSMAuthenticationFormUIModel.Area.Section.Group.Field(
                                                fieldId: "field2",
                                                type: .number(value: 42),
                                                scoreDescription: "Description 2",
                                                placeholder: "Enter number"
                                            ),
                                            GSMAuthenticationFormUIModel.Area.Section.Group.Field(
                                                fieldId: "field3",
                                                type: .boolean(selectedValue: "Yes", values: ["Yes", "No"]),
                                                scoreDescription: "Description 3",
                                                placeholder: "Select Yes/No"
                                            )
                                        ]
                                    ),
                                    GSMAuthenticationFormUIModel.Area.Section.Group(
                                        groupId: "group2",
                                        maxScore: 80.0,
                                        fields: [
                                            GSMAuthenticationFormUIModel.Area.Section.Group.Field(
                                                fieldId: "field4",
                                                type: .file(fileName: "document.pdf"),
                                                scoreDescription: "Description 4",
                                                placeholder: "Upload file"
                                            ),
                                            GSMAuthenticationFormUIModel.Area.Section.Group.Field(
                                                fieldId: "field5",
                                                type: .select(selectedValue: "Option 1", values: ["Option 1", "Option 2", "Option 3"]),
                                                scoreDescription: "Description 5",
                                                placeholder: "Select option"
                                            )
                                        ]
                                    )
                                ]
                            )
                        ]
                    )
                ]
            ) { _ in }
        }
    }
}
