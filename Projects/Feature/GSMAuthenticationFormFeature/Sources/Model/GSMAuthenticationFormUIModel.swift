import Foundation

// swiftlint: disable nesting
struct GSMAuthenticationFormUIModel {
    let areas: [Area]
    let files: [File]

    struct Area {
        let title: String
        let sections: [Section]

        struct Section {
            let title: String
            let sectionId: String
            let currentFieldCount: Double
            let fields: [Field]

            struct Field {
                let fieldId: String
                let type: FieldType
                let scoreDescription: String?
                let placeholder: String?

                enum FieldType {
                    case text(value: String?)
                    case number(value: Int?)
                    case boolean(isSelcted: Bool?)
                    case file(fileName: String?)
                    case select(selectedValue: String?, values: [String])
                }
            }
        }
    }

    struct File {
        let name: String
        let url: String
    }
}
// swiftlint: enable nesting
