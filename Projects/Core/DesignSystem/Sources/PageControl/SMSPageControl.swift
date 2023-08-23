import SwiftUI
import UIKit

public struct SMSPageControl: View {
    var pageCount: Int
    var selectedPage: Int

    public init(pageCount: Int, selectedPage: Int) {
        self.pageCount = pageCount
        self.selectedPage = selectedPage
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                let spacing = CGFloat((Int(geometry.size.width) - (pageCount * 8)) / (pageCount - 1))
                HStack(spacing: spacing) {
                    ForEach(0..<pageCount, id: \.self) { _ in
                        Circle()
                            .fill(Color.sms(.neutral(.n20)))
                            .frame(width: 8, height: 8)
                    }
                    .frame(height: 12)
                }

                Capsule()
                    .fill(Color.sms(.primary(.p2)))
                    .frame(width: CGFloat(12 + Int(geometry.size.width) / (pageCount - 1) * selectedPage), height: 12)
            }
            .padding(2)
            .background(Color.sms(.neutral(.n10)))
            .cornerRadius(20)
        }
        .frame(height: 12)
    }
}
