import BaseFeature
import SwiftUI
import DesignSystem
import ViewUtil
import TechStackAppendFeatureInterface
import StudentDomainInterface

// swiftlint: disable type_body_length
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

                myPageView(geometry: geometry)

                CTAButton(text: "저장") {
                    intent.modifyToInputAllInfo(state: state)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, safeAreaInsets.bottom + 16)
                .background {
                    Color.sms(.system(.white))
                }
                .ignoresSafeArea()
            }
            .onAppear {
                intent.onAppear()
            }
            .hideKeyboardWhenTap()
        }
        .edgesIgnoringSafeArea([.bottom])
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedExitBottomSheet },
                set: { _ in intent.exitActionSheetDismissed() }
            )
        ) {
            VStack(alignment: .leading, spacing: 32) {
                Button {
                    intent.logoutDialogIsRequired()
                    intent.exitActionSheetDismissed()
                } label: {
                    HStack(spacing: 12) {
                        SMSIcon(.logout)

                        SMSText("로그아웃", font: .title2)
                            .foregroundStyle(Color.sms(.neutral(.n50)))

                        Spacer()
                    }
                }

                Button {
                    intent.withdrawalDialogIsRequired()
                    intent.exitActionSheetDismissed()
                } label: {
                    HStack(spacing: 12) {
                        SMSIcon(.redPerson)

                        SMSText("회원탈퇴", font: .title2)
                            .foregroundStyle(Color.sms(.error(.e2)))

                        Spacer()
                    }
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 20)
        }
        .animation(.default, value: state.isPresentedExitBottomSheet)
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedMilitarySheet },
                set: { _ in intent.militarySheetDismissed() }
            )
        ) {
            militaryListView()
        }
        .animation(.default, value: state.isPresentedMilitarySheet)
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedFormOfEmployeementSheet },
                set: { _ in intent.formOfEmployeementSheetDismissed() }
            )
        ) {
            DeferView {
                formOfEmployeementList()
            }
        }
        .animation(.default, value: state.isPresentedFormOfEmployeementSheet)
        .smsToast(
            text: "이미지는 최대 4개까지만 추가 할 수 있어요.",
            isShowing: Binding(
                get: { state.isPresentedProjectToast },
                set: { _ in intent.projectToastDismissed() }
            )
        )
        .smsAlert(
            title: "로그아웃",
            description: "정말로 로그아웃 하시겠습니까?",
            isShowing: Binding(
                    get: { state.isPresentedLogoutDialog },
                    set: { _ in intent.logoutDialogDismissed() }
                ),
            alertActions: [
                .init(text: "취소", style: .outline) {
                    intent.logoutDialogDismissed()
                },
                .init(text: "확인", style: .error) {
                    intent.logoutDialogIsComplete()
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
                .init(text: "취소", style: .outline) {
                    intent.withdrawalDialogDismissed()
                },
                .init(text: "확인", style: .error) {
                    intent.withdrawalDialogIsComplete()
                }
            ]
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SMSIcon(.logoutLine)
                    .onTapGesture {
                        intent.exitActionSheetIsRequired()
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
        .smsBottomSheet(
            isShowing: Binding(
                get: { state.isPresentedMajorSheet },
                set: { _ in intent.majorSheetDismissed() }
            ),
            topPadding: 150
        ) {
            majorListView()
        }
        .animation(.default, value: state.isPresentedImageMethodPicker)
        .navigationTitle("마이페이지")
        .smsBackButton(
            dismiss: dismiss
        )
        .navigationBarTitleDisplayMode(.inline)
        .smsLoading(isLoading: state.isLoading)
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
                        get: { state.isSelfEntering },
                        set: {
                            $0 ? intent.updateMajor(major: "") : ()
                            $0 ? intent.activeSelfEntering() : ()
                            $0 ? intent.majorSheetDismissed() : ()
                        }
                    )
                )
            }
        }
    }

    @ViewBuilder
    func formOfEmployeementList() -> some View {
        VStack(spacing: 16) {
            ForEach(FormOfEmployment.allCases, id: \.self) { formOfEmployment in
                HStack {
                    Text(formOfEmployment.display())
                        .smsFont(.body1, color: .neutral(.n50))

                    Spacer()

                    SMSRadioButton(
                        isSelected: Binding(
                            get: { state.formOfEmployment == formOfEmployment },
                            set: { $0 ? intent.updateFormOfEmployment(form: formOfEmployment) : () }
                        )
                    )
                    .buttonWrapper {}
                }
                .animation(.default, value: state.formOfEmployment)
                .padding(.horizontal, 20)
            }
        }
    }

    @ViewBuilder
    func militaryListView() -> some View {
        VStack(spacing: 16) {
            ForEach(MilitaryServiceType.allCases, id: \.self) { militaryServiceType in
                HStack {
                    Text(militaryServiceType.display())
                        .smsFont(.body1, color: .neutral(.n50))

                    Spacer()

                    SMSRadioButton(
                        isSelected: Binding(
                            get: { state.selectedMilitaryServiceType == militaryServiceType },
                            set: { $0 ? intent.militaryServiceTypeDidSelected(type: militaryServiceType) : () }
                        )
                    )
                    .buttonWrapper {}
                }
                .animation(.default, value: state.selectedMilitaryServiceType)
                .padding(.horizontal, 20)
            }
        }
    }

    // swiftlint: disable function_body_length
    @ViewBuilder
    func myPageView(geometry: GeometryProxy) -> some View {
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

                    MyPageMilitaryView(
                        container: .init(
                        intent: intent,
                        model: state,
                        modelChangePublisher: container.objectWillChange
                        )
                    )
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
        .imagePicker(
            isShow: Binding(
                get: { state.isPresentedProfileImage },
                set: { _ in intent.imagePickerDismissed() }
            ),
            pickedImageResult: Binding(
                get: { .none },
                set: { intent.imageDidSelected(imageResult: $0) }
            )
        )
        .cameraPicker(
            isShow: Binding(
                get: { state.isPresentedProfileCamera },
                set: { _ in intent.cameraDismissed() }
            ),
            pickedImageResult: Binding(
                get: { .none },
                set: { intent.imageDidSelected(imageResult: $0) }
            )
        )
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
    }
}
