import Foundation

final class InputCertificateInfoIntent: InputCertificateInfoIntentProtocol {
    private weak var model: (any InputCertificateInfoActionProtocol)?

    init(model: any InputCertificateInfoActionProtocol) {
        self.model = model
    }

    func updateCertificate(certificate: String, at index: Int) {
    }
}
