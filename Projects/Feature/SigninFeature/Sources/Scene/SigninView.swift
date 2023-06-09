import SwiftUI
import BaseFeature
import DesignSystem
import GlobalThirdPartyLibrary
import ViewUtil
import UtilityModule

struct SigninView: View {
    @Environment(\.openURL) var openURL
    @StateObject var container: MVIContainer<SigninIntentProtocol, SigninStateProtocol>
    var intent: any SigninIntentProtocol { container.intent }
    var state: any SigninStateProtocol { container.model }

    var body: some View {
        VStack(spacing: 0) {
            Text("STUDENT\nMANAGEMENT\nSERVICE")
                .multilineTextAlignment(.center)
                .padding(.top, 124)
                .font(.sms(.headline2))
                .foregroundColor(.sms(.system(.white)))

            Text("학생 정보 통합관리 서비스")
                .font(.sms(.title2))
                .foregroundColor(.sms(.system(.white)))
                .padding(.top, 16)

            Spacer()

            GAuthButtonView { code in
                container.intent.signin(code: code)
            }
            .padding(.horizontal, 20)
            .frame(height: 50)
            .padding(.bottom, 16)

            HStack(spacing: 16) {
                Text("게스트로 둘러보기")
                    .underline()
                    .buttonWrapper {
                        intent.guestSigninButtonDidTap()
                    }

                Text("약관 보기")
                    .underline()
                    .buttonWrapper {
                        let privacyURLString =
                        "https://www.notion.so/matsogeum/b84900a818ce4bf3a5741b0a0507053f?pvs=4"
                        guard let privacyURL = URL(string: privacyURLString) else { return }
                        openURL(privacyURL)
                    }
            }
            .smsFont(.body2, color: .system(.white))
            .padding(.bottom, 32)
        }
        .background {
            SMSImage(.background)
                .ignoresSafeArea()
        }
        .alert(
            "알수없는 에러가 발생했습니다. 잠시 후 다시 시도해 주세요.",
            isPresented: Binding(get: { state.isError }, set: { _ in })
        ) {
            Button("확인", role: .cancel) { }
        }
    }
}
