import Foundation

protocol StudentDetailIntentProtocol {
    func onAppear()
    func effectiveDateDialogIsRequired()
    func effectiveDateDialogDismissed()
    func effectiveDateSelect(effectiveDate: EffectiveDateType)
}
