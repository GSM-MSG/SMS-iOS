import SwiftUI
import FoundationUtil

public struct HighlightedText: View {
    let text: String
    let highlightText: String
    let defaultModifier: (Text) -> Text
    let highlightModifier: (Text) -> Text

    public init(
        _ text: String,
        highlightText: String,
        defaultModifier: @escaping (Text) -> Text,
        highlightModifier: @escaping (Text) -> Text
    ) {
        self.text = text
        self.highlightText = highlightText
        self.defaultModifier = defaultModifier
        self.highlightModifier = highlightModifier
    }

    // swiftlint: disable shorthand_operator
    public var body: some View {
        guard text.isNotEmpty && highlightText.isNotEmpty else { return defaultModifier(Text(text)) }

        var result: Text?
        let parts = text.components(separatedBy: highlightText)
        for index in parts.indices {
            guard var newResult = result else {
                result = defaultModifier(Text(parts[index]))
                if let newResult = result, index != parts.count - 1 {
                    result = newResult + highlightModifier(Text(highlightText))
                }
                continue
            }
            newResult = newResult + defaultModifier(Text(parts[index]))
            if index != parts.count - 1 {
                newResult = newResult + highlightModifier(Text(highlightText))
            }
            result = newResult
        }
        return result ?? defaultModifier(Text(text))
    }
    // swiftlint: enable shorthand_operator
}
