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
                                get: { state.authenticationScore },
                                set: intent.updateAuthenticationScore(score:)
                            ),
                            errorText: "인증제 점수를 입력해주세요",
                            isError: state.errorField.contains(.gsmAuthentication)
                        )
                        .keyboardType(.numberPad)
                        .titleWrapper("인증제 점수")

                        SMSTextField(
                            "+ hwp 파일 추가",
                            text: Binding(
                                get: { state.hwpFilename },
                                set: { _ in }
                            ),
                            errorText: "hwp, hwpx 확장자인 파일만 가능해요",
                            isError: state.errorField.contains(.hwp)
                        )
                        .disabled(true)
                        .titleWrapper("드림북")
                        .onTapGesture {
                            intent.hwpFileImporterIsRequred()
                        }
                    }

                    Spacer()

                    HStack(spacing: 8) {
                        CTAButton(text: "이전", style: .outline) {
                            intent.prevButtonDidTap()
                        }
                        .frame(maxWidth: proxy.size.width / 3)

                        CTAButton(text: "다음") {
                            intent.nextButtonDidTap(state: state)
                        }
                        .disabled(state.isDisabledNextButton)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 32)
                }
                .padding([.top, .horizontal], 20)
            }
        }
        .hideKeyboardWhenTap()
        .fileImporter(
            isPresented: Binding(
                get: { state.isPresentedHWPFileImporter },
                set: { _ in intent.hwpFileImporterDismissed() }
            ),
            allowedContentTypes: [
                UTType(filenameExtension: "hwp") ?? .pdf,
                UTType(filenameExtension: "hwpx") ?? .pdf
            ]
        ) { result in
            switch result {
            case let .success(url):
                guard url.startAccessingSecurityScopedResource() else { return }
                intent.hwpFileDidSelect(url: url)

            case .failure:
                intent.failedToImportHWPFile()
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
