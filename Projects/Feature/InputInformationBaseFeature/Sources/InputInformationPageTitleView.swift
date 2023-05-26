import DesignSystem
import SwiftUI

public struct InputInformationPageTitleView: View {
    let title: String
    let isRequired: Bool
    let pageCount: Int
    let selectedPage: Int

    public init(
        title: String,
        isRequired: Bool,
        pageCount: Int,
        selectedPage: Int
    ) {
        self.title = title
        self.isRequired = isRequired
        self.pageCount = pageCount
        self.selectedPage = selectedPage
    }

    public var body: some View {
        HStack(spacing: 4) {
            Text(title)
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))
                .conditional(isRequired)

            Spacer()

            SMSPageControl(pageCount: pageCount, selectedPage: selectedPage)
        }
        .smsFont(.title1)
    }
}
