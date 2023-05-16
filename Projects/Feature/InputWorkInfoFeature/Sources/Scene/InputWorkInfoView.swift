import BaseFeature
import DesignSystem
import SwiftUI

struct InputWorkInfoView: View {
    @StateObject var container: MVIContainer<InputWorkInfoIntentProtocol, InputWorkInfoStateProtocol>
    var intent: any InputWorkInfoIntentProtocol { container.intent }
    var state: any InputWorkInfoStateProtocol { container.model }

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
                        SMSTextField("정규직", text: .constant(""))
                            .disabled(true)
                            .overlay(alignment: .trailing) {
                                SMSIcon(.downChevron)
                                    .padding(.trailing, 12)
                            }
                            .titleWrapper("희망 고용 형태")

                        SMSTextField(
                            "근무 희망 지역 입력",
                            text: Binding(
                                get: { state.workRegion },
                                set: intent.updateWorkRegion(region:)
                            )
                        )
                        .titleWrapper("희망 근무 지역")

                        SMSTextField(
                            "희망 연봉 (10,000원 단위)",
                            text: Binding(
                                get: { state.salary },
                                set: intent.updateSalary(salary:)
                            )
                        )
                        .titleWrapper("희망 연봉")
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
            Text("근무 조건")
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))

            Spacer()

            SMSPageControl(pageCount: 6, selectedPage: 2)
        }
        .smsFont(.title1)
    }
}
