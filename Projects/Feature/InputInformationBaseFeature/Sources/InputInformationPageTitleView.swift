import DesignSystem
import SwiftUI

public struct InputInformationPageTitleView: View {
    let title: String
    let isRequired: Bool
    let pageCount: Int
    let selectedPage: Int

    public init(
        title: String,
        isRequired: Bool = true,
        pageCount: Int,
        selectedPage: Int
    ) {
        self.title = title
        self.isRequired = isRequired
        self.pageCount = pageCount
        self.selectedPage = selectedPage
    }

    public var body: some View {
        VStack(spacing: 16) {

            SMSSeparator()

            HStack(spacing: 4) {

                Text(title)
                    .foregroundColor(.sms(.system(.black)))

                Text("*")
                    .foregroundColor(.sms(.sub(.s2)))
                    .conditional(isRequired)

                Spacer()
            }
            .smsFont(.title1)
            .padding(.horizontal, 20)
        }
    }
}
