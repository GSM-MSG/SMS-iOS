import SwiftUI

public struct SMSPageControl: View {
    var pageCount: Int
    var selectedPage: Int

    public init(pageCount: Int, selectedPage: Int) {
        self.pageCount = pageCount
        self.selectedPage = selectedPage
    }

    public var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<pageCount, id: \.self) { page in
                Circle()
                    .fill(selectedPage == page ? Color.sms(.primary(.p2)) : .sms(.neutral(.n20)))
                    .frame(width: 8, height: 8)
            }
        }
    }
}
