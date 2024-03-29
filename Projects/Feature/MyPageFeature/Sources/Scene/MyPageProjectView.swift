import BaseFeature
import DesignSystem
import NukeUI
import SwiftUI
import TagLayoutView
import ViewUtil

struct MyPageProjectView: View {
    @FocusState var projectContentIsFocused: Bool
    @FocusState var projectMyActivityIsFocused: Bool
    @StateObject var container: MVIContainer<MyPageProjectIntentProtocol, MyPageProjectStateProtocol>
    var intent: MyPageProjectIntentProtocol { container.intent }
    var state: MyPageProjectStateProtocol { container.model }
    let geometry: GeometryProxy

    init(
        container: MVIContainer<MyPageProjectIntentProtocol, MyPageProjectStateProtocol>,
        geometry: GeometryProxy
    ) {
        self._container = StateObject(wrappedValue: container)
        self.geometry = geometry
    }

    var body: some View {
        Section {
            VStack(spacing: 16) {
                VStack(spacing: 24) {
                    ForEach(state.projectList.indices, id: \.self) { index in
                        projectListRowView(index: index, geometry: geometry)

                        SMSSeparator(height: 1)
                    }
                }

                HStack(spacing: 4) {
                    SMSIcon(.plus, width: 12, height: 12)
                        .foregroundColor(.sms(.system(.black)))

                    SMSText("추가")
                        .foregroundColor(.sms(.system(.black)))
                        .font(.sms(.title2))
                }
                .aligned(.trailing)
                .buttonWrapper {
                    intent.projectAppendButtonDidTap()
                }
            }
        } header: {
            SectionHeaderView(title: "프로젝트")
        }
        .padding(.horizontal, 20)
        .animation(.default, value: state.projectErrorSetList)
    }

    @ViewBuilder
    func projectListRowView(index: Int, geometry: GeometryProxy) -> some View {
        let collapsed = state.collapsedProject[safe: index] ?? false
        Section {
            VStack(alignment: .leading, spacing: 24) {
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
        } header: {
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
        }
    }
}

// MARK: - View Section
private extension MyPageProjectView {
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
        Group {
            if let iconURLString = state.projectList[safe: index]?.iconImage,
                let iconURL = URL(string: iconURLString) {
                LazyImage(url: iconURL) { image in
                    if let image = image.image {
                        image
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
            } else {
                imagePlaceholder(size: 108)
                    .overlay {
                        SMSIcon(.photo)
                    }
            }
        }
        .buttonWrapper {
            intent.projectIconImageButtonDidTap(index: index)
        }
        .titleWrapper("아이콘")
        .imagePicker(
            isShow: Binding(
                get: { state.isPresentedProjectImagePicker && state.focusedProjectIndex == index },
                set: { _ in intent.projectIconImagePickerDismissed() }
            ),
            pickedImageResult: Binding(
                get: { nil },
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
                    let url = URL(string: projectPreviewImages[previewIndex])
                    LazyImage(url: url) { image in
                        if let image = image.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 132, height: 132)
                            .cornerRadius(8)
                            .overlay(alignment: .topTrailing) {
                                SMSIcon(.xmark)
                                    .padding(4)
                                    .buttonWrapper {
                                        intent.removePreviewImageDidTap(index: index, previewIndex: previewIndex)
                                    }
                            }
                        } else {
                            imagePlaceholder(size: 132)
                        }
                    }
                }
            }
        }
        .titleWrapper("미리보기 사진")
    }

    @ViewBuilder
    func projectContentTextEditor(index: Int) -> some View {
        let projectContent = state.projectList[safe: index]?.content ?? ""
        TextEditor(
            text: Binding(
                get: { projectContent },
                set: { intent.updateProjectContent(index: index, content: $0) }
            )
        )
        .smsFont(.body1, color: .system(.black))
        .padding([.top, .leading], 6)
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

    @ViewBuilder
    func projectMyActivityTextEditor(index: Int) -> some View {
        let projectMyActivity = state.projectList[safe: index]?.mainTask ?? ""
        TextEditor(
            text: Binding(
                get: { projectMyActivity },
                set: { intent.updateProjectMainTask(index: index, mainTask: $0) }
            )
        )
        .focused($projectMyActivityIsFocused)
        .padding([.top, .leading], 6)
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
                intent.projectTechStackAppendButtonDidTap(index: index)
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
                    intent.projectStartAtButtonDidTap(index: index)
                }
                .frame(maxWidth: .infinity)

                if !(project?.isInProgress ?? false) {
                    SMSIcon(.waterWave)

                    DatePickerField(dateText: project?.endAtString ?? "") {
                        intent.projectEndAtButtonDidTap(index: index)
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

// MARK: - Reusable
private extension MyPageProjectView {
    @ViewBuilder
    func imagePlaceholder(size: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.sms(.neutral(.n10)))
            .frame(width: size, height: size)
    }
}
