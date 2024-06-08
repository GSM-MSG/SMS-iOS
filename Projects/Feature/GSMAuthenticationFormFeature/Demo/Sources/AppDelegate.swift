import SwiftUI
@testable import GSMAuthenticationFormFeature

@main
struct GSMAuthenticationFormDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let uiModel = GSMAuthenticationFormUIModel(
                areas: [
                    .init(
                        title: "Area",
                        sections: [
                            .init(
                                title: "Section1",
                                description: "Description",
                                currentFieldCount: 2,
                                fields: [
                                    .init(
                                        key: "text",
                                        type: .text(value: nil),
                                        placeholder: "text placeholder"
                                    ),
                                    .init(
                                        key: "number",
                                        type: .number(value: nil),
                                        placeholder: "number placeholder"
                                    ),
                                    .init(
                                        key: "file",
                                        type: .file(fileName: nil),
                                        placeholder: "file placeholder"
                                    )
                                ]
                            ),
                            .init(
                                title: "Section2",
                                description: "Description",
                                currentFieldCount: 3,
                                fields: [
                                    .init(
                                        key: "boolean",
                                        type: .boolean(isSelcted: false),
                                        placeholder: nil
                                    ),
                                    .init(
                                        key: "select",
                                        type: .select(selectedValue: nil, values: ["a", "b", "c"]),
                                        placeholder: "select placeholder"
                                    )
                                ]
                            )
                        ]
                    )
                ],
                files: [.init(name: "내가 짱이다.pdf", url: "https://pdfobject.com/pdf/sample.pdf"), .init(name: "내가 짱인데요.pdf", url: "https://pdfobject.com/pdf/sample.pdf")]
            )

            GSMAuthenticationFormBuilderView(uiModel: uiModel) { _ in

            }
        }
    }
}
