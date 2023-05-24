import BaseFeature
import DesignSystem
import SwiftUI

struct InputProfileInfoView: View {
    @FocusState var isFocuesedMajorTextField: Bool
    @StateObject var container: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>
    var intent: any InputProfileInfoIntentProtocol { container.intent }
    var state: any InputProfileInfoStateProtocol { container.model }

    var body: some View {
        SMSNavigationTitleView(title: "정보입력") {
            ScrollView(showsIndicators: false) {
                Rectangle()
                    .fill(Color.sms(.neutral(.n10)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 16)

                VStack(spacing: 32) {
                    pageTitleView()

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
                                intent.imageMethodPickerIsRequired()
                            }
                            .titleWrapper("사진")

                            if state.inputProfileErrorFieldSet.contains(.profile) {
                                SMSText("이미지를 선택해주세요", font: .caption1)
                                    .foregroundColor(.sms(.system(.error)))
                            }
                        }

                        SMSTextField(
                            "1줄 자기소개 입력",
                            text: Binding(get: { state.introduce }, set: intent.updateIntroduce(introduce:)),
                            errorText: "1글자에서 50글자 사이로 입력해주세요",
                            isError: state.inputProfileErrorFieldSet.contains(.introduce)
                        )
                        .titleWrapper("자기소개")

                        SMSTextField(
                            "공개용 이메일 입력",
                            text: Binding(get: { state.email }, set: intent.updateEmail(email:)),
                            errorText: "이메일 형식에 맞게 입력해주세요",
                            isError: state.inputProfileErrorFieldSet.contains(.email)
                        )
                        .titleWrapper("이메일")

                        SMSTextField(
                            state.isSelfEntering ? "전공 분야 입력" : "전공 분야 선택",
                            text: Binding(get: { state.major }, set: intent.updateMajor(major:)),
                            errorText: "전공 분야를 선택해주세요",
                            isError: state.inputProfileErrorFieldSet.contains(.major),
                            isOnClear: false
                        )
                        .focused($isFocuesedMajorTextField)
                        .disabled(!state.isSelfEntering)
                        .overlay(alignment: .trailing) {
                            SMSIcon(.downChevron)
                                .padding(.trailing, 12)
                        }
                        .titleWrapper("분야")
                        .onTapGesture {
                            intent.majorSheetIsRequired()
                            intent.deActiveSelfEntering()
                        }

                        SMSTextField(
                            "예시) https://github.com/",
                            text: Binding(get: { state.portfolioURL }, set: intent.updatePortfolioURL(portfolioURL:)),
                            errorText: "URL 형식에 맞게 입력해주세요",
                            isError: state.inputProfileErrorFieldSet.contains(.portfoilo)
                        )
                        .titleWrapper("포트폴리오 URL")

                        SMSTextField(
                            "예시) C, Java, Python",
                            text: Binding(get: { state.techStack }, set: intent.updateTechStack(techStack:))
                        )
                        .titleWrapper("세부스택")
                    }

                    CTAButton(text: "다음") {
                        intent.nextButtonDidTap(state: state)
                    }
                    .padding(.bottom, 32)
                }
                .padding([.top, .horizontal], 20)
            }
        }
        .hideKeyboardWhenTap()
        .onChange(of: state.isSelfEntering) { newValue in
            isFocuesedMajorTextField = newValue
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
                set: { _ in intent.imageMethodPickerIsDismissed() }
            )
        ) {
            ImageMethodPickerView {
                intent.imagePickerIsRequired()
                intent.imageMethodPickerIsDismissed()
            } cameraAction: {
                intent.cameraIsRequired()
                intent.imageMethodPickerIsDismissed()
            }
        }
        .animation(.default, value: state.isPresentedImageMethodPicker)
        .cameraPicker(
            isShow: Binding(
                get: { state.isPresentedCamera },
                set: { _ in intent.cameraIsDismissed() }
            ),
            pickedImageResult: Binding(
                get: { state.profileImage },
                set: { intent.imageDidSelected(imageResult: $0) }
            )
        )
        .animation(.default, value: state.inputProfileErrorFieldSet)
    }

    @ViewBuilder
    func pageTitleView() -> some View {
        HStack(spacing: 4) {
            Text("프로필")
                .foregroundColor(.sms(.system(.black)))

            Text("*")
                .foregroundColor(.sms(.sub(.s2)))

            Spacer()

            SMSPageControl(pageCount: 6, selectedPage: 0)
        }
        .smsFont(.title1)
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
                            }
                        )
                    )
                }

                MajorRowView(
                    text: "직접입력",
                    isSeleted: Binding(
                        get: { false },
                        set: {
                            $0 ? intent.majorSheetDismissed() : ()
                            $0 ? intent.updateMajor(major: "") : ()
                            $0 ? intent.activeSelfEntering() : ()
                            self.isFocuesedMajorTextField = $0
                        }
                    )
                )
            }
        }
    }
}
