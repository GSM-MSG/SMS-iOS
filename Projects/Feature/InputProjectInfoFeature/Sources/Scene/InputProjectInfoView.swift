import BaseFeature
import DesignSystem
import FoundationUtil
import InputInformationBaseFeature
import SwiftUI
import ViewUtil

struct InputProjectInfoView: View {
    @FocusState var projectContentIsFocused: Bool

    @StateObject var container: MVIContainer<InputProjectInfoIntentProtocol, InputProjectInfoStateProtocol>
    var intent: any InputProjectInfoIntentProtocol { container.intent }
    var state: any InputProjectInfoStateProtocol { container.model }

    init(
        container: MVIContainer<InputProjectInfoIntentProtocol, InputProjectInfoStateProtocol>
    ) {
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        GeometryReader { geometry in
            SMSNavigationTitleView(title: "프로젝트") {
                ScrollView(showsIndicators: true) {
                    SMSSeparator()

                    VStack(spacing: 32) {
                        InputInformationPageTitleView(title: "프로젝트", isRequired: false, pageCount: 7, selectedPage: 6)

                        ForEach(state.projectList.indices, id: \.self) { index in
                            projectListRowView(index: index, geometry: geometry)
                        }

                        SMSSeparator(height: 1)

                        SMSChip("추가") {
                            withAnimation {
                                intent.projectAppendButtonDidTap()
                            }
                        }
                        .foregroundColor(.sms(.system(.black)))
                        .aligned(.trailing)
                    }
                    .padding([.top, .horizontal], 20)
                }
            }
        }
    }

    @ViewBuilder
    func projectListRowView(index: Int, geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 16) {
                SMSText("프로젝트", font: .title1)
                    .foregroundColor(.sms(.system(.black)))

                Spacer()

                SMSIcon(.downChevron)

                SMSIcon(.xmarkOutline)
            }
            .padding(.bottom, 8)

            projectName(index: index)

            projectIcon(index: index)

            projectPreviewImageList(index: index)

            projectContentTextEditor(index: index)

            projectTechStack(index: index)

            projectDuration(index: index)

            projectRelatedLink(index: index, geometry: geometry)
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
            )
        )
        .titleWrapper("이름")
    }

    @ViewBuilder
    func projectIcon(index: Int) -> some View {
        if let iconData = state.projectList[safe: index]?.iconImage {
            Image(uiImage: UIImage(data: iconData) ?? .init())
                .resizable()
                .frame(width: 108, height: 108)
                .cornerRadius(8)
        } else {
            imagePlaceholder(size: 108)
                .overlay {
                    SMSIcon(.photo)
                }
                .titleWrapper("아이콘")
        }
    }

    @ViewBuilder
    func projectPreviewImageList(index: Int) -> some View {
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
                }

            ForEach(projectPreviewImages, id: \.self) { previewImageData in
                Image(uiImage: UIImage(data: previewImageData) ?? .init())
                    .resizable()
                    .frame(width: 132, height: 132)
                    .cornerRadius(8)
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
        .focused($projectContentIsFocused)
        .colorMultiply(.sms(.neutral(.n10)))
        .frame(minHeight: 48)
        .cornerRadius(8)
        .roundedStroke(
            cornerRadius: 8,
            color: projectContentIsFocused ? .sms(.primary(.p1)) : .clear,
            lineWidth: projectContentIsFocused ? 1 : 0
        )
        .overlay(alignment: .topLeading) {
            ConditionView(projectContent.isEmpty) {
                SMSText("프로젝트 내용 입력", font: .body1)
                    .foregroundColor(.sms(.neutral(.n30)))
                    .padding([.top, .leading], 12)
                    .onTapGesture {
                        projectContentIsFocused = true
                    }
            }
        }
        .titleWrapper("내용")
    }

    @ViewBuilder
    func projectTechStack(index: Int) -> some View {
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
        .buttonWrapper {}
        .titleWrapper("사용 기술")
    }

    @ViewBuilder
    func projectDuration(index: Int) -> some View {
        HStack(spacing: 8) {
            let project = state.projectList[safe: index]
            datePickerField(dateText: project?.startAtString ?? "") {
                intent.projectStartAtDidSelect(index: index, startAt: $0)
            }
            .frame(maxWidth: .infinity)

            SMSIcon(.waterWave)

            datePickerField(dateText: project?.endAtString ?? "") {
                intent.projectEndAtDidSelect(index: index, endAt: $0)
            }
            .frame(maxWidth: .infinity)
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

    @ViewBuilder
    func datePickerField(dateText: String, action: @escaping (Date) -> Void) -> some View {
        SMSTextField(
            "yyyy.mm",
            text: Binding(
                get: { dateText },
                set: { _ in }
            ),
            isOnClear: false
        )
        .disabled(true)
        .overlay(alignment: .trailing) {
            SMSIcon(.calendar)
                .padding(.trailing, 12)
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    action(.init())
                }
        )
    }
}
