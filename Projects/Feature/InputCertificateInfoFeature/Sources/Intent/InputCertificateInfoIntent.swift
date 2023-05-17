import Foundation

final class InputCertificateInfoIntent: InputCertificateInfoIntentProtocol {
    private weak var model: (any InputCertificateInfoActionProtocol)?

    init(model: any InputCertificateInfoActionProtocol) {
        self.model = model
    }

    func updateCertificate(certificate: String, at index: Int) {
        model?.updateCertificate(certificate: certificate, at: index)
    }

    func deleteCertificateColumn(at index: Int) {
        model?.deleteCertificateColumn(at: index)
    }
}
