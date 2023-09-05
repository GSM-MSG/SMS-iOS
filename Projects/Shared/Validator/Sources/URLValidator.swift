import Foundation

public struct URLValidator: Validator {
    private let regexValidator = RegexValidator(
        pattern: "https?:\\/\\/.*"
    )

    public init() {}

    public func validate(_ value: String) -> Bool {
        regexValidator.validate(value)
    }
}
