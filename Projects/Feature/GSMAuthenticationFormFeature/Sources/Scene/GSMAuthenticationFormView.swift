import BaseFeature
import SwiftUI
import DesignSystem
import ViewUtil

struct GSMAuthenticationFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @StateObject var container: MVIContainer<GSMAuthenticationFormIntentProtocol, GSMAuthenticationFormStateProtocol>
    var intent: any GSMAuthenticationFormIntentProtocol { container.intent }
    var state: any GSMAuthenticationFormStateProtocol { container.model }

    init(
        container: MVIContainer<GSMAuthenticationFormIntentProtocol, GSMAuthenticationFormStateProtocol>
    ) {
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        ZStack {
            GSMAuthenticationFormBuilderView(uiModel: state.uiModel) { _ in
            }
            .padding(.bottom, safeAreaInsets.bottom + 16)
            .onAppear {
                intent.onAppear()
            }
            .overlay(alignment: .bottom) {
                CTAButton(text: "저장") {
                    intent.saveButtonDidTap(state: state)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            }
            .navigationTitle("인증제")
            .smsBackButton(
                dismiss: dismiss
            )
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
