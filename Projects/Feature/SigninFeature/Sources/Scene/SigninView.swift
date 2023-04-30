import SwiftUI
import BaseFeature
import DesignSystem
import GlobalThirdPartyLibrary
import ViewUtil
import UtilityModule

struct SigninView: View {
    @StateObject var container: MVIContainer<SigninIntentProtocol, SigninStateProtocol>
    var intent: any SigninIntentProtocol { container.intent }
    var state: any SigninStateProtocol { container.model }

    var body: some View {
        VStack(spacing: 0) {
            Text("Student\nManagement\nService")
                .multilineTextAlignment(.center)
                .padding(.top, 124)
                .font(.sms(.headline1))
                .foregroundColor(.sms(.system(.white)))

            Text("학생 정보 통합관리 서비스")
                .font(.sms(.title2))
                .foregroundColor(.sms(.system(.white)))
                .padding(.top, 16)

            Spacer()

            HStack {
                GAuthButtonView { code in
                    container.intent.signin(code: code)
                }
                .padding(.horizontal, 20)
                .frame(height: 50)
                .padding(.bottom, 88)
            }
        }
        .background {
            SMSImage(.background)
        }
        .ignoresSafeArea()
        .alert(
            "알수없는 에러가 발생했습니다. 잠시 후 다시 시도해 주세요.",
            isPresented: Binding(get: { state.isError }, set: { _ in })
        ) {
            Button("확인", role: .cancel) { }
        }
    }
}
