import BaseFeature
import DesignSystem
import SwiftUI

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
                        VStack(spacing: 12) {
                            ForEach(state.certificates.indices, id: \.self) { index in
                                HStack(spacing: 16) {
                                    SMSTextField(
                                        "정보처리산업기사",
                                        text: Binding(
                                            get: { state.certificates[index] },
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
                        .titleWrapper("자격증")
                    }
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
}
