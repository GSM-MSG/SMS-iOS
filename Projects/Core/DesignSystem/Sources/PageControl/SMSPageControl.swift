import SwiftUI

public struct SMSPageControl: View {
    var pageCount: Int
    var selectedPage: Int

    public init(pageCount: Int, selectedPage: Int) {
        self.pageCount = pageCount
        self.selectedPage = selectedPage
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 40) {
                ForEach(0..<pageCount, id: \.self) { _ in
                    Circle()
                        .fill(Color.sms(.neutral(.n20)))
                        .frame(width: 8, height: 8)
                }
                .frame(height: 12)
            }

            RoundedRectangle(cornerRadius: 100, style: .circular)
                .fill(Color.sms(.primary(.p2)))
                .frame(width: CGFloat(12 + 48 * selectedPage), height: 12)
        }
        .padding(2)
        .background(Color.sms(.neutral(.n10)))
        .cornerRadius(20)
    }
}
