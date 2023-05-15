import SwiftUI

public struct TitleWrapperViewModifier: ViewModifier {
    var text: String
    var titlePosition: TitlePosition

    public init(
        _ text: String,
        position: TitlePosition = .top(.leading)
    ) {
        self.text = text
        self.titlePosition = position
    }

    public func body(content: Content) -> some View {
        switch titlePosition {
        case let .top(alignment):
            VStack(alignment: alignment.toSUI, spacing: 8) {
                Text(text)
                    .smsFont(.body2, color: .neutral(.n40))

                content
            }

        case let .bottom(alignment):
            VStack(alignment: alignment.toSUI, spacing: 8) {
                content

                Text(text)
                    .smsFont(.body2, color: .neutral(.n40))
            }
        }
    }
}

public extension View {
    func titleWrapper(
        _ text: String,
        position: TitlePosition = .top(.leading)
    ) -> some View {
        modifier(TitleWrapperViewModifier(text, position: position))
    }
}
