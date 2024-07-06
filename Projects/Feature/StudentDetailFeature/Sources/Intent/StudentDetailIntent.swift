import Foundation
import UIKit
import UserDomainInterface
import StudentDomainInterface
import EventLimiter

final class StudentDetailIntent: StudentDetailIntentProtocol {
    private let userID: String
    private weak var model: (any StudentDetailActionProtocol)?
    private let loadUserRoleUseCase: any LoadUserRoleUseCase
    private let fetchStudentDetailUseCase: any FetchStudentDetailUseCase
    private let createPortfolioLinkUseCase: any CreatePortfolioLinkUseCase
    private let throttler = Throttler(for: 1)

    init(
        userID: String,
        model: any StudentDetailActionProtocol,
        loadUserRoleUseCase: any LoadUserRoleUseCase,
        fetchStudentDetailUseCase: any FetchStudentDetailUseCase,
        createPortfolioLinkUseCase: any CreatePortfolioLinkUseCase
    ) {
        self.userID = userID
        self.model = model
        self.loadUserRoleUseCase = loadUserRoleUseCase
        self.fetchStudentDetailUseCase = fetchStudentDetailUseCase
        self.createPortfolioLinkUseCase = createPortfolioLinkUseCase
    }

    func onAppear() {
        let userRole = loadUserRoleUseCase.execute()
        model?.updateUserRole(role: userRole)
        model?.updateIsLoading(isLoading: true)

        Task(priority: .userInitiated) {
            defer { model?.updateIsLoading(isLoading: false)}
            do {
                let studentDetailEntity = try await self.fetchStudentDetailUseCase.execute(
                    userID: userID,
                    viewee: userRole.toDetailViewTpye
                )
                model?.updateStudentDetailEntity(entity: studentDetailEntity)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func effectiveDateDialogIsRequired() {
        model?.updateIsPresentedEffectiveDateDialog(isPresented: true)
    }

    func effectiveDateDialogDismissed() {
        model?.updateIsPresentedEffectiveDateDialog(isPresented: false)
    }

    func effectiveDateSelect(effectiveDate: EffectiveDateType) {
        model?.insertEffectiveDateType(effectiveDateType: effectiveDate)
    }

    func pasteLinkDialogIsRequired() {
        model?.updateIsPresentedPasteLinkDialog(isPresented: true)
    }

    func pasteLinkDialogDismissed() {
        model?.updateIsPresentedPasteLinkDialog(isPresented: false)
    }

    func pastePortfolioLink(portfolioLink: String) {
        UIPasteboard.general.string = portfolioLink
    }

    func createPortfolioLink(state: any StudentDetailStateProtocol, portfolioLink: String) {
        Task {
            do {
                let createPortfolioLinkRequest = CreatePortfolioLinkRequestDTO(
                    studentID: userID,
                    periodDay: state.effectiveDateType.rawValue
                )

                let token = try await createPortfolioLinkUseCase.execute(req: createPortfolioLinkRequest)
                model?.updateToken(token: token.token)
                model?.updatePortfolioLink(portfolioLink: "https:/$()/sms.msg-team.com/student/link?token=\(token.token)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

private extension UserRoleType {
    var toDetailViewTpye: FetchStudentDetailViewType {
        switch self {
        case .guest: return .guest
        case .student: return .student
        case .teacher: return .teacher
        }
    }
}
