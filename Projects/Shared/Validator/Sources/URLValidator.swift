import Foundation

public struct URLValidator: Validator {
    private let regexValidator = RegexValidator(
        pattern: "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%_\\+.~#()?&//=]*)"
    )

    public init() {}

    public func validate(_ value: String) -> Bool {
        regexValidator.validate(value)
    }

}
