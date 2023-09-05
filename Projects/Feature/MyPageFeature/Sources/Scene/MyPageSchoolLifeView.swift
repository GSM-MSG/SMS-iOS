import DesignSystem
import SwiftUI
import BaseFeature

struct MyPageSchoolLifeView: View {
    @StateObject var container: MVIContainer<MyPageSchoolLifeIntentProtocol, MyPageSchoolLifeStateProtocol>
    var intent: MyPageSchoolLifeIntentProtocol { container.intent }
    var state: MyPageSchoolLifeStateProtocol { container.model }

    init(container: MVIContainer<MyPageSchoolLifeIntentProtocol, MyPageSchoolLifeStateProtocol>) {
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        Section {
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
        } header: {
            SectionHeaderView(title: "학교 생활")
        }
        .padding(.horizontal, 20)
    }
}
