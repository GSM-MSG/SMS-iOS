import SwiftUI

public struct SMSSegmentedControl: View {
    @State private var selectedIndex = 0
    @Namespace private var segmentNamespace
    private let options: [String]
    private let onSelect: (String) -> Void

    public init(
        options: [String],
        onSelect: @escaping (String) -> Void
    ) {
        self.options = options
        self.onSelect = onSelect
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<options.count, id: \.self) { index in
                let isSelected = selectedIndex == index
                SMSText(options[index], font: .title2)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 9.5)
                    .background {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.sms(.primary(.p2)))
                                .matchedGeometryEffect(
                                    id: "SEGMENTED_CONTROL",
                                    in: segmentNamespace
                                )
                        }
                    }
                    .foregroundStyle(
                        self.selectedIndex == index ? Color.sms(.system(.white)) : Color.sms(.neutral(.n40))
                    )
                    .padding(4)
                    .buttonWrapper {
                        withAnimation(.interactiveSpring(duration: 0.5)) {
                            self.selectedIndex = index
                        }
                    }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.sms(.neutral(.n10)))
        }
        .padding()
    }
}

