import SwiftUI
import FilterFeatureInterface
import BaseFeature
import ViewUtil
import DesignSystem
import TagLayoutView
import StudentDomainInterface
import TechStackAppendFeatureInterface

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @StateObject var container: MVIContainer<FilterIntentProtocol, FilterStateProtocol>
    var intent: any FilterIntentProtocol { container.intent }
    var state: any FilterStateProtocol { container.model }
    private let techStackAppendBuildable: any TechStackAppendBuildable

    init(
        container: MVIContainer<FilterIntentProtocol, FilterStateProtocol>,
        techStackAppendBuildable: any TechStackAppendBuildable
    ) {
        self._container = StateObject(wrappedValue: container)
        self.techStackAppendBuildable = techStackAppendBuildable
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ScrollView(showsIndicators: false) {
                    SMSSeparator()
                        .padding(.bottom, 20)

                    VStack(alignment: .leading, spacing: 40) {
                        ConditionView(state.userRole == .student) {
                            gradeSection()

                            classSection()

                            departmentSection()
                        }

                        majorSection()

                        ConditionView(state.userRole == .student) {
                            ConditionView(state.userRole == .teacher) {
                                formOfEmploymentSetcion()

                                scoreSliderSection()

                                salarySliderSection()
                            }

                            stuNumSection()

                            ConditionView(state.userRole == .teacher) {
                                scoreSection()

                                salarySection()
                            }

                            techStackSetion(geometry: geometry)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, safeAreaInsets.bottom + 72)
                }

                FillButton(text: "확인") {
                    intent.filterCompleteButtonDidTap(state: state)
                    dismiss()
                }
                .padding(.bottom, safeAreaInsets.bottom)
                .background {
                    Color.sms(.system(.white))
                }
            }
        }
        .onAppear {
            intent.onAppear()
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                SMSText("초기화", font: .body2)
                    .foregroundStyle(Color.sms(.system(.black)))
                    .onTapGesture {
                        intent.clearFilter()
                    }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SMSIcon(.xmark)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { state.isPresentedTechStackAppend },
                set: { _ in intent.techStackAppendDismissed() }
            )
        ) {
            DeferView {
                techStackAppendBuildable.makeView(initial: state.techStacks) { techStacks in
                    intent.techStackAppendDidComplete(techStacks: techStacks)
                }
                .eraseToAnyView()
            }
        }
        .hideKeyboardWhenTap()
        .navigationTitle("필터")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }

    @ViewBuilder
    func gradeSection() -> some View {
        CheckBoxSection(
            text: "학년",
            data: GradeType.allCases,
            id: \.self,
            isSelected: state.gradeSet.contains,
            selectAction: {
                if state.gradeSet.contains($0) == false {
                    intent.gradeSelect(grade: $0)
                } else {
                    intent.gardeDeSelect(grade: $0)
                }
            }
        ) { grade in
            SMSText("\(grade.rawValue)학년", font: .body2)
        }
    }

    @ViewBuilder
    func departmentSection() -> some View {
        CheckBoxSection(
            text: "학과",
            data: DepartmentType.allCases,
            id: \.self,
            isSelected: state.departmentSet.contains,
            selectAction: {
                if state.departmentSet.contains($0) == false {
                    intent.departmentSelect(department: $0)
                } else {
                    intent.departmentDeSelect(department: $0)
                }
            }
        ) { department in
            SMSText(department.display, font: .body2)
        }
    }

    @ViewBuilder
    func classSection() -> some View {
        CheckBoxSection(
            text: "반",
            data: ClassType.allCases,
            id: \.self,
            isSelected: state.classSet.contains,
            selectAction: {
                if state.classSet.contains($0) == false {
                    intent.classSelect(class: $0)
                } else {
                    intent.classDeSelect(class: $0)
                }
            }
        ) { `class` in
            SMSText("\(`class`.rawValue)반", font: .body2)
        }
    }

    @ViewBuilder
    func majorSection() -> some View {
        CheckBoxSection(
            text: "분야",
            data: state.majorList + ["기타"],
            id: \.self,
            isSelected: state.majorSet.contains,
            selectAction: {
                if state.majorSet.contains($0) == false {
                    intent.majorSelect(major: $0)
                } else {
                    intent.majorDeSelect(major: $0)
                }
            }
        ) { major in
            SMSText(major, font: .body2)
        }
    }

    @ViewBuilder
    func formOfEmploymentSetcion() -> some View {
        CheckBoxSection(
            text: "희망 고용 형태",
            data: FormOfEmployment.allCases,
            id: \.self,
            isSelected: state.formOfEmploymentSet.contains,
            selectAction: {
                if state.formOfEmploymentSet.contains($0) == false {
                    intent.formOfEmploymentSeletect(formOfEmployment: $0)
                } else {
                    intent.formOfEmploymentDeSeletect(formOfEmployment: $0)
                }
            }
        ) { formOfEmployMent in
            SMSText(formOfEmployMent.display(), font: .body2)
        }
    }

    @ViewBuilder
    func scoreSliderSection() -> some View {
        VStack(alignment: .leading, spacing: 24) {
            SMSText("인증제 점수", font: .body1)

            RangedSliderView(
                minValue: Binding<Int>(
                    get: { state.lowerScoreValue },
                    set: { intent.lowerScoreValue(
                        lowValue: $0.description,
                        upperValue: state.upperScoreValue
                    )}
                ),
                maxValue: Binding<Int>(
                    get: { state.upperScoreValue },
                    set: { intent.upperScoreValue(
                        lowValue: state.lowerScoreValue,
                        upperValue: $0.description
                    )}
                ),
                bounds: 0...2000
            )
            .padding(.horizontal, 12)

            HStack {
                SMSTextField(
                    "",
                    text: Binding<String>(
                            get: { "\(state.lowerScoreValue)" },
                            set: { newValue in
                                intent.lowerScoreValue(
                                    lowValue: newValue,
                                    upperValue: state.upperScoreValue
                                )
                            }
                        ),
                    isOnClear: false
                )
                .keyboardType(.numberPad)
                .frame(width: 80)

                Spacer()

                SMSTextField(
                    "",
                    text: Binding<String>(
                            get: { "\(state.upperScoreValue)" },
                            set: { newValue in
                                intent.upperScoreValue(
                                    lowValue: state.lowerScoreValue,
                                    upperValue: newValue
                                )
                            }
                        ),
                    isOnClear: false
                )
                .keyboardType(.numberPad)
                .frame(width: 80)
            }
        }
    }

    @ViewBuilder
    func salarySliderSection() -> some View {
        VStack(alignment: .leading, spacing: 24) {
            SMSText("희망 연봉", font: .body1)

            RangedSliderView(
                minValue: Binding<Int>(
                    get: { state.lowerSalaryValue },
                    set: { intent.lowerSalaryValue(
                        lowValue: $0.description,
                        upperValue: state.upperSalaryValue
                    )}
                ),
                maxValue: Binding<Int>(
                    get: { state.upperSalaryValue },
                    set: { intent.upperSalaryValue(
                        lowValue: state.lowerSalaryValue,
                        upperValue: $0.description
                    )}
                ),
                bounds: 0...9999
            )
            .padding(.horizontal, 12)

            HStack {
                SMSTextField(
                    "",
                    text: Binding<String>(
                            get: { "\(state.lowerSalaryValue)만원" },
                            set: { newValue in
                                intent.lowerSalaryValue(
                                    lowValue: newValue,
                                    upperValue: state.upperSalaryValue
                                )
                            }
                        ),
                    isOnClear: false
                )
                .keyboardType(.numberPad)
                .frame(width: 94)

                Spacer()

                SMSTextField(
                    "",
                    text: Binding<String>(
                            get: { "\(state.upperSalaryValue)만원" },
                            set: { newValue in
                                intent.upperSalaryValue(
                                    lowValue: state.lowerSalaryValue,
                                    upperValue: newValue
                                )
                            }
                        ),
                    isOnClear: false
                )
                .keyboardType(.numberPad)
                .frame(width: 94)
            }
        }
    }

    @ViewBuilder
    func stuNumSection() -> some View {
        RadioCell(
            text: "학번",
            data: SortType.allCases,
            id: \.self,
            isSelected: {
                state.stuNumSortType == $0
            },
            selectAction: {
                intent.stuNumSortTypeSelect(stuNumSortType: $0)
            }
        ) { stuNum in
            SMSText(stuNum.display, font: .body2)
        }
    }

    @ViewBuilder
    func scoreSection() -> some View {
        RadioCell(
            text: "인증제 점수",
            data: SortType.allCases,
            id: \.self,
            isSelected: {
                state.scoreSortType == $0
            },
            selectAction: {
                intent.scoreSortTypeSelect(scoreSortType: $0)
            }
        ) { score in
            SMSText(score.display, font: .body2)
        }
    }

    @ViewBuilder
    func salarySection() -> some View {
        RadioCell(
            text: "희망 연봉",
            data: SortType.allCases,
            id: \.self,
            isSelected: ==state.salarySortType,
            selectAction: {
                intent.salarySortyTypeSelect(salarySortType: $0)
            }
        ) { salary in
            SMSText(salary.display, font: .body2)
        }
    }

    @ViewBuilder
    func techStackSetion(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SMSText("세부스택", font: .body1)

            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    SMSIcon(.magnifyingglass)

                    SMSText("찾고 싶은 세부 스택 입력", font: .body1)
                        .foregroundColor(.sms(.neutral(.n30)))

                    Spacer()
                }
                .padding(12)
                .background {
                    Color.sms(.neutral(.n10))
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .buttonWrapper {
                    intent.techStackAppendIsRequired()
                }

                TagLayoutView(
                    state.techStacks,
                    tagFont: UIFont(
                        font: DesignSystemFontFamily.Pretendard.regular,
                        size: 24
                    ) ?? .init(),
                    padding: 20,
                    parentWidth: geometry.size.width
                ) { techStack in
                    HStack {
                        SMSText(techStack, font: .body2)

                        SMSIcon(.xmarkOutline, width: 20, height: 20)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(Color.sms(.neutral(.n10)))
                    .fixedSize()
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
    }
}
