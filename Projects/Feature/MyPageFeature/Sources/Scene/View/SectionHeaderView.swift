import DesignSystem
import SwiftUI

struct SectionHeaderView: View {
    let title: String

    var body: some View {
        SMSText(title, font: .title1)
            .aligned(.leading)
            .padding(.vertical)
            .background {
                Color.sms(.system(.white))
            }
    }
}
