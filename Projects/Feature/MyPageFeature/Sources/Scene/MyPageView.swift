import BaseFeature
import SwiftUI
import DesignSystem
import ViewUtil
import TechStackAppendFeatureInterface

struct MyPageView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @StateObject var container: MVIContainer<MyPageIntentProtocol, MyPageStateProtocol>
    var intent: any MyPageIntentProtocol { container.intent }
    var state: any MyPageStateProtocol { container.model }
    private let techStackAppendBuildable: any TechStackAppendBuildable

    init(
        container: MVIContainer<MyPageIntentProtocol, MyPageStateProtocol>,
        techStackAppendBuildable: any TechStackAppendBuildable
    ) {
        self.techStackAppendBuildable = techStackAppendBuildable
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(height: 1)

                ScrollView {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Group {
                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPageProfileView(intent: intent, state: state, geometry: geometry)

                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPageSchoolLifeView(intent: intent, state: state)

                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPageWorkInfoView(
                                container: .init(
                                    intent: intent,
                                    model: state,
                                    modelChangePublisher: container.objectWillChange
                                )
                            )

                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPageMilitaryView(intent: intent, state: state)
                        }

                        Group {
                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPageCertificateView(
                                container: .init(
                                    intent: intent,
                                    model: state,
                                    modelChangePublisher: container.objectWillChange
                                )
                            )

                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPageLanguageView(
                                container: .init(
                                    intent: intent,
                                    model: state,
                                    modelChangePublisher: container.objectWillChange
                                ),
                                geometry: geometry
                            )

                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPageProjectView(
                                container: .init(
                                    intent: intent,
                                    model: state,
                                    modelChangePublisher: container.objectWillChange
                                ),
                                geometry: geometry
                            )

                            SMSSeparator()
                                .padding(.vertical, 16)

                            MyPagePrizeView(
                                container: .init(
                                    intent: intent,
                                    model: state,
                                    modelChangePublisher: container.objectWillChange
                                )
                            )
                        }
                    }
                }

                CTAButton(text: "저장") {
                    #warning("저장 로직 추가")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, safeAreaInsets.bottom + 16)
                .background {
                    Color.sms(.system(.white))
                }
                .ignoresSafeArea()
            }
        }
        .edgesIgnoringSafeArea([.bottom])
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedExistActionSheet },
                set: { _ in intent.existActionSheetDismissed() }
            )
        ) {
            VStack(alignment: .leading, spacing: 32) {
                Button {
                    intent.logoutDialogIsRequired()
                    intent.existActionSheetDismissed()
                } label: {
                    HStack(spacing: 12) {
                        SMSIcon(.redLogout)

                        SMSText("로그아웃", font: .body1)
                            .foregroundStyle(Color.sms(.system(.error)))

                        Spacer()
                    }
                }

                Button {
                    intent.withdrawalDialogIsRequired()
                    intent.existActionSheetDismissed()
                } label: {
                    HStack(spacing: 12) {
                        SMSIcon(.redPerson)

                        SMSText("회원탈퇴", font: .body1)
                            .foregroundStyle(Color.sms(.system(.error)))

                        Spacer()
                    }
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 20)
        }
        .animation(.default, value: state.isPresentedExistActionSheet)
        .smsAlert(
            title: "로그아웃",
            description: "정말로 로그아웃 하시겠습니까?",
            isShowing: Binding(
                    get: { state.isPresentedLogoutDialog },
                    set: { _ in intent.logoutDialogDismissed() }
                ),
            alertActions: [
                .init(text: "확인", style: .outline) {
                    intent.logoutDialogIsComplete()
                },
                .init(text: "취소") {
                    intent.logoutDialogDismissed()
                }
            ]
        )
        .smsAlert(
            title: "회원탈퇴",
            description: "정말로 회원탈퇴 하시겠습니까?",
            isShowing: Binding(
                    get: { state.isPresentedWithdrawalDialog },
                    set: { _ in intent.withdrawalDialogDismissed() }
                ),
            alertActions: [
                .init(text: "확인", style: .outline) {
                    intent.withdrawalDialogIsComplete()
                },
                .init(text: "취소") {
                    intent.withdrawalDialogDismissed()
                }
            ]
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SMSIcon(.logoutLine)
                    .onTapGesture {
                        intent.existActionSheetIsRequired()
                    }
            }
        }
        .datePicker(
            isShowing: Binding(
                get: { state.isPresentedPrizeAtDatePicker },
                set: { _ in intent.prizeAtDismissed() }
            )
        ) { date in
            intent.prizePrizeAtDidSelect(index: state.focusedPrizeIndex, prizeAt: date)
        }
        .imagePicker(
            isShow: Binding(
                get: { state.isPresentedPreviewImagePicker },
                set: { _ in intent.projectPreviewImagePickerDismissed() }
            ),
            pickedImageResult: Binding(
                get: { .none },
                set: {
                    guard let image = $0 else { return }
                    intent.appendPreviewImage(index: state.focusedProjectIndex, image: image)
                }
            )
        )
        .datePicker(
            isShowing: Binding(
                get: { state.isPresentedProjectStartAtDatePicker },
                set: { _ in intent.projectStartAtDatePickerDismissed() }
            )
        ) { date in
            intent.projectStartAtDidSelect(index: state.focusedProjectIndex, startAt: date)
        }
        .datePicker(
            isShowing: Binding(
                get: { state.isPresentedProjectEndAtDatePicker },
                set: { _ in intent.projectEndAtDatePickerDismissed() }
            )
        ) { date in
            intent.projectEndAtDidSelect(index: state.focusedProjectIndex, endAt: date)
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { state.isPresentedProjectTechStackAppend },
                set: { _ in intent.projectTechStackAppendDismissed() }
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
        .hideKeyboardWhenTap()
        .navigationTitle("마이페이지")
        .smsBackButton(
            dismiss: dismiss
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}
