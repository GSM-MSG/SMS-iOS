import SwiftUI

public struct SMSSegmentedControl: View {
    @Namespace private var segmentNamespace
    private let options: [String]
    private let selectedOption: String?
    private let onSelect: (String) -> Void

    public init(
        options: [String],
        selectedOption: String? = nil,
        onSelect: @escaping (String) -> Void
    ) {
        self.options = options
        self.selectedOption = selectedOption
        self.onSelect = onSelect
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<options.count, id: \.self) { index in
                let option = options[index]
                let isSelected = options[index] == selectedOption
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
                        isSelected ? Color.sms(.system(.white)) : Color.sms(.neutral(.n40))
                    )
                    .padding(4)
                    .buttonWrapper {
                        withAnimation(.interactiveSpring(duration: 0.5)) {
                            onSelect(option)
                        }
                    }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.sms(.neutral(.n10)))
        }
    }
}

