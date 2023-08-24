import BaseFeature
import DesignSystem
import SwiftUI
import ViewUtil

struct MyPageCertificateView: View {
    @StateObject var container: MVIContainer<MyPageCertificateIntentProtocol, MyPageCertificateStateProtocol>
    var intent: MyPageCertificateIntentProtocol { container.intent }
    var state: MyPageCertificateStateProtocol { container.model }

    init(container: MVIContainer<MyPageCertificateIntentProtocol, MyPageCertificateStateProtocol>) {
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        Section {
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
        } header: {
            SectionHeaderView(title: "자격증")
        }
        .padding(.horizontal, 20)
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
