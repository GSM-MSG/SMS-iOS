import Foundation

protocol FilterIntentProtocol {
    func techStackAppendIsRequired()
    func techStackAppendDismissed()
    func techStackAppendDidComplete(techStacks: [String])
}
