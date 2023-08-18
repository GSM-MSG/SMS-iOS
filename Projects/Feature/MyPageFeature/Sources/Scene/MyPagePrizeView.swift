import BaseFeature
import DesignSystem
import SwiftUI
import ViewUtil

struct MyPagePrizeView: View {
    @StateObject var container: MVIContainer<MyPagePrizeIntentProtocol, MyPagePrizeStateProtocol>
    var intent: MyPagePrizeIntentProtocol { container.intent }
    var state: MyPagePrizeStateProtocol { container.model }

    init(container: MVIContainer<MyPagePrizeIntentProtocol, MyPagePrizeStateProtocol>) {
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        Section {
            VStack(spacing: 24) {
                ForEach(state.prizeList.indices, id: \.self) { index in
                    prizeListRowView(index: index)

                    SMSSeparator(height: 1)
                }
            }

            SMSChip("추가") {
                withAnimation {
                    intent.prizeAppendButtonDidTap()
                }
            }
            .foregroundColor(.sms(.system(.black)))
            .aligned(.trailing)
        } header: {
            SectionHeaderView(title: "수상")
        }
        .padding(.horizontal, 20)
    }

    @ViewBuilder
    func prizeListRowView(index: Int) -> some View {
        let collapsed = state.collapsedPrize[safe: index] ?? false
        Section {
            ConditionView(!collapsed) {
                prizeName(index: index)

                prizePrize(index: index)

                prizePrizeAt(index: index)
            }
        } header: {
            HStack(spacing: 16) {
                SMSText(state.prizeList[safe: index]?.name ?? "", font: .title1)
                    .foregroundColor(.sms(.system(.black)))

                Spacer()

                SMSIcon(.downChevron)
                    .rotationEffect(collapsed ? .degrees(90) : .degrees(0))
                    .buttonWrapper {
                        intent.prizeToggleButtonDidTap(index: index)
                    }

                SMSIcon(.xmarkOutline)
                    .buttonWrapper {
                        intent.prizeRemoveButtonDidTap(index: index)
                    }
            }
            .padding(.bottom, 8)
        }
    }

    @ViewBuilder
    func prizeName(index: Int) -> some View {
        SMSTextField(
            "수상 내역 이름입력",
            text: Binding(
                get: { state.prizeList[safe: index]?.name ?? "" },
                set: { intent.updatePrizeName(index: index, name: $0) }
            )
        )
        .titleWrapper("이름")
    }

    @ViewBuilder
    func prizePrize(index: Int) -> some View {
        SMSTextField(
            "수상 종류입력",
            text: Binding(
                get: { state.prizeList[safe: index]?.prize ?? "" },
                set: { intent.updatePrizePrize(index: index, prize: $0)}
            )
        )
        .titleWrapper("종류")
    }

    @ViewBuilder
    func prizePrizeAt(index: Int) -> some View {
        let prize = state.prizeList[safe: index]
        DatePickerField(dateText: prize?.prizeAtString ?? "") {
            intent.prizeAtButtonDidTap(index: index)
        }
        .titleWrapper("수상 일자")
    }
}
