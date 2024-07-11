import Foundation

// swiftlint: disable nesting
struct GSMAuthenticationFormUIModel {
    var areas: [Area]
    var files: [File]

    struct Area {
        var title: String
        var sections: [Section]

        struct Section {
            var title: String
            var sectionId: String
            var maxCount: Int
            var currentFieldCount: Int
            var groups: [Group]

            struct Group {
                var groupId: String
                var maxScore: Double
                var fields: [Field]

                struct Field {
                    var fieldId: String
                    var type: FieldType
                    var scoreDescription: String?
                    var placeholder: String?

                    enum FieldType {
                        case text(value: String?)
                        case number(value: Int?)
                        case boolean(selectedValue: String?, values: [String])
                        case file(fileName: String?)
                        case select(selectedValue: String?, values: [String])

                        var emptyValue: FieldType {
                            switch self {
                            case .text: return .text(value: nil)
                            case .number: return .number(value: nil)
                            case let .boolean(_, values): return .boolean(selectedValue: nil, values: values)
                            case .file: return .file(fileName: nil)
                            case let .select(_, values): return .select(selectedValue: nil, values: values)
                            }
                        }
                    }

                    func findFieldTypeValue() -> [String] {
                        switch type {
                        case let .boolean(_, values):
                            return values
                        case let .select(_, values):
                            return values
                        default:
                            return []
                        }
                    }
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
