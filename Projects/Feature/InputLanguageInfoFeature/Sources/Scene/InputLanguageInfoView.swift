import BaseFeature
import DesignSystem
import FoundationUtil
import SwiftUI
import ViewUtil

struct InputLanguageInfoView: View {
    @StateObject var container: MVIContainer<InputLanguageInfoIntentProtocol, InputLanguageInfoStateProtocol>
    var intent: any InputLanguageInfoIntentProtocol { container.intent }
    var state: any InputLanguageInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                ScrollView(showsIndicators: false) {
                    Rectangle()
                        .fill(Color.sms(.neutral(.n10)))
                        .frame(maxWidth: .infinity)
                        .frame(height: 16)

                    VStack(spacing: 32) {
                        pageTitleView()

                        languageListView(proxy: proxy)
                    }
                    .padding([.top, .horizontal], 20)
                }
                .padding(.bottom, 12)

                HStack(spacing: 8) {
                    CTAButton(text: "이전", style: .outline) {
                        intent.prevButtonDidTap()
                    }
                    .frame(maxWidth: proxy.size.width / 3)

                    CTAButton(text: "입력 완료") {
                        intent.completeButtonDidTap(languages: state.languageList)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
    }

    @ViewBuilder
    func pageTitleView() -> some View {
        HStack(spacing: 4) {
            Text("외국어")
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))

            Spacer()

            SMSPageControl(pageCount: 6, selectedPage: 5)
        }
        .smsFont(.title1)
    }

    @ViewBuilder
    func languageListView(proxy: GeometryProxy) -> some View {
        VStack(spacing: 8) {
            ForEach(state.languageList.indices, id: \.self) { index in
                HStack(spacing: 16) {
                    SMSTextField(
                        "예) 토익",
                        text: Binding(
                            get: { state.languageList[safe: index]?.languageName ?? "" },
                            set: { intent.updateLanguageName(name: $0, at: index) }
                        )
                    )
                    .frame(maxWidth: .infinity)

                    SMSTextField(
                        "900",
                        text: Binding(
                            get: { state.languageList[safe: index]?.languageScore ?? "" },
                            set: { intent.updateLanguageScore(score: $0, at: index) }
                        )
                    )
                    .frame(maxWidth: proxy.size.width / 4)

                    Button {
                        intent.deleteLanguage(at: index)
                    } label: {
                        SMSIcon(.trash)
                    }
                }
            }
            .titleWrapper("외국어")
            .aligned(.leading)

            SMSChip("추가") {
                intent.languageAppendButtonDidTap()
            }
            .aligned(.leading)
        }
        .animation(.default, value: state.languageList.count)
    }
}
