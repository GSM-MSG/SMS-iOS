import BaseFeature
import DesignSystem
import SwiftUI

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
                        SMSTextField("병특 희망", text: .constant(""))
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
                            intent.nextButtonDidTap()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 32)
                }
                .padding([.top, .horizontal], 20)
            }
        }
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
            ForEach(0..<4, id: \.self) { index in
                HStack {
                    Text("\(index)")
                        .smsFont(.body1, color: .neutral(.n50))

                    Spacer()

                    Circle()
                        .fill(Color.sms(.primary(.p2)))
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
