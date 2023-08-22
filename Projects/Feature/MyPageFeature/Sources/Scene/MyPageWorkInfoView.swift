import BaseFeature
import DesignSystem
import SwiftUI
import ViewUtil

struct MyPageWorkInfoView: View {
    @StateObject var container: MVIContainer<MyPageWorkInfoIntentProtocol, MyPageWorkInfoStateProtocol>
    var intent: MyPageWorkInfoIntentProtocol { container.intent }
    var state: MyPageWorkInfoStateProtocol { container.model }

    init(container: MVIContainer<MyPageWorkInfoIntentProtocol, MyPageWorkInfoStateProtocol>) {
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        Section {
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

                SMSTextField(
                    "희망 연봉 (10,000원 단위)",
                    text: Binding(
                        get: { state.salary },
                        set: intent.updateSalary(salary:)
                    )
                )
                .keyboardType(.numberPad)
                .titleWrapper("희망 연봉")

                workRegionList()
            }
        } header: {
            SectionHeaderView(title: "근무 조건")
        }
        .padding(.horizontal, 20)
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
}
