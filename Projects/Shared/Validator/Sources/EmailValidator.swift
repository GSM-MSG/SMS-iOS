import Foundation

public struct EmailValidator: Validator {
    private let regexValidator = RegexValidator(
        pattern: "^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$"
    )

    public init() {}

    public func validate(_ value: String) -> Bool {
        regexValidator.validate(value)
    }
}
