import BaseFeature
import SwiftUI
import DesignSystem

struct MyPageView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var container: MVIContainer<MyPageIntentProtocol, MyPageStateProtocol>
    var intent: any MyPageIntentProtocol { container.intent }
    var state: any MyPageStateProtocol { container.model }

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
                        }
                    }
                }
            }
        }
        .smsBottomSheet(isShowing: Binding(
            get: { state.isPresentedExistActionSheet },
            set: { _ in intent.existActionSheetDismissed() }
        )) {
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
        .hideKeyboardWhenTap()
        .navigationTitle("마이페이지")
        .smsBackButton(
            dismiss: dismiss
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}
