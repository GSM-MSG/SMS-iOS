import Foundation
import InputTeacherInfoFeatureInterface

final class InputTeacherInfoIntent: InputTeacherInfoIntentProtocol {
    private weak var model: (any InputTeacherInfoActionProtocol)?
    private weak var teacherDelegate: (any InputTeacherDelegate)?

    init(
        model: any InputTeacherInfoActionProtocol,
        teacherDelegate: any InputTeacherDelegate
    ) {
        self.model = model
        self.teacherDelegate = teacherDelegate
    }

    func completeButtonDidTap() {
        teacherDelegate?.completeToInputTeacherInformation()
    }

    func jobTitleSheetIsRequired() {
        model?.updateIsPresentedJobTitleSheet(isPresented: true)
    }

    func jobTitleSheetDismissed() {
        model?.updateIsPresentedJobTitleSheet(isPresented: false)
    }

    func gradeSheetIsRequired() {
        model?.updateIsPresentedGradeSheet(isPresented: true)
    }

    func gradeSheetDismissed() {
        model?.updateIsPresentedGradeSheet(isPresented: false)
    }

    func classSheetIsRequired() {
        model?.updateIsPresentedClassSheet(isPresented: true)
    }

    func classSheetDismissed() {
        model?.updateIsPresentedClassSheet(isPresented: false)
    }
}
