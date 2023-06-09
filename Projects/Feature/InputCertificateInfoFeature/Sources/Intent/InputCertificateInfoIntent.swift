import Foundation
import FoundationUtil
import InputCertificateInfoFeatureInterface

final class InputCertificateInfoIntent: InputCertificateInfoIntentProtocol {
    private weak var model: (any InputCertificateInfoActionProtocol)?
    private weak var certificateDelegate: (any InputCertificateDelegate)?

    init(
        model: any InputCertificateInfoActionProtocol,
        certificateDelegate: any InputCertificateDelegate
    ) {
        self.model = model
        self.certificateDelegate = certificateDelegate
    }

    func updateCertificate(certificate: String, at index: Int) {
        model?.updateCertificate(certificate: certificate, at: index)
    }

    func deleteCertificateColumn(at index: Int) {
        model?.deleteCertificateColumn(at: index)
    }

    func certificateAppendButtonDidTap() {
        model?.appendCertificate()
    }

    func prevButtonDidTap() {
        certificateDelegate?.certificatePrevButtonDidTap()
    }

    func nextButtonDidTap(certificates: [String]) {
        certificateDelegate?.completeToInputCertificate(
            certificates: certificates
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { $0.isNotEmpty }
        )
    }
}
