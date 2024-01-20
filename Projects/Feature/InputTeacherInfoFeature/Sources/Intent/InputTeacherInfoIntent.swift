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
}
