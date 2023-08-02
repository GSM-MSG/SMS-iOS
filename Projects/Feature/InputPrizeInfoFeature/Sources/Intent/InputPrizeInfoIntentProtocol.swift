import Foundation

protocol InputPrizeInfoIntentProtocol {
    func prevButtonDidTap()
    func nextButtonDidTap(prizes: [PrizeInfo])
    func prizeToggleButtonDidTap(index: Int)
    func prizeRemoveButtonDidTap(index: Int)
    func updatePrizeName(index: Int, name: String)
    func updatePrizePrize(index: Int, prize: String)
    func updatePrizePrizeAt(index: Int, prizeAt: Date)
    func prizePrizeAtDidSelect(index: Int, prizeAt: Date)
    func appendEmptyPrize()
    func removePrize(index: Int)
    func prizeAtButtonDidTap(index: Int)
    func prizeAtDismissed()
    func prizeAppendButtonDidTap()
}
