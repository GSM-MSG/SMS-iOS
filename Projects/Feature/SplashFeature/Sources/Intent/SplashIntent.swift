import AuthDomainInterface
import SplashFeatureInterface
import Foundation

final class SplashIntent: SplashIntentProtocol {
    private weak var model: (any SplashActionProtocol)?
    private weak var splashDelegate: (any SplashDelegate)?
    private let checkIsLoggedInUseCase: any CheckIsLoggedInUseCase

    init(
        model: any SplashActionProtocol,
        splashDelegate: any SplashDelegate,
        checkIsLoggedInUseCase: any CheckIsLoggedInUseCase
    ) {
        self.model = model
        self.splashDelegate = splashDelegate
        self.checkIsLoggedInUseCase = checkIsLoggedInUseCase
    }

    func onAppear() {
        Task {
            do {
                try await checkIsLoggedInUseCase.execute()
                splashDelegate?.isLoggedIn(isLoggedIn: true)
            } catch {
                splashDelegate?.isLoggedIn(isLoggedIn: false)
            }
        }
    }
}
