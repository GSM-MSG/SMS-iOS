import BaseFeature
import DesignSystem
import SwiftUI

struct InputProfileInfoView: View {
    @StateObject var container: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>
    var intent: any InputProfileInfoIntentProtocol { container.intent }
    var state: any InputProfileInfoStateProtocol { container.model }

    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(spacing: 4) {
                Text("프로필")
                    .foregroundColor(.sms(.system(.black)))

                Text("*")
                    .foregroundColor(.sms(.sub(.s2)))

                Spacer()
            }
            .smsFont(.title1)

            VStack(spacing: 24) {
                SMSTextField("1줄 자기소개입력", text: .constant(""))
                    .titleWrapper("자기소개")

                SMSTextField("공개용 이메일입력", text: .constant(""))
                    .titleWrapper("이메일")

                TitleWrapperView("분야") {
                    SMSTextField("Frontend", text: .constant(""))
                        .disabled(true)
                }

                SMSTextField("https", text: .constant(""))
                    .titleWrapper("포트폴리오 URL")

                SMSTextField("예시) Swift, UIKit, SwiftUI", text: .constant(""))
                    .titleWrapper("세부스택")
            }
        }
    }
}
