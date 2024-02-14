import Foundation

protocol InputTeacherInfoIntentProtocol {
    func completeButtonDidTap()
    func jobTitleSheetIsRequired()
    func jobTitleSheetDismissed()
    func gradeSheetIsRequired()
    func gradeSheetDismissed()
    func classSheetIsRequired()
    func classSheetDismissed()
}
