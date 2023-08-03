import BaseFeature
import SwiftUI
import DesignSystem

struct MyPageView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var container: MVIContainer<MyPageIntentProtocol, MyPageStateProtocol>
    var intent: any MyPageIntentProtocol { container.intent }
    var state: any MyPageStateProtocol { container.model }

    var body: some View {
        ScrollView {
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
//                .conditional(state.currentUserRole != .guest)
            }
            .padding(.top, 12)
            .padding(.horizontal, 20)
        }
        .animation(.default, value: state.isPresentedExistActionSheet)
        .smsAlert(
            title: "로그아웃",
            description: "정말로 로그아웃 하시겠습니까?",
            isShowing:
                Binding(
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
            isShowing:
                Binding(
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
