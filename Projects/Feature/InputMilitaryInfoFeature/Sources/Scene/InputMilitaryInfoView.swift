import BaseFeature
import DesignSystem
import SwiftUI
import StudentDomainInterface

struct InputMilitaryInfoView: View {
    @StateObject var container: MVIContainer<InputMilitaryInfoIntentProtocol, InputMilitaryInfoStateProtocol>
    var intent: any InputMilitaryInfoIntentProtocol { container.intent }
    var state: any InputMilitaryInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                Rectangle()
                    .fill(Color.sms(.neutral(.n10)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 16)

                VStack(spacing: 32) {
                    pageTitleView()

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

                    Spacer()

                    HStack(spacing: 8) {
                        CTAButton(text: "이전", style: .outline) {
                            intent.prevButtonDidTap()
                        }
                        .frame(maxWidth: proxy.size.width / 3)

                        CTAButton(text: "다음") {
                            intent.nextButtonDidTap(type: state.selectedMilitaryServiceType)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 32)
                }
                .padding([.top, .horizontal], 20)
            }
        }
        .hideKeyboardWhenTap()
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedMilitarySheet },
                set: { _ in intent.militarySheetDismissed() }
            )
        ) {
            militaryListView()
        }
        .animation(.default, value: state.isPresentedMilitarySheet)
    }

    @ViewBuilder
    func pageTitleView() -> some View {
        HStack(spacing: 4) {
            Text("병역")
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))

            Spacer()

            SMSPageControl(pageCount: 6, selectedPage: 3)
        }
        .smsFont(.title1)
    }

    @ViewBuilder
    func militaryListView() -> some View {
        VStack(spacing: 16) {
            ForEach(MilitaryServiceType.allCases, id: \.self) { militaryServiceType in
                HStack {
                    Text(militaryServiceType.display())
                        .smsFont(.body1, color: .neutral(.n50))

                    Spacer()

                    SMSSelectionControls(
                        isSeleted: Binding(
                            get: { state.selectedMilitaryServiceType == militaryServiceType },
                            set: { $0 ? intent.militaryServiceTypeDidSelected(type: militaryServiceType) : () }
                        )
                    )
                    .buttonWrapper {}
                }
                .animation(.default, value: state.selectedMilitaryServiceType)
                .padding(.horizontal, 20)
            }
        }
    }
}
