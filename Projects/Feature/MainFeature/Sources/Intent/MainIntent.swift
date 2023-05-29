import Combine
import MainFeatureInterface

final class MainIntent: MainIntentProtocol {
    private weak var model: (any MainActionProtocol)?
    private weak var mainDelegate: (any MainDelegate)?

    init(
        model: any MainActionProtocol,
        mainDelegate: any MainDelegate
    ) {
        self.mainDelegate = mainDelegate
        self.model = model
    }
}
