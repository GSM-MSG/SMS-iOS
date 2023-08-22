import BaseFeature
import DesignSystem
import SwiftUI
import InputInformationBaseFeature
import TechStackAppendFeatureInterface
import TagLayoutView
import ViewUtil

struct InputProfileInfoView: View {
    enum FocusField: Hashable {
        case introduce
        case email
        case portfoilo
    }
    @FocusState var isFocuesedMajorTextField: Bool
    @FocusState var focusField: FocusField?
    @StateObject var container: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>
    var intent: any InputProfileInfoIntentProtocol { container.intent }
    var state: any InputProfileInfoStateProtocol { container.model }
    private let techStackAppendBuildable: any TechStackAppendBuildable

    init(
        container: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>,
        techStackAppendBuildable: any TechStackAppendBuildable
    ) {
        self._container = StateObject(wrappedValue: container)
        self.techStackAppendBuildable = techStackAppendBuildable
    }

    var body: some View {
        SMSNavigationTitleView(title: "정보입력") {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    SMSSeparator()

                    VStack(spacing: 32) {
                        InputInformationPageTitleView(title: "프로필", pageCount: 8, selectedPage: 0)

                        VStack(alignment: .leading, spacing: 24) {
                            VStack(alignment: .leading, spacing: 8) {
                                ZStack(alignment: .bottomTrailing) {
                                    if let profileImage = state.profileImage {
                                        Image(uiImage: profileImage.uiImage)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(4)
                                    } else {
                                        SMSIcon(.profile, width: 100, height: 100)
                                    }

                                    SMSIcon(.profileSmallPlus)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 7)
                                                .strokeBorder(Color.sms(.system(.white)), lineWidth: 4)
                                        }
                                        .offset(x: 5, y: 4)
                                }
                                .buttonWrapper {
                                    withAnimation {
                                        focusField = nil
                                        intent.imageMethodPickerIsRequired()
                                    }
                                }
                                .titleWrapper("사진")

                                if state.inputProfileErrorFieldSet.contains(.profile) {
                                    SMSText("이미지를 선택해주세요", font: .caption1)
                                        .foregroundColor(.sms(.error(.e2)))
                                }
                            }

                            SMSTextField(
                                "1줄 자기소개 입력",
                                text: Binding(get: { state.introduce }, set: intent.updateIntroduce(introduce:)),
                                errorText: "1글자에서 50글자 사이로 입력해주세요",
                                isError: state.inputProfileErrorFieldSet.contains(.introduce)
                            ) {
                                focusField = .email
                            }
                            .focused($focusField, equals: .introduce)
                            .titleWrapper("자기소개")

                            SMSTextField(
                                "공개용 이메일 입력",
                                text: Binding(get: { state.email }, set: intent.updateEmail(email:)),
                                errorText: "이메일 형식에 맞게 입력해주세요",
                                isError: state.inputProfileErrorFieldSet.contains(.email)
                            ) {
                                focusField = nil
                                intent.majorSheetIsRequired()
                            }
                            .keyboardType(.emailAddress)
                            .focused($focusField, equals: .email)
                            .titleWrapper("이메일")

                            SMSTextField(
                                state.isSelfEntering ? "전공 분야 입력" : "전공 분야 선택",
                                text: Binding(get: { state.major }, set: intent.updateMajor(major:)),
                                errorText: "전공 분야를 선택해주세요",
                                isError: state.inputProfileErrorFieldSet.contains(.major),
                                isOnClear: false
                            ) {
                                focusField = .portfoilo
                            }
                            .focused($isFocuesedMajorTextField)
                            .disabled(!state.isSelfEntering)
                            .overlay(alignment: .topTrailing) {
                                SMSIcon(.downChevron)
                                    .padding([.top, .trailing], 12)
                            }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        focusField = nil
                                        intent.majorSheetIsRequired()
                                        intent.deActiveSelfEntering()
                                    }
                            )
                            .titleWrapper("분야")

                            SMSTextField(
                                "E.g. https://github.com",
                                text: Binding(
                                    get: { state.portfolioURL },
                                    set: intent.updatePortfolioURL(portfolioURL:)
                                ),
                                errorText: "URL 형식에 맞게 입력해주세요",
                                isError: state.inputProfileErrorFieldSet.contains(.portfoilo)
                            ) {
                                intent.techStackAppendIsRequired()
                            }
                            .keyboardType(.URL)
                            .focused($focusField, equals: .portfoilo)
                            .titleWrapper("포트폴리오 URL")

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
                                    focusField = nil
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
                                            .buttonWrapper {
                                                intent.removeTechStack(techStack: techStack)
                                            }
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 10)
                                    .background(Color.sms(.neutral(.n10)))
                                    .fixedSize()
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                }
                            }
                            .titleWrapper("세부스택 (최대 5개)")
                        }

                        CTAButton(text: "다음") {
                            intent.nextButtonDidTap(state: state)
                        }
                        .disabled(state.isDisabledNextButton)
                        .padding(.bottom, 32)
                    }
                    .padding([.top, .horizontal], 20)
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
        .onChange(of: state.isSelfEntering) { newValue in
            isFocuesedMajorTextField = newValue
        }
        .onLoad {
            intent.onLoad()
        }
        .imagePicker(
            isShow: Binding(
                get: { state.isPresentedImagePicker },
                set: { _ in intent.imagePickerDismissed() }
            ),
            pickedImageResult: Binding(
                get: { state.profileImage },
                set: { intent.imageDidSelected(imageResult: $0) }
            ),
            filter: .images
        )
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedMajorSheet },
                set: { _ in intent.majorSheetDismissed() }
            ),
            topPadding: 150
        ) {
            majorListView()
        }
        .animation(.default, value: state.isPresentedMajorSheet)
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedImageMethodPicker },
                set: { _ in intent.imageMethodPickerDismissed() }
            )
        ) {
            ImageMethodPickerView {
                intent.imagePickerIsRequired()
                intent.imageMethodPickerDismissed()
            } cameraAction: {
                intent.cameraIsRequired()
                intent.imageMethodPickerDismissed()
            }
        }
        .animation(.default, value: state.isPresentedImageMethodPicker)
        .cameraPicker(
            isShow: Binding(
                get: { state.isPresentedCamera },
                set: { _ in intent.cameraDismissed() }
            ),
            pickedImageResult: Binding(
                get: { state.profileImage },
                set: { intent.imageDidSelected(imageResult: $0) }
            )
        )
        .animation(.default, value: state.inputProfileErrorFieldSet)
    }

    @ViewBuilder
    func majorListView() -> some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(state.majorList, id: \.self) { major in
                    MajorRowView(
                        text: major,
                        isSeleted: Binding(
                            get: { state.major == major },
                            set: {
                                $0 ? intent.updateMajor(major: major) : ()
                                $0 ? intent.majorSheetDismissed() : ()
                                self.focusField = .portfoilo
                            }
                        )
                    )
                }

                MajorRowView(
                    text: "직접입력",
                    isSeleted: Binding(
                        get: { state.isSelfEntering },
                        set: {
                            $0 ? intent.updateMajor(major: "") : ()
                            $0 ? intent.activeSelfEntering() : ()
                            $0 ? intent.majorSheetDismissed() : ()
                            self.isFocuesedMajorTextField = $0
                        }
                    )
                )
            }
        }
    }
}
