import BaseFeature
import InputInformationBaseFeature
import DesignSystem
import SwiftUI
import ViewUtil

struct InputAuthenticationView: View {
    @State var title = ""
    @StateObject var container: MVIContainer<InputAuthenticationIntentProtocol, InputAuthenticationStateProtocol>
    var intent: any InputAuthenticationIntentProtocol { container.intent }
    var state: any InputAuthenticationStateProtocol { container.model }

    var body: some View {
        SMSNavigationTitleView(title: "인증제") {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(state.authenticationList.indices, id: \.self) { index in
                        SMSSeparator()

                        authenticationPageView(index: index)
                    }
                    .padding(.top, 16)

                    CTAButton(text: "저장")
                        .padding(.top, 16)
                        .padding(.horizontal, 20)
                }
            }
        }
        .onAppear {
            if state.authenticationList.isEmpty {
                intent.authenticationAppendButtonDidTap()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SMSIcon(.plus)
                    .onTapGesture {
                        intent.authenticationAppendButtonDidTap()
                    }
            }
        }
    }

    @ViewBuilder
    func authenticationPageView(index: Int) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 4) {
                Text("인증제")
                    .foregroundColor(.sms(.system(.black)))

                Text("*")
                    .foregroundColor(.sms(.sub(.s2)))

                Spacer()
            }
            .smsFont(.title1)
            .padding(.top, 16)

            VStack(spacing: 24) {
                HStack {
                    authenticationImage(index: index)

                    Spacer()
                }

                authenticationTitle(index: index)

                authenticationContent(index: index)
            }
        }
        .padding(.horizontal, 20)
    }
}

private extension InputAuthenticationView {
    @ViewBuilder
    func authenticationImage(index: Int) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.sms(.neutral(.n10)))
            .frame(width: 108, height: 108)
            .overlay {
                SMSIcon(.photo)
            }
            .titleWrapper("사진")
    }

    @ViewBuilder
    func authenticationTitle(index: Int) -> some View {
        SMSTextField(
            "활동 제목 입력",
            text: Binding(
                get: { state.authenticationList[safe: index]?.title ?? "" },
                set: { intent.updateAuthenticationTitle(index: index, title: $0)}
            )
        )
        .titleWrapper("활동 제목")
    }

    @ViewBuilder
    func authenticationContent(index: Int) -> some View {
        SMSTextEditor(
            "활동에 대한 자세한 설명 입력",
            text: Binding(
                get: { state.authenticationList[safe: index]?.content ?? "" },
                set: { intent.updateAuthenticationContent(index: index, content: $0)}
            )
        )
        .titleWrapper("활동 설명")
    }
}
