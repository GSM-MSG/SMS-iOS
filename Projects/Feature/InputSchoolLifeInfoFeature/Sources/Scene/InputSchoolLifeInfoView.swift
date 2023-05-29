import BaseFeature
import DesignSystem
import InputInformationBaseFeature
import SwiftUI
import UniformTypeIdentifiers

struct InputSchoolLifeInfoView: View {
    @StateObject var container: MVIContainer<InputSchoolLifeInfoIntentProtocol, InputSchoolLifeInfoStateProtocol>
    var intent: any InputSchoolLifeInfoIntentProtocol { container.intent }
    var state: any InputSchoolLifeInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                SMSSeparator()

                VStack(spacing: 32) {
                    InputInformationPageTitleView(title: "학교 생활", pageCount: 6, selectedPage: 1)

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
                intent.hwpFileDidSelect(url: url)

            case .failure:
                intent.failedToImportHWPFile()
            }
        }
    }
}
