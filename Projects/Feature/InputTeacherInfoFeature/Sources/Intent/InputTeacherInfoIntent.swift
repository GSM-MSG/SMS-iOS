import Foundation

final class InputTeacherInfoIntent: InputTeacherInfoIntentProtocol {
    private weak var model: (any InputTeacherInfoActionProtocol)?
    
    init(model: any InputTeacherInfoActionProtocol) {
        self.model = model
    }
}
