import SwiftUI
import UIKit
import BaseFeature
import ViewUtil
import DesignSystem

struct TextSize: Equatable {
    let index: Int
    let size: CGSize
}

struct TextSizeKey: PreferenceKey {
    typealias Value = [TextSize]

    static var defaultValue: [TextSize] = []

    static func reduce(value: inout [TextSize], nextValue: () -> [TextSize]) {
        value.append(contentsOf: nextValue())
    }
}

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    var intent: any MainIntentProtocol { container.intent }
    var state: any MainStateProtocol { container.model }
    @State var testString: [String] = ["asfds1234", "12313212w33", "43534545"]
    @State private var textSizes: [Int: CGSize] = [:]
    @State private var truncatedIndices: [Int] = []
    @State private var shouldTruncateLastText = false
    @State private var breakIndex = 0
    @State private var textEmpty = false

    var body: some View {
        GeometryReader { proxy in
        VStack {
            HStack(spacing: 16) {
                SMSIcon(.smsLogo, width: 80, height: 29)

                Spacer()

                SMSIcon(.filter)
                    .buttonWrapper { }

                SMSIcon(.profile)
                    .clipShape(Circle())
                    .buttonWrapper { }
            }
            .padding(.horizontal, 20)

            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<1, id: \.self) { index in
                        HStack(spacing: 12) {
                            SMSIcon(.profile, width: 101, height: 101)
                                .cornerRadius(8)

                            VStack(alignment: .leading, spacing: 4) {
                                Text("최형우")
                                    .smsFont(.title2)

                                Text("iOS dev")
                                    .smsFont(.body2)
                                    .padding(.bottom, 16)

                                LazyHStack {
                                    ForEach(testString.indices, id: \.self) { index in
//                                        let text = testString[index]
//                                        let truncatedText = truncateTextIfNeeded(index: index, text: text)
//                                        let text = testString[index]
//                                        let truncatedText = shouldTruncateLastText && index == testString.count - 1 ? "..." : text
//                                        Text(truncatedText)
//                                            .lineLimit(1)
//                                            .smsFont(.body1, color: .neutral(.n40))
//                                            .padding(.horizontal, 12)
//                                            .padding(.vertical, 5.5)
//                                            .background(
//                                                GeometryReader { prxy in
//                                                    Color.sms(.neutral(.n10))
//                                                        .preference(key: TextSizeKey.self, value: [TextSize(index: index, size: prxy.size)])
//                                                }
//                                            )
//                                            .modifier(SizeModifier(index: index, shouldTruncateLastText: $shouldTruncateLastText))
//                                            .cornerRadius(8)
                                        TextWithDynamicSize(text: testString[index], maxWidth: proxy.size.width * 0.592, shouldTruncate: truncatedIndices.contains(index))
                                    }
                                    .frame(maxWidth: proxy.size.width * 0.592)

                                    Spacer()
                                }
                                    .onPreferenceChange(TextSizeKey.self) { textSizes in
                                        DispatchQueue.main.async {
                                            self.textSizes = textSizes.reduce(into: [:]) { result, textSize in
                                                result[textSize.index] = textSize.size
                                            }
                                            updateTruncation(size: proxy.size.width * 0.592)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(16)

                        Divider()
                            .padding(.horizontal, 16)
                        }
                    }
                Spacer()
            }
        }
    }
    
//    func truncateTextIfNeeded(index: Int, text: String, size: CGFloat) -> String {
//        if textSizes.reduce(0, { $0 + $1.value.width }) > size {
//            print("asdf")
//        }
//        let totalWidth = textSizes.reduce(0) { $0 + $1.value.width }
//        print("totalWidth: ", totalWidth)
//        print("size: ", size)
//        print("size * 0.1982: ", size * 0.1982)
//        print("totalsize: ", size - size * 0.1982)
//        if totalWidth > size && index == testString.count - 1 {
//           textSizes = [:]
//            return "..."
//        }
//        return text
//    }
    func truncateTextIfNeeded(index: Int, text: String) -> String {
//        _ = textSizes.reduce(0) { $0 + $1.value.width }
//        && index == testString.count - 1
        if shouldTruncateLastText && breakIndex == index {
            DispatchQueue.main.async {
                self.testString = Array(self.testString[0...index])
            }
            return "..."
        }
        return text
    }
    func updateTruncation(size: CGFloat) {
        var totalWidth: CGFloat = 0
        textSizes
            .sorted(by: ({ $0.key < $1.key }))
            .forEach {
                totalWidth += $1.width
                print("size: ", size - size * 0.1981)
                print("totalWidth: ", totalWidth)
                print(breakIndex)
                if totalWidth >= size - size * 0.1981, breakIndex < $0 - 1 {
                    shouldTruncateLastText = totalWidth > size
                    breakIndex = $0
                }
        }
    }
}

struct TextWithDynamicSize: UIViewRepresentable {
    let text: String
    let maxWidth: CGFloat
    let shouldTruncate: Bool
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        
        let textSize = uiView.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))
        
        if shouldTruncate && textSize.width > maxWidth {
            uiView.text = "..."
        }
    }
}
