import DesignSystem
import SwiftUI
import StudentDomainInterface
import ViewUtil

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
                    ConditionView(!prize.name.isEmpty) {
                        SMSText(prize.name)
                            .foregroundColor(.sms(.system(.black)))
                    }

                    Spacer()

                    ConditionView(!prize.date.isEmpty) {
                        SMSText(prize.date, font: .caption2)
                            .foregroundColor(.sms(.system(.black)))
                    }
                }

                ConditionView(!prize.type.isEmpty) {
                    SMSText(prize.type, font: .caption2)
                        .foregroundColor(.sms(.neutral(.n40)))
                }
            }
            .padding(8)
        }
    }
}
