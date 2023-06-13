import Foundation

final class SplashIntent: SplashIntentProtocol {
    private weak var model: (any SplashActionProtocol)?

    init(model: any SplashActionProtocol) {
        self.model = model
    }

    func onAppear() {
        
    }
}
