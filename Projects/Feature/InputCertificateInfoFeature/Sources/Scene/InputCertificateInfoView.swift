import BaseFeature
import DesignSystem
import FoundationUtil
import InputInformationBaseFeature
import SwiftUI
import ViewUtil

struct InputCertificateInfoView: View {
    @StateObject var container: MVIContainer<InputCertificateInfoIntentProtocol, InputCertificateInfoStateProtocol>
    var intent: any InputCertificateInfoIntentProtocol { container.intent }
    var state: any InputCertificateInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                ScrollView(showsIndicators: false) {
                    SMSSeparator()

                    VStack(spacing: 32) {
                        InputInformationPageTitleView(
                            title: "자격증",
                            isRequired: false,
                            pageCount: 7,
                            selectedPage: 4
                        )

                        VStack(spacing: 8) {
                            certificateListView()
                                .titleWrapper("자격증")
                                .aligned(.leading)

                            SMSChip("추가") {
                                intent.certificateAppendButtonDidTap()
                            }
                            .aligned(.leading)
                        }
                        .animation(.default, value: state.certificates.count)
                    }
                    .padding([.top, .horizontal], 20)
                }

                HStack(spacing: 8) {
                    CTAButton(text: "이전", style: .outline) {
                        intent.prevButtonDidTap()
                    }
                    .frame(maxWidth: proxy.size.width / 3)

                    CTAButton(text: "다음") {
                        intent.nextButtonDidTap(certificates: state.certificates)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 32)
                .padding(.horizontal, 20)
            }
        }
        .hideKeyboardWhenTap()
    }

    @ViewBuilder
    func certificateListView() -> some View {
        VStack(spacing: 12) {
            ForEach(state.certificates.indices, id: \.self) { index in
                HStack(spacing: 16) {
                    SMSTextField(
                        "정보처리산업기사",
                        text: Binding(
                            get: { state.certificates[safe: index] ?? "" },
                            set: { intent.updateCertificate(certificate: $0, at: index) }
                        )
                    )

                    Button {
                        intent.deleteCertificateColumn(at: index)
                    } label: {
                        SMSIcon(.trash)
                    }
                }
            }
        }
    }
}
