import BaseFeature
import DesignSystem
import SwiftUI

struct InputMilitaryInfoView: View {
    @StateObject var container: MVIContainer<InputMilitaryInfoIntentProtocol, InputMilitaryInfoStateProtocol>
    var intent: any InputMilitaryInfoIntentProtocol { container.intent }
    var state: any InputMilitaryInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                Rectangle()
                    .fill(Color.sms(.neutral(.n10)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 16)

                VStack(spacing: 32) {
                    pageTitleView()

                    VStack(spacing: 24) {
                        SMSTextField("병특 희망", text: .constant(""))
                            .disabled(true)
                            .overlay(alignment: .trailing) {
                                SMSIcon(.downChevron)
                                    .padding(.trailing, 12)
                            }
                            .titleWrapper("병특 희망 여부")
                    }

                    Spacer()

                    HStack(spacing: 8) {
                        CTAButton(text: "이전", style: .outline)
                            .frame(maxWidth: proxy.size.width / 3)

                        CTAButton(text: "다음")
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 32)
                }
                .padding([.top, .horizontal], 20)
            }
        }
    }

    @ViewBuilder
    func pageTitleView() -> some View {
        HStack(spacing: 4) {
            Text("병역")
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))

            Spacer()

            SMSPageControl(pageCount: 6, selectedPage: 3)
        }
        .smsFont(.title1)
    }
}
