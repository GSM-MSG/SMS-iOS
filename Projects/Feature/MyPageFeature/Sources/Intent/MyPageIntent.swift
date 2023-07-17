import Foundation

final class MyPageIntent:MyPageIntentProtocol {
    private weak var model: (any MyPageActionProtocol)?

    init(model: any MyPageActionProtocol) {
        self.model = model
    }
}
