import DesignSystem
import InputInformationBaseFeature
import SwiftUI
import ViewUtil

struct InputProjectInfoView: View {
    var body: some View {
        SMSNavigationTitleView(title: "프로젝트") {
            ScrollView(showsIndicators: true) {
                SMSSeparator()

                VStack(spacing: 32) {
                    InputInformationPageTitleView(title: "프로젝트", isRequired: false, pageCount: 7, selectedPage: 6)

                    projectListRowView()

                    SMSChip("추가") {}
                    .foregroundColor(.sms(.system(.black)))
                    .aligned(.trailing)
                }
                .padding([.top, .horizontal], 20)
            }
        }
    }

    @ViewBuilder
    func projectListRowView() -> some View {
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
            .colorMultiply(.sms(.neutral(.n10)))
            .frame(minHeight: 48)
            .cornerRadius(8)
            .roundedStroke(cornerRadius: 8, color: .sms(.primary(.p1)), lineWidth: 1)
            .overlay(alignment: .topLeading) {
                ConditionView(true) {
                    SMSText("프로젝트 내용 입력", font: .body1)
                        .foregroundColor(.sms(.neutral(.n30)))
                        .padding([.top, .leading], 12)
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
