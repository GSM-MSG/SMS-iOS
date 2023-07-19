import Foundation
import InputPrizeInfoFeatureInterface

final class InputPrizeInfoIntent: InputPrizeInfoIntentProtocol {
    private weak var model: (any InputPrizeInfoActionProtocol)?
    private weak var prizeDelegate: (any InputPrizeDelegate)?

    init(
        model: any InputPrizeInfoActionProtocol,
        prizeDelegate: any InputPrizeDelegate
    ) {
        self.model = model
        self.prizeDelegate = prizeDelegate
    }
}
