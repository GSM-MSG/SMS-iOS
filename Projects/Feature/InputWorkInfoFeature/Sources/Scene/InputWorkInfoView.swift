import BaseFeature
import DesignSystem
import FoundationUtil
import InputInformationBaseFeature
import StudentDomainInterface
import SwiftUI
import ViewUtil

struct InputWorkInfoView: View {
    @StateObject var container: MVIContainer<InputWorkInfoIntentProtocol, InputWorkInfoStateProtocol>
    var intent: any InputWorkInfoIntentProtocol { container.intent }
    var state: any InputWorkInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                ScrollView(showsIndicators: false) {
                    InputInformationPageTitleView(title: "근무 조건", pageCount: 8, selectedPage: 2)

                    VStack(spacing: 32) {
                        VStack(spacing: 24) {
                            SMSTextField(
                                "정규직",
                                text: Binding(
                                    get: { state.formOfEmployment.display() },
                                    set: { _ in }
                                ),
                                isOnClear: false
                            )
                            .disabled(true)
                            .overlay(alignment: .trailing) {
                                SMSIcon(.downChevron)
                                    .padding(.trailing, 12)
                            }
                            .titleWrapper("희망 고용 형태")
                            .onTapGesture {
                                intent.formOfEmployeementSheetIsRequired()
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                SMSTextField(
                                    "희망 연봉 (10,000원 단위)",
                                    text: Binding(
                                        get: { state.salary },
                                        set: intent.updateSalary(salary:)
                                    )
                                )
                                .keyboardType(.numberPad)

                                Text(state.salaryDisplay)
                                    .smsFont(.caption1, color: .neutral(.n30))
                            }
                            .titleWrapper("희망 연봉")

                            workRegionList()
                        }
                    }
                    .padding([.top, .horizontal], 20)
                }
                .padding(.bottom, 12)

                HStack(spacing: 8) {
                    CTAButton(text: "이전", style: .outline) {
                        intent.prevButtonDidTap()
                    }
                    .frame(maxWidth: proxy.size.width / 3)

                    CTAButton(text: "다음") {
                        intent.nextButtonDidTap(state: state)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 32)
                .padding(.horizontal, 20)
            }
        }
        .hideKeyboardWhenTap()
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedFormOfEmployeementSheet },
                set: { _ in intent.formOfEmployeementSheetDismissed() }
            )
        ) {
            DeferView {
                formOfEmployeementList()
            }
        }
        .animation(.default, value: state.isPresentedFormOfEmployeementSheet)
    }

    @ViewBuilder
    func workRegionList() -> some View {
        VStack(spacing: 8) {
            ForEach(state.workRegionList.indices, id: \.self) { index in
                HStack(spacing: 16) {
                    SMSTextField(
                        "근무 희망 지역 입력",
                        text: Binding(
                            get: { state.workRegionList[safe: index] ?? "" },
                            set: { intent.updateWorkRegion(region: $0, at: index) }
                        )
                    )

                    Button {
                        intent.deleteWorkRegion(at: index)
                    } label: {
                        SMSIcon(.trash)
                    }
                }
            }

            SMSChip("추가") {
                intent.appendWorkRegion()
            }
            .aligned(.leading)
        }
        .titleWrapper("근무 지역")
        .aligned(.leading)
        .animation(.default, value: state.workRegionList.count)
    }

    @ViewBuilder
    func formOfEmployeementList() -> some View {
        VStack(spacing: 16) {
            ForEach(FormOfEmployment.allCases, id: \.self) { formOfEmployment in
                HStack {
                    Text(formOfEmployment.display())
                        .smsFont(.body1, color: .neutral(.n50))

                    Spacer()

                    SMSRadioButton(
                        isSelected: Binding(
                            get: { state.formOfEmployment == formOfEmployment },
                            set: { $0 ? intent.updateFormOfEmployment(form: formOfEmployment) : () }
                        )
                    )
                    .buttonWrapper {}
                }
                .animation(.default, value: state.formOfEmployment)
                .padding(.horizontal, 20)
            }
        }
    }
}
