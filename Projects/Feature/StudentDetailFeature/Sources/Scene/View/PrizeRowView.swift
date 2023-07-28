import DesignSystem
import SwiftUI
import StudentDomainInterface

struct PrizeRowView: View {
    let prize: PrizeEntity

    init(prize: PrizeEntity) {
        self.prize = prize
    }

    var body: some View {
        ZStack {
            Color.sms(.neutral(.n10))
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    SMSText(prize.name)
                        .foregroundColor(.sms(.system(.black)))

                    Spacer()

                    SMSText(prize.date, font: .caption2)
                        .foregroundColor(.sms(.system(.black)))
                }

                SMSText(prize.type, font: .caption2)
                    .foregroundColor(.sms(.neutral(.n40)))
            }
            .padding(8)
        }
    }
}
