import SwiftUI
import BaseFeature
import DesignSystem
import InputInformationBaseFeature
import FoundationUtil
import DateUtil
import ViewUtil

struct InputPrizeInfoView: View {
    @StateObject var container: MVIContainer<InputPrizeInfoIntentProtocol, InputPrizeInfoStateProtocol>
    var intent: any InputPrizeInfoIntentProtocol { container.intent }
    var state: any InputPrizeInfoStateProtocol { container.model }

    var body: some View {
        SMSNavigationTitleView(title: "수상") {
            GeometryReader { geometry in
                ScrollView(showsIndicators: true) {
                    SMSSeparator()

                    VStack(spacing: 32) {
                        InputInformationPageTitleView(title: "수상", isRequired: false, pageCount: 8, selectedPage: 7)

                        VStack(spacing: 24) {
                            ForEach(state.prizeList.indices, id: \.self) { index in
                                prizeListRowView(index: index, geometry: geometry)

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

                        HStack(spacing: 8) {
                            CTAButton(text: "이전", style: .outline) {
                                intent.prevButtonDidTap()
                            }
                            .frame(maxWidth: geometry.size.width / 3)

                            CTAButton(text: "완료") {
                                intent.completeButtonDidTap(prizes: state.prizeList)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.bottom, 32)

                    }
                    .padding([.top, .horizontal], 20)
                }
            }
        }
        .datePicker(
            isShowing: Binding(
                get: { state.isPresentedPrizeAtDatePicker },
                set: { _ in intent.prizeAtDismissed() }
            )
        ) { date in
            intent.prizePrizeAtDidSelect(index: state.focusedPrizeIndex, prizeAt: date)
        }
    }

    @ViewBuilder
    func prizeListRowView(index: Int, geometry: GeometryProxy) -> some View {
        let collapsed = state.collapsedPrize[safe: index] ?? false
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 16) {
                SMSText("수상", font: .title1)
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

            ConditionView(!collapsed) {
                prizeName(index: index)

                prizePrize(index: index)

                prizePrizeAt(index: index)
            }
        }
    }
}

private extension InputPrizeInfoView {
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
        .frame(maxWidth: .infinity)
        .titleWrapper("수상 일자")
    }
}
