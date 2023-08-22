import DesignSystem
import SwiftUI
import ViewUtil
import BaseFeature

struct MyPageMilitaryView: View {
    @StateObject var container: MVIContainer<MyPageMilitaryIntentProtocol, MyPageMilitaryStateProtocol>
    var intent: MyPageMilitaryIntentProtocol { container.intent }
    var state: MyPageMilitaryStateProtocol { container.model }

    init(
        container: MVIContainer<MyPageMilitaryIntentProtocol, MyPageMilitaryStateProtocol>
    ) {
        self._container = StateObject(wrappedValue: container)
    }

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
            SectionHeaderView(title: "병역")
        }
        .padding(.horizontal, 20)
    }
}
