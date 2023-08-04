import DesignSystem
import SwiftUI

struct MyPageSchoolLifeView: View {
    let intent: MyPageSchoolLifeIntentProtocol
    let state: MyPageSchoolLifeStateProtocol

    var body: some View {
        Section {
            VStack(spacing: 32) {
                VStack(spacing: 24) {
                    SMSTextField(
                        "인증제 점수 입력",
                        text: Binding(
                            get: { state.gsmScore },
                            set: intent.updateGSMScore(gsmScore:)
                        ),
                        errorText: "인증제 점수를 입력해주세요"
                    )
                    .keyboardType(.numberPad)
                    .titleWrapper("인증제 점수")
                }
            }
        } header: {
            SMSText("학교 생활", font: .title1)
                .aligned(.leading)
                .padding(.vertical)
                .background {
                    Color.sms(.system(.white))
                }
        }
        .padding(.horizontal, 20)
    }
}
