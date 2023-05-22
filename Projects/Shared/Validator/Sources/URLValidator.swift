import Foundation

public struct URLValidator: Validator {
    private let regexValidator = RegexValidator(
        pattern: "^(http(s)?:\\/\\/)([a-z0-9\\w]+\\.*)+[a-z0-9]{2,6}$"
    )

    public init() {}

    public func validate(_ value: String) -> Bool {
        regexValidator.validate(value)
    }
}
