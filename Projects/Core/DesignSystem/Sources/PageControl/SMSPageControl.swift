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

            HStack(spacing: 0) {
                ForEach(0..<selectedPage, id: \.self) { page in
                    let isInitial = page == 0
                    let endCorner: Corners = page == selectedPage ? [.topRight, .bottomRight] : []
                    let corners: Corners = isInitial ? [.topLeft, .bottomLeft] : endCorners

                    Rectacgle()
                        .fill(page <= selectedPage ? Color.sms(.primary(.p2)) : Color.sms(. neutral(.n20)))
                        .frame(height: 12)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(6, corners: corners)
                }
            }
        }
        .padding(2)
        .background(Color.sms(.neutral(.n10)))
        .cornerRadius(20)
    }
}
