import BaseFeature
import DesignSystem
import SwiftUI

struct InputProfileInfoView: View {
    @StateObject var container: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>
    var intent: any InputProfileInfoIntentProtocol { container.intent }
    var state: any InputProfileInfoStateProtocol { container.model }

    var body: some View {
        SMSNavigationTitleView(title: "정보입력") {
            ScrollView(showsIndicators: false) {
                Rectangle()
                    .fill(Color.sms(.neutral(.n10)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 16)

                VStack(spacing: 32) {
                    HStack(spacing: 4) {
                        Text("프로필")
                            .foregroundColor(.sms(.system(.black)))

                        Text("*")
                            .foregroundColor(.sms(.sub(.s2)))

                        Spacer()

                        SMSPageControl(pageCount: 6, selectedPage: 0)
                    }
                    .smsFont(.title1)

                    VStack(alignment: .leading, spacing: 24) {
                        ZStack(alignment: .bottomTrailing) {
                            SMSIcon(.profile, width: 100, height: 100)

                            SMSIcon(.profileSmallPlus)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 7)
                                        .strokeBorder(Color.sms(.system(.white)), lineWidth: 4)
                                }
                                .offset(x: 5, y: 4)
                        }
                        .titleWrapper("사진")

                        SMSTextField(
                            "1줄 자기소개입력",
                            text: Binding(get: { state.introduce }, set: intent.updateIntroduce(introduce:))
                        )
                        .titleWrapper("자기소개")

                        SMSTextField(
                            "공개용 이메일입력",
                            text: Binding(get: { state.email }, set: intent.updateEmail(email:))
                        )
                        .titleWrapper("이메일")

                        SMSTextField(
                            "Frontend",
                            text: Binding(get: { state.major }, set: intent.updateMajor(major:))
                        )
                        .disabled(true)
                        .overlay(alignment: .trailing) {
                            SMSIcon(.downChevron)
                                .padding(.trailing, 12)
                        }
                        .titleWrapper("분야")
                        .onTapGesture {
                            intent.majorSheetIsRequired()
                        }

                        SMSTextField(
                            "https",
                            text: Binding(get: { state.portfolioURL }, set: intent.updatePortfolioURL(portfolioURL:))
                        )
                        .titleWrapper("포트폴리오 URL")

                        SMSTextField(
                            "예시) Swift, UIKit, SwiftUI",
                            text: Binding(get: { state.techStack }, set: intent.updateTechStack(techStack:))
                        )
                        .titleWrapper("세부스택")
                    }

                    CTAButton(text: "다음")
                        .padding(.bottom, 32)
                }
                .padding([.top, .horizontal], 20)
            }
        }
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedMajorSheet },
                set: { _ in intent.majorSheetDismissed() }
            )
        ) {
            Text("ASDAF")
        }
        .animation(.default, value: state.isPresentedMajorSheet)
    }
}
