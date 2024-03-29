import BaseFeature
import DesignSystem
import FoundationUtil
import InputInformationBaseFeature
import SwiftUI
import TagLayoutView
import TechStackAppendFeatureInterface
import ViewUtil

struct InputProjectInfoView: View {
    @FocusState var projectContentIsFocused: Bool
    @FocusState var projectMyActivityIsFocused: Bool
    @StateObject var container: MVIContainer<InputProjectInfoIntentProtocol, InputProjectInfoStateProtocol>
    var intent: any InputProjectInfoIntentProtocol { container.intent }
    var state: any InputProjectInfoStateProtocol { container.model }
    private let techStackAppendBuildable: any TechStackAppendBuildable

    init(
        techStackAppendBuildable: any TechStackAppendBuildable,
        container: MVIContainer<InputProjectInfoIntentProtocol, InputProjectInfoStateProtocol>
    ) {
        self.techStackAppendBuildable = techStackAppendBuildable
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        SMSNavigationTitleView(title: "정보입력") {
            GeometryReader { geometry in
                ScrollView(showsIndicators: true) {
                    InputInformationPageTitleView(title: "프로젝트", isRequired: false, pageCount: 8, selectedPage: 6)

                    VStack(spacing: 32) {
                        VStack(spacing: 24) {
                            ForEach(state.projectList.indices, id: \.self) { index in
                                projectListRowView(index: index, geometry: geometry)

                                SMSSeparator(height: 1)
                            }
                        }

                        SMSChip("추가") {
                            withAnimation {
                                intent.projectAppendButtonDidTap()
                            }
                        }
                        .foregroundColor(.sms(.system(.black)))
                        .aligned(.trailing)

                        HStack(spacing: 8) {
                            CTAButton(text: "이전", style: .outline) {
                                intent.prevButtonDidTap()
                            }
                            .frame(maxWidth: geometry.size.width / 3)

                            CTAButton(text: "다음") {
                                intent.nextButtonDidTap(projects: state.projectList)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.bottom, 32)
                    }
                    .padding([.top, .horizontal], 20)
                }
            }
        }
        .imagePicker(
            isShow: Binding(
                get: { state.isPresentedPreviewImagePicker },
                set: { _ in intent.previewImagePickerDismissed() }
            ),
            pickedImageResult: Binding(
                get: { .none },
                set: {
                    guard let image = $0 else { return }
                    intent.appendPreviewImage(index: state.focusedProjectIndex, image: image)
                }
            )
        )
        .smsToast(
            text: "이미지는 최대 4개까지만 추가 할 수 있어요.",
            isShowing: Binding(
                get: { state.isPresentedToast },
                set: { _ in intent.toastDismissed() }
            )
        )
        .datePicker(
            isShowing: Binding(
                get: { state.isPresentedStartAtDatePicker },
                set: { _ in intent.startAtDatePickerDismissed() }
            )
        ) { date in
            intent.projectStartAtDidSelect(index: state.focusedProjectIndex, startAt: date)
        }
        .datePicker(
            isShowing: Binding(
                get: { state.isPresentedEndAtDatePicker },
                set: { _ in intent.endAtDatePickerDismissed() }
            )
        ) { date in
            intent.projectEndAtDidSelect(index: state.focusedProjectIndex, endAt: date)
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { state.isPresentedTechStackAppend },
                set: { _ in intent.techStackAppendDismissed() }
            )
        ) {
            DeferView {
                techStackAppendBuildable.makeView(
                    initial: Array(state.projectList[safe: state.focusedProjectIndex]?.techStacks ?? [])
                ) {
                    intent.techStacksDidSelect(index: state.focusedProjectIndex, techStacks: $0)
                }
                .eraseToAnyView()
            }
        }
        .animation(.default, value: state.projectErrorSetList)
    }

    @ViewBuilder
    func projectListRowView(index: Int, geometry: GeometryProxy) -> some View {
        let collapsed = state.collapsedProject[safe: index] ?? false
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 16) {
                let projectName = state.projectList[safe: index]?.name ?? ""

                SMSText(projectName.isEmpty ? "프로젝트" : projectName, font: .title1)
                    .foregroundColor(.sms(.system(.black)))

                Spacer()

                SMSIcon(.downChevron)
                    .rotationEffect(collapsed ? .degrees(90) : .degrees(0))
                    .buttonWrapper {
                        intent.projectToggleButtonDidTap(index: index)
                    }

                SMSIcon(.xmarkOutline)
                    .buttonWrapper {
                        intent.projectRemoveButtonDidTap(index: index)
                    }
            }
            .padding(.bottom, 8)

            ConditionView(!collapsed) {
                projectName(index: index)

                projectIcon(index: index)

                projectPreviewImageList(index: index)

                projectContentTextEditor(index: index)

                projectMyActivityTextEditor(index: index)

                projectTechStack(geometry: geometry, index: index)

                projectDuration(index: index)

                projectRelatedLink(index: index, geometry: geometry)
            }
        }
    }
}

// MARK: - View Section
private extension InputProjectInfoView {
    @ViewBuilder
    func projectName(index: Int) -> some View {
        SMSTextField(
            "프로젝트 이름 입력",
            text: Binding(
                get: { state.projectList[safe: index]?.name ?? "" },
                set: { intent.updateProjectName(index: index, name: $0) }
            ),
            errorText: "프로젝트 이름을 입력해 주세요.",
            isError: state.projectErrorSetList[safe: index]?.contains(.name) ?? false
        )
        .titleWrapper("이름")
    }

    @ViewBuilder
    func projectIcon(index: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let iconData = state.projectList[safe: index]?.iconImage {
                    Image(uiImage: iconData.uiImage)
                        .resizable()
                        .frame(width: 108, height: 108)
                        .cornerRadius(8)
                } else {
                    imagePlaceholder(size: 108)
                        .overlay {
                            SMSIcon(.photo)
                        }
                }
            }
            .buttonWrapper {
                intent.iconImageButtonDidTap(index: index)
            }
            .titleWrapper("아이콘")
            .imagePicker(
                isShow: Binding(
                    get: { state.isPresentedImagePicker && state.focusedProjectIndex == index },
                    set: { _ in intent.iconImagePickerDismissed() }
                ),
                pickedImageResult: Binding(
                    get: { state.projectList[safe: index]?.iconImage },
                    set: {
                        guard let image = $0 else { return }
                        intent.updateIconImage(index: index, image: image)
                    }
                )
            )

            if state.projectErrorSetList[safe: index]?.contains(.icon) ?? false {
                SMSText("프로젝트 아이콘을 선택해 주세요.", font: .caption1)
                    .foregroundColor(.sms(.error(.e2)))
            }
        }
    }

    @ViewBuilder
    func projectPreviewImageList(index: Int) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                let projectPreviewImages = state.projectList[safe: index]?.previewImages ?? []
                imagePlaceholder(size: 132)
                    .overlay {
                        VStack(spacing: 4) {
                            SMSIcon(.photo)

                            SMSText(
                                "\(projectPreviewImages.count)/4",
                                font: .body2
                            )
                            .foregroundColor(.sms(.system(.black)))
                        }
                    }
                    .buttonWrapper {
                        intent.appendPreviewImageButtonDidTap(index: index, previewsCount: projectPreviewImages.count)
                    }

                ForEach(projectPreviewImages.indices, id: \.self) { previewIndex in
                    Image(uiImage: projectPreviewImages[previewIndex].uiImage)
                        .resizable()
                        .frame(width: 132, height: 132)
                        .cornerRadius(8)
                        .overlay(alignment: .topTrailing) {
                            SMSIcon(.xmark)
                                .padding(4)
                                .buttonWrapper {
                                    intent.removePreviewImageDidTap(index: index, previewIndex: previewIndex)
                                }
                        }
                }
            }
        }
        .titleWrapper("미리보기 사진")
    }

    @ViewBuilder
    func projectContentTextEditor(index: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            let projectContent = state.projectList[safe: index]?.content ?? ""
            TextEditor(
                text: Binding(
                    get: { projectContent },
                    set: { intent.updateProjectContent(index: index, content: $0) }
                )
            )
            .padding(6)
            .smsFont(.body1, color: .system(.black))
            .focused($projectContentIsFocused)
            .colorMultiply(.sms(.neutral(.n10)))
            .background(Color.sms(.neutral(.n10)))
            .frame(minHeight: 48)
            .cornerRadius(8)
            .roundedStroke(
                cornerRadius: 8,
                color: projectContentIsFocused ? .sms(.primary(.p1)) : .clear,
                lineWidth: projectContentIsFocused ? 1 : 0
            )
            .overlay(alignment: .topLeading) {
                ConditionView(projectContent.isEmpty) {
                    SMSText("프로젝트 내용 서술", font: .body1)
                        .foregroundColor(.sms(.neutral(.n30)))
                        .padding([.top, .leading], 12)
                        .onTapGesture {
                            projectContentIsFocused = true
                        }
                        .padding(.top, 4)
                }
            }
            .titleWrapper("프로젝트 설명")

            if state.projectErrorSetList[safe: index]?.contains(.content) ?? false {
                SMSText("프로젝트 내용을 입력해 주세요.", font: .caption1)
                    .foregroundColor(.sms(.error(.e2)))
            }
        }
    }

    @ViewBuilder
    func projectMyActivityTextEditor(index: Int) -> some View {
        let projectMyActivity = state.projectList[safe: index]?.mainTask ?? ""
        TextEditor(
            text: Binding(
                get: { projectMyActivity },
                set: { intent.updateProjectMainTask(index: index, mainTask: $0) }
            )
        )
        .smsFont(.body1, color: .system(.black))
        .padding(6)
        .focused($projectMyActivityIsFocused)
        .colorMultiply(.sms(.neutral(.n10)))
        .background(Color.sms(.neutral(.n10)))
        .frame(minHeight: 48)
        .cornerRadius(8)
        .roundedStroke(
            cornerRadius: 8,
            color: projectMyActivityIsFocused ? .sms(.primary(.p1)) : .clear,
            lineWidth: projectMyActivityIsFocused ? 1 : 0
        )
        .overlay(alignment: .topLeading) {
            ConditionView(projectMyActivity.isEmpty) {
                SMSText("주요 작업 내용 서술", font: .body1)
                    .foregroundColor(.sms(.neutral(.n30)))
                    .padding([.top, .leading], 12)
                    .onTapGesture {
                        projectMyActivityIsFocused = true
                    }
                    .padding(.top, 4)
            }
        }
        .titleWrapper("주요 작업 서술")
    }

    @ViewBuilder
    func projectTechStack(geometry: GeometryProxy, index: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
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
                intent.techStackAppendButtonDidTap(index: index)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                TagLayoutView(
                    Array(state.projectList[safe: index]?.techStacks ?? []),
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
                                intent.removeProjectTechStackButtonDidTap(index: index, techStack: techStack)
                            }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(Color.sms(.neutral(.n10)))
                    .fixedSize()
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }

            if state.projectErrorSetList[safe: index]?.contains(.techstaks) ?? false {
                SMSText("사용 기술을 추가해 주세요.", font: .caption1)
                    .foregroundColor(.sms(.error(.e2)))
            }
        }
        .titleWrapper("사용 기술 (최대 20개)")
    }

    @ViewBuilder
    func projectDuration(index: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                let project = state.projectList[safe: index]
                DatePickerField(dateText: project?.startAtString ?? "") {
                    intent.startAtButtonDidTap(index: index)
                }
                .frame(maxWidth: .infinity)

                if !(project?.isInProgress ?? false) {
                    SMSIcon(.waterWave)

                    DatePickerField(dateText: project?.endAtString ?? "") {
                        intent.endAtButtonDidTap(index: index)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .animation(.spring(blendDuration: 0.3), value: state.projectList.map(\.isInProgress))

            if state.projectErrorSetList[safe: index]?.contains(.date) ?? false {
                SMSText("프로젝트 진행 기간을 입력해 주세요.", font: .caption1)
                    .foregroundColor(.sms(.error(.e2)))
            }

            HStack(spacing: 8) {
                SMSCheckbox(
                    isSelected: Binding(
                        get: { state.projectList[safe: index]?.isInProgress ?? false },
                        set: { isInProgress in
                            withAnimation {
                                intent.projectIsInProgressButtonDidTap(index: index, isInProgress: isInProgress)
                            }
                        }
                    )
                )

                SMSText("진행중", font: .body1)
                    .foregroundColor(.sms(.neutral(.n30)))
                    .aligned(.leading)
            }
        }
        .titleWrapper("진행 기간")
    }

    @ViewBuilder
    func projectRelatedLink(index: Int, geometry: GeometryProxy) -> some View {
        VStack(spacing: 8) {
            let relatedLinks = state.projectList[safe: index]?.relatedLinks ?? []
            ForEach(relatedLinks.indices, id: \.self) { relatedIndex in
                HStack(spacing: 16) {
                    SMSTextField(
                        "이름",
                        text: Binding(
                            get: { relatedLinks[relatedIndex].name },
                            set: { intent.updateProjectLinkName(index: index, linkIndex: relatedIndex, name: $0) }
                        )
                    )
                    .frame(maxWidth: geometry.size.width / 4)

                    SMSTextField(
                        "URL",
                        text: Binding(
                            get: { relatedLinks[relatedIndex].url },
                            set: { intent.updateProjectLinkURL(index: index, linkIndex: relatedIndex, url: $0) }
                        )
                    )
                    .frame(maxWidth: .infinity)

                    Button {
                        intent.removeProjectRelatedLinkDidTap(index: index, linkIndex: relatedIndex)
                    } label: {
                        SMSIcon(.trash)
                    }
                }
            }

            SMSChip("추가") {
                intent.relatedLinkAppendButtonDidTap(index: index)
            }
            .aligned(.leading)
        }
        .titleWrapper("관련 링크")
    }
}

// MARK: - Reusable View
private extension InputProjectInfoView {
    @ViewBuilder
    func imagePlaceholder(size: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.sms(.neutral(.n10)))
            .frame(width: size, height: size)
    }
}
