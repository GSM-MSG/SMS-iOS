import Foundation

// swiftlint: disable nesting
struct GSMAuthenticationFormUIModel {
    let areas: [Area]

    struct Area {
        let title: String
        let files: [File]
        let sections: [Section]

        struct File {
            let name: String
            let url: String
        }

        struct Section {
            let title: String
            let description: String
            let currentFieldCount: Int
            let fields: [Field]

            struct Field {
                let key: String
                let type: FieldType
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
}
// swiftlint: enable nesting
