import BaseFeature
import DesignSystem
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

                        projectListRowView(geometry: geometry)

                        SMSSeparator(height: 1)

                        SMSChip("추가") {
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
    func projectListRowView(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 16) {
                SMSText("프로젝트", font: .title1)
                    .foregroundColor(.sms(.system(.black)))

                Spacer()

                SMSIcon(.downChevron)

                SMSIcon(.xmarkOutline)
            }
            .padding(.bottom, 8)

            projectName()

            projectIcon()

            projectPreviewImageList()

            projectContentTextEditor()

            projectTechStack()

            projectDuration()

            projectRelatedLink(geometry: geometry)
        }
    }
}

// MARK: - View Section
private extension InputProjectInfoView {
    @ViewBuilder
    func projectName() -> some View {
        SMSTextField("프로젝트 이름 입력", text: .constant(""))
            .titleWrapper("이름")
    }

    @ViewBuilder
    func projectIcon() -> some View {
        imagePlaceholder(size: 108)
            .overlay {
                SMSIcon(.photo)
            }
            .titleWrapper("아이콘")
    }

    @ViewBuilder
    func projectPreviewImageList() -> some View {
        LazyHStack(spacing: 8) {
            imagePlaceholder(size: 132)
                .overlay {
                    VStack(spacing: 4) {
                        SMSIcon(.photo)

                        SMSText("0/4", font: .body2)
                            .foregroundColor(.sms(.system(.black)))
                    }
                }
        }
        .titleWrapper("미리보기 사진")
    }

    @ViewBuilder
    func projectContentTextEditor() -> some View {
        TextEditor(text: .constant(""))
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
                ConditionView(true) {
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
    func projectTechStack() -> some View {
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
    func projectDuration() -> some View {
        HStack(spacing: 8) {
            datePickerField {
            }
            .frame(maxWidth: .infinity)

            SMSIcon(.waterWave)

            datePickerField {
            }
            .frame(maxWidth: .infinity)
        }
        .titleWrapper("진행 기간")
    }

    @ViewBuilder
    func projectRelatedLink(geometry: GeometryProxy) -> some View {
        VStack(spacing: 8) {
            ForEach(1..<2, id: \.self) { index in
                HStack(spacing: 16) {
                    SMSTextField(
                        "이름",
                        text: .constant("")
                    )
                    .frame(maxWidth: geometry.size.width / 4)

                    SMSTextField(
                        "URL",
                        text: .constant("")
                    )
                    .frame(maxWidth: .infinity)

                    Button {
                    } label: {
                        SMSIcon(.trash)
                    }
                }
            }

            SMSChip("추가") {}
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
    func datePickerField(action: @escaping () -> Void) -> some View {
        SMSTextField(
            "yyyy.mm",
            text: .constant(""),
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
                    action()
                }
        )
    }
}
