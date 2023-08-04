import Foundation
import UserDomainInterface
import AuthDomainInterface
import MyPageFeatureInterface

final class MyPageIntent: MyPageIntentProtocol {
    weak var model: (any MyPageActionProtocol)?
    private weak var myPageDelegate: (any MyPageDelegate)?
    private let fetchMyProfileUseCase: any FetchMyProfileUseCase
    private let logoutUseCase: any LogoutUseCase
    private let withdrawalUseCase: any WithdrawalUseCase

    init(
        model: any MyPageActionProtocol,
        myPageDelegate: any MyPageDelegate,
        fetchMyProfileUseCase: any FetchMyProfileUseCase,
        logoutUseCase: any LogoutUseCase,
        withdrawalUseCase: any WithdrawalUseCase
    ) {
        self.model = model
        self.myPageDelegate = myPageDelegate
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        self.logoutUseCase = logoutUseCase
        self.withdrawalUseCase = withdrawalUseCase
    }

    func existActionSheetIsRequired() {
        model?.updateIsPresentedExistActionSheet(isPresented: true)
    }

    func existActionSheetDismissed() {
        model?.updateIsPresentedExistActionSheet(isPresented: false)
    }

    func logoutDialogIsRequired() {
        model?.updateIsPresentedLogoutDialog(isPresented: true)
    }

    func logoutDialogDismissed() {
        model?.updateIsPresentedLogoutDialog(isPresented: false)
    }

    func logoutDialogIsComplete() {
        Task {
            do {
                try await logoutUseCase.execute()
                myPageDelegate?.logout()
            } catch {
                model?.updateIsError(isError: true)
            }
        }
        model?.updateIsPresentedLogoutDialog(isPresented: false)
    }

    func withdrawalDialogIsRequired() {
        model?.updateIsPresentedWithdrawalDialog(isPresented: true)
    }

    func withdrawalDialogDismissed() {
        model?.updateIsPresentedWithdrawalDialog(isPresented: false)
    }

    func withdrawalDialogIsComplete() {
        Task {
            do {
                try await withdrawalUseCase.execute()
                myPageDelegate?.logout()
            } catch {
                model?.updateIsError(isError: true)
            }
        }
        model?.updateIsPresentedWithdrawalDialog(isPresented: false)
    }

}
