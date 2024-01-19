import Foundation
import InputTeacherInfoFeatureInterface

final class InputTeacherInfoIntent: InputTeacherInfoIntentProtocol {
    private weak var model: (any InputTeacherInfoActionProtocol)?
    
    init(model: any InputTeacherInfoActionProtocol) {
        self.model = model
    }
}
