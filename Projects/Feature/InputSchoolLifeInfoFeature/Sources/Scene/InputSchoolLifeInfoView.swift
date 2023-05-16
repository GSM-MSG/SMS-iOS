import BaseFeature
import DesignSystem
import SwiftUI
import UniformTypeIdentifiers

struct InputSchoolLifeInfoView: View {
    @StateObject var container: MVIContainer<InputSchoolLifeInfoIntentProtocol, InputSchoolLifeInfoStateProtocol>
    var intent: any InputSchoolLifeInfoIntentProtocol { container.intent }
    var state: any InputSchoolLifeInfoStateProtocol { container.model }

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
                        SMSTextField(
                            "인증제 점수 입력",
                            text: Binding(
                                get: { state.authenticationScroe },
                                set: intent.updateAuthenticationScore(score:)
                            )
                        )
                        .keyboardType(.numberPad)
                        .titleWrapper("인증제 점수")

                        SMSTextField("+ hwp 파일 추가", text: .constant(""))
                            .disabled(true)
                            .titleWrapper("드림북")
                            .onTapGesture {
                                intent.hwpFilImporterIsRequred()
                            }
                    }

                    Spacer()

                    HStack(spacing: 8) {
                        CTAButton(text: "이전", style: .outline) {
                            intent.prevButtonDidTap()
                        }
                        .frame(maxWidth: proxy.size.width / 3)

                        CTAButton(text: "다음") {
                            intent.nextButtonDidTap()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 32)
                }
                .padding([.top, .horizontal], 20)
            }
        }
        .fileImporter(
            isPresented: Binding(
                get: { state.isPresentedHWPFileImporter },
                set: { _ in intent.hwpFilImporterDismissed() }
            ),
            allowedContentTypes: [
                UTType(filenameExtension: "hwp") ?? .pdf,
                UTType(filenameExtension: "hwpx") ?? .pdf
            ]
        ) { result in
            switch result {
            case let .success(url):
                print(url)

            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    @ViewBuilder
    func pageTitleView() -> some View {
        HStack(spacing: 4) {
            Text("학교 생활")
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))

            Spacer()

            SMSPageControl(pageCount: 6, selectedPage: 1)
        }
        .smsFont(.title1)
    }
}
