import BaseFeature
import DesignSystem
import SwiftUI

struct InputProfileInfoView: View {
    @StateObject var container: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>
    var intent: any InputProfileInfoIntentProtocol { container.intent }
    var state: any InputProfileInfoStateProtocol { container.model }

    var body: some View {
        ScrollView(showsIndicators: false) {
            Rectangle()
                .fill(Color.sms(.neutral(.n10)))
                .frame(maxWidth: .infinity)
                .frame(height: 16)

            VStack(spacing: 32) {
                HStack(spacing: 4) {
                    Text("프로필")
                        .foregroundColor(.sms(.system(.black)))

                    Text("*")
                        .foregroundColor(.sms(.sub(.s2)))

                    Spacer()

                    SMSPageControl(pageCount: 6, selectedPage: 0)
                }
                .smsFont(.title1)

                VStack(alignment: .leading, spacing: 24) {
                    ZStack(alignment: .bottomTrailing) {
                        SMSIcon(.profile, width: 100, height: 100)

                        SMSIcon(.profileSmallPlus)
                            .overlay {
                                RoundedRectangle(cornerRadius: 7)
                                    .strokeBorder(Color.sms(.system(.white)), lineWidth: 4)
                            }
                            .offset(x: 5, y: 4)
                    }
                    .titleWrapper("사진")

                    SMSTextField("1줄 자기소개입력", text: .constant(""))
                        .titleWrapper("자기소개")

                    SMSTextField("공개용 이메일입력", text: .constant(""))
                        .titleWrapper("이메일")

                    TitleWrapperView("분야") {
                        SMSTextField("Frontend", text: .constant(""))
                            .disabled(true)
                            .overlay(alignment: .trailing) {
                                SMSIcon(.downChevron)
                                    .padding(.trailing, 12)
                            }
                    }

                    SMSTextField("https", text: .constant(""))
                        .titleWrapper("포트폴리오 URL")

                    SMSTextField("예시) Swift, UIKit, SwiftUI", text: .constant(""))
                        .titleWrapper("세부스택")
                }

                CTAButton(text: "다음")
                    .padding(.bottom, 32)
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
        }
        .navigationTitle("정보입력")
        .navigationBarTitleDisplayMode(.inline)
    }
}
