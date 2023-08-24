import DesignSystem
import NukeUI
import SwiftUI
import TagLayoutView
import ViewUtil

struct MyPageProfileView: View {
    let intent: MyPageProfileIntentProtocol
    let state: MyPageProfileStateProtocol
    let geometry: GeometryProxy

    init(
        intent: MyPageProfileIntentProtocol,
        state: MyPageProfileStateProtocol,
        geometry: GeometryProxy
    ) {
        self.intent = intent
        self.state = state
        self.geometry = geometry
    }

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    ZStack(alignment: .bottomTrailing) {
                        if let profileImageURL = URL(string: state.profileURL) {
                            LazyImage(url: profileImageURL) { image in
                                if let image = image.image {
                                    image.resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                } else {
                                    Color.sms(.neutral(.n30))
                                        .frame(width: 100, height: 100)
                                }
                            }
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
                            intent.imageMethodPickerIsRequired()
                        }
                    }
                    .titleWrapper("사진")
                }

                SMSTextField(
                    "1줄 자기소개 입력",
                    text: Binding(get: { state.introduce }, set: intent.updateIntroduce(introduce:)),
                    errorText: "1글자에서 50글자 사이로 입력해주세요"
                )
                .titleWrapper("자기소개")

                SMSTextField(
                    "공개용 이메일 입력",
                    text: Binding(get: { state.email }, set: intent.updateEmail(email:)),
                    errorText: "이메일 형식에 맞게 입력해주세요"
                )
                .keyboardType(.emailAddress)
                .titleWrapper("이메일")

                SMSTextField(
                    state.isSelfEntering ? "전공 분야 입력" : "전공 분야 선택",
                    text: Binding(get: { state.major }, set: intent.updateMajor(major:)),
                    errorText: "전공 분야를 선택해주세요",
                    isOnClear: false
                )
                .disabled(!state.isSelfEntering)
                .overlay(alignment: .topTrailing) {
                    SMSIcon(.downChevron)
                        .padding([.top, .trailing], 12)
                }
                .simultaneousGesture(
                    TapGesture()
                        .onEnded {
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
                    errorText: "URL 형식에 맞게 입력해주세요"
                ) {
                    intent.techStackAppendIsRequired()
                }
                .keyboardType(.URL)
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
        } header: {
            SectionHeaderView(title: "프로필")
        }
        .padding(.horizontal, 20)
    }
}
