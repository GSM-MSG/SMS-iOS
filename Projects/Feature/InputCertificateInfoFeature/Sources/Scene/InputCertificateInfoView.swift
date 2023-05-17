import BaseFeature
import DesignSystem
import FoundationUtil
import SwiftUI
import ViewUtil

struct InputCertificateInfoView: View {
    @StateObject var container: MVIContainer<InputCertificateInfoIntentProtocol, InputCertificateInfoStateProtocol>
    var intent: any InputCertificateInfoIntentProtocol { container.intent }
    var state: any InputCertificateInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                Rectangle()
                    .fill(Color.sms(.neutral(.n10)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 16)

                VStack(spacing: 32) {
                    pageTitleView()

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
            Text("자격증")
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))

            Spacer()

            SMSPageControl(pageCount: 6, selectedPage: 4)
        }
        .smsFont(.title1)
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
