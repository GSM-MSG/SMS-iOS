import DesignSystem
import SwiftUI
import ViewUtil

struct MyPageMilitaryView: View {
    let intent: MyPageMilitaryIntentProtocol
    let state: MyPageMilitaryStateProtocol

    var body: some View {
        Section {
            VStack(spacing: 24) {
                SMSTextField(
                    "병특 희망",
                    text: Binding(
                        get: { state.selectedMilitaryServiceType.display() },
                        set: { _ in }
                    ),
                    isOnClear: false
                )
                .disabled(true)
                .overlay(alignment: .trailing) {
                    SMSIcon(.downChevron)
                        .padding(.trailing, 12)
                }
                .titleWrapper("병특 희망 여부")
                .onTapGesture {
                    intent.militarySheetIsRequired()
                }
            }
        } header: {
            SectionHeaderView(title: "학교 생활")
        }
        .padding(.horizontal, 20)
    }
}
