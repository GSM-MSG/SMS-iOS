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
    var testString: [String] = ["Frontend", "Backend", "android", "iOS", "Game", "Cyber Security", "Design", "AI", "IOT"]
    let departmentTypes: [DepartmentType] = [.software, .smartIoT, .ai]
    @State private var authLowerValue: Int = 0
    @State private var authUpperValue: Int = 2000
    @State private var lowerValue: Int = 0
    @State private var upperValue: Int = 9999

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
                                checkBoxCell(
                                    text: "학년",
                                    isSelected: .constant(true),
                                    data: Array(1...3),
                                    id: \.self
                                ) { text in
                                    SMSText("\(text)학년", font: .body2)
                                }

                                checkBoxCell(
                                    text: "반",
                                    isSelected: .constant(true),
                                    data: Array(1...4),
                                    id: \.self
                                ) { text in
                                    SMSText("\(text)반", font: .body2)
                                }

                                checkBoxCell(
                                    text: "학과",
                                    isSelected: .constant(true),
                                    data: departmentTypes,
                                    id: \.self
                                ) { text in
                                    SMSText(text.display, font: .body2)
                                }
                            }

                            checkBoxCell(
                                text: "분야",
                                isSelected: .constant(true),
                                data: testString,
                                id: \.self
                            ) { text in
                                SMSText(text, font: .body2)
                            }

                            ConditionView(state.userRole == .guest) {
                                ConditionView(state.userRole == .guest) {
                                    checkBoxCell(
                                        text: "희망 고용 형태",
                                        isSelected: .constant(true),
                                        data: FormOfEmployment.allCases,
                                        id: \.self
                                    ) { text in
                                        SMSText(text.display(), font: .body2)
                                    }

                                    VStack(alignment: .leading, spacing: 24) {
                                        SMSText("인증제 점수", font: .body1)

                                        RangedSliderView(
                                            minValue: $authLowerValue,
                                            maxValue: $authUpperValue,
                                            bounds: 0...2000,
                                            betweenValue: 300
                                        )
                                            .padding(.horizontal, 12)

                                        HStack {
                                            SMSTextField(
                                                "",
                                                text:
                                                    Binding<String>(
                                                        get: { "\(authLowerValue)" },
                                                        set: { newValue in
                                                            print(newValue)
                                                            if let convertedValue = Int(newValue) {
                                                                authLowerValue = convertedValue
                                                            }
                                                        }
                                                    ),
                                                isOnClear: false
                                            )
                                            .frame(width: 80)

                                            Spacer()

                                            SMSTextField(
                                                "",
                                                text:
                                                    Binding<String>(
                                                        get: { "\(authUpperValue)" },
                                                        set: { newValue in
                                                            if let convertedValue = Int(newValue) {
                                                                authUpperValue = convertedValue
                                                            }
                                                        }
                                                    ),
                                                isOnClear: false
                                            )
                                            .frame(width: 80)
                                        }
                                    }

                                    VStack(alignment: .leading, spacing: 24) {
                                        SMSText("희망 연봉", font: .body1)

                                        RangedSliderView(
                                            minValue: $lowerValue,
                                            maxValue: $upperValue,
                                            bounds: 0...9999,
                                            betweenValue: 1000
                                        )
                                            .padding(.horizontal, 12)

                                        HStack {
                                            SMSTextField(
                                                "",
                                                text:
                                                    Binding<String>(
                                                        get: { "\(lowerValue)만원" },
                                                        set: { newValue in
                                                            if let convertedValue = Int(newValue) {
                                                                lowerValue = convertedValue
                                                            }
                                                        }
                                                    ),
                                                isOnClear: false
                                            )
                                            .frame(width: 94)

                                            Spacer()

                                            SMSTextField(
                                                "",
                                                text:
                                                    Binding<String>(
                                                        get: { "\(upperValue)만원" },
                                                        set: { newValue in
                                                            if let convertedValue = Int(newValue) {
                                                                upperValue = convertedValue
                                                            }
                                                        }
                                                    ),
                                                isOnClear: false
                                            )
                                            .frame(width: 94)
                                        }
                                    }
                                }
                                radioCell(
                                    text: "학번",
                                    isSelected: .constant(true),
                                    data: ["오름차순", "내림차순"],
                                    id: \.self
                                ) { text in
                                    SMSText(text, font: .body2)
                                }

                                ConditionView(state.userRole == .guest) {
                                    radioCell(
                                        text: "인증제 점수",
                                        isSelected: .constant(true),
                                        data: ["오름차순", "내림차순"],
                                        id: \.self
                                    ) { text in
                                        SMSText(text, font: .body2)
                                    }

                                    radioCell(
                                        text: "희망 연봉",
                                        isSelected: .constant(true),
                                        data: ["오름차순", "내림차순"],
                                        id: \.self
                                    ) { text in
                                        SMSText(text, font: .body2)
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
                }
                .padding(.bottom, safeAreaInsets.bottom)
                .background {
                    Color.sms(.system(.white))
                }
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                SMSText("초기화", font: .body2)
                    .foregroundStyle(Color.sms(.system(.black)))
                    .onTapGesture {
                        // TODO: 필터 값 다 지우기
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
    func checkBoxCell<T, ID, Content>(
        text: String,
        isSelected: Binding<Bool>,
        data: [T],
        id: KeyPath<T, ID>,
        @ViewBuilder content: @escaping (T) -> Content
    ) -> some View where ID: Hashable, Content: View {
        VStack(alignment: .leading, spacing: 16) {
            SMSText(text, font: .body1)

            LazyVGrid(columns: columns) {
                ForEach(data, id: id) { index in
                    HStack(spacing: 8) {
                        SMSCheckbox(isSelected: isSelected)

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
        isSelected: Binding<Bool>,
        data: [T],
        id: KeyPath<T, ID>,
        @ViewBuilder content: @escaping (T) -> Content
    ) -> some View where ID: Hashable, Content: View {
        VStack(alignment: .leading, spacing: 16) {
            SMSText(text, font: .body1)

            LazyVGrid(columns: columns) {
                ForEach(data, id: id) { index in
                    HStack(spacing: 8) {
                        SMSRadioButton(isSelected: isSelected)

                        content(index)

                        Spacer()
                    }
                }
            }
        }
    }
}
