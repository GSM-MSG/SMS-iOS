import Foundation
import FoundationUtil

public struct RegexValidator: Validator {
    private let regexPattern: String
    private let regexOptions: NSRegularExpression.Options
    private let matchingOptions: NSRegularExpression.MatchingOptions

    public init(
        pattern: String,
        regexOptions: NSRegularExpression.Options = [],
        matchingOptions: NSRegularExpression.MatchingOptions = []
    ) {
        self.regexPattern = pattern
        self.regexOptions = regexOptions
        self.matchingOptions = matchingOptions
    }

    public func validate(_ value: String) -> Bool {
        guard value.isNotEmpty, let regex = try? NSRegularExpression(
            pattern: regexPattern,
            options: regexOptions
        ) else { return false }
        let regexNSRange = (value as NSString).range(of: value)
    return regex.firstMatch(in: value, options: matchingOptions, range: regexNSRange) != nil
    }
}
