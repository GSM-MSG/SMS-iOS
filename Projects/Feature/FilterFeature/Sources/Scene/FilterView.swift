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
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

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
                    if state.isLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                    } else {
                        VStack(alignment: .leading, spacing: 40) {
                            ConditionView(state.userRole == .guest) {
                                checkBoxSection(
                                    text: "학년",
                                    isSelected: {
                                        state.gradeSet.contains($0)
                                    },
                                    selectAction: {
                                        if state.gradeSet.contains($0) == false {
                                            intent.gradeSelect(grade: $0)
                                        } else {
                                            intent.gardeDeSelect(grade: $0)
                                        }
                                    },
                                    data: GradeType.allCases,
                                    id: \.self
                                ) { text in
                                    SMSText("\(text.rawValue)학년", font: .body2)
                                }

                                checkBoxSection(
                                    text: "반",
                                    isSelected: {
                                        state.classSet.contains($0)
                                    },
                                    selectAction: {
                                        if state.classSet.contains($0) == false {
                                            intent.classSelect(class: $0)
                                        } else {
                                            intent.classDeSelect(class: $0)
                                        }
                                    },
                                    data: ClassType.allCases,
                                    id: \.self
                                ) { text in
                                    SMSText("\(text.rawValue)반", font: .body2)
                                }

                                checkBoxSection(
                                    text: "학과",
                                    isSelected: {
                                        state.departmentSet.contains($0)
                                    },
                                    selectAction: {
                                        if state.departmentSet.contains($0) == false {
                                            intent.departmentSelect(department: $0)
                                        } else {
                                            intent.departmentDeSelect(department: $0)
                                        }
                                    },
                                    data: DepartmentType.allCases,
                                    id: \.self
                                ) { text in
                                    SMSText(text.display, font: .body2)
                                }
                            }

                            checkBoxSection(
                                text: "분야",
                                isSelected: {
                                    state.majorSet.contains($0)
                                },
                                selectAction: {
                                    if state.majorSet.contains($0) == false {
                                        intent.majorSelect(major: $0)
                                    } else {
                                        intent.majorDeSelect(major: $0)
                                    }
                                },
                                data: state.majorList + ["기타"],
                                id: \.self
                            ) { text in
                                SMSText(text, font: .body2)
                            }

                            ConditionView(state.userRole == .guest) {
                                ConditionView(state.userRole == .guest) {
                                    checkBoxSection(
                                        text: "희망 고용 형태",
                                        isSelected: {
                                            state.formOfEmploymentSet.contains($0)
                                        },
                                        selectAction: {
                                            if state.formOfEmploymentSet.contains($0) == false {
                                                intent.formOfEmploymentSeletect(formOfEmployment: $0)
                                            } else {
                                                intent.formOfEmploymentDeSeletect(formOfEmployment: $0)
                                            }
                                        },
                                        data: FormOfEmployment.allCases,
                                        id: \.self
                                    ) { text in
                                        SMSText(text.display(), font: .body2)
                                    }

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
                                                text:
                                                    Binding<String>(
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
                                                text:
                                                    Binding<String>(
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
                                                text:
                                                    Binding<String>(
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
                                                text:
                                                    Binding<String>(
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

                                radioCell(
                                    text: "학번",
                                    isSelected: {
                                        state.stuNumSortType == $0
                                    },
                                    selectAction: {
                                        intent.stuNumSortTypeSelect(stuNumSortType: $0)
                                    },
                                    data: SortType.allCases,
                                    id: \.self
                                ) { text in
                                    SMSText(text.display, font: .body2)
                                }

                                ConditionView(state.userRole == .guest) {
                                    radioCell(
                                        text: "인증제 점수",
                                        isSelected: {
                                            state.scoreSortType == $0
                                        },
                                        selectAction: {
                                            intent.scoreSortTypeSelect(scoreSortType: $0)
                                        },
                                        data: SortType.allCases,
                                        id: \.self
                                    ) { text in
                                        SMSText(text.display, font: .body2)
                                    }

                                    radioCell(
                                        text: "희망 연봉",
                                        isSelected: {
                                            state.salarySortType == $0
                                        },
                                        selectAction: {
                                            intent.salarySortyTypeSelect(salarySortType: $0)
                                        },
                                        data: SortType.allCases,
                                        id: \.self
                                    ) { text in
                                        SMSText(text.display, font: .body2)
                                    }
                                }
                            }

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
                        .padding(.horizontal, 20)
                        .padding(.bottom, safeAreaInsets.bottom + 72)
                    }
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
    func checkBoxSection<T, ID, Content>(
        text: String,
        isSelected: @escaping (T) -> Bool,
        selectAction: @escaping (T) -> Void,
        data: [T],
        id: KeyPath<T, ID>,
        @ViewBuilder content: @escaping (T) -> Content
    ) -> some View where ID: Hashable, Content: View {
        VStack(alignment: .leading, spacing: 16) {
            SMSText(text, font: .body1)

            LazyVGrid(columns: columns) {
                ForEach(data, id: id) { index in
                    HStack(spacing: 8) {
                        SMSCheckbox(
                            isSelected: Binding(
                                get: { isSelected(index) },
                                set: { _ in selectAction(index) }
                            )
                        )

                        content(index)

                        Spacer()
                    }
                }
            }
        }
    }

    @ViewBuilder
    func radioCell<T, ID, Content>(
        text: String,
        isSelected: @escaping (T) -> Bool,
        selectAction: @escaping (T) -> Void,
        data: [T],
        id: KeyPath<T, ID>,
        @ViewBuilder content: @escaping (T) -> Content
    ) -> some View where ID: Hashable, Content: View {
        VStack(alignment: .leading, spacing: 16) {
            SMSText(text, font: .body1)

            LazyVGrid(columns: columns) {
                ForEach(data, id: id) { index in
                    HStack(spacing: 8) {
                        SMSRadioButton(
                            isSelected: Binding(
                                get: { isSelected(index) },
                                set: { _ in selectAction(index) }
                            )
                        )

                        content(index)

                        Spacer()
                    }
                }
            }
        }
    }
}
