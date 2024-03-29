import BaseFeature
import DesignSystem
import FoundationUtil
import InputInformationBaseFeature
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
                    InputInformationPageTitleView(
                        title: "외국어",
                        isRequired: false,
                        pageCount: 8,
                        selectedPage: 5
                    )

                    VStack(spacing: 32) {
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

                    CTAButton(text: "다음") {
                        intent.completeButtonDidTap(languages: state.languageList)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
        .hideKeyboardWhenTap()
    }

    @ViewBuilder
    func languageListView(proxy: GeometryProxy) -> some View {
        VStack(spacing: 8) {
            ForEach(state.languageList.indices, id: \.self) { index in
                HStack(spacing: 16) {
                    SMSTextField(
                        "예) 영어, 토익",
                        text: Binding(
                            get: { state.languageList[safe: index]?.languageName ?? "" },
                            set: { intent.updateLanguageName(name: $0, at: index) }
                        )
                    )
                    .frame(maxWidth: .infinity)

                    SMSTextField(
                        "원어민수준",
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
