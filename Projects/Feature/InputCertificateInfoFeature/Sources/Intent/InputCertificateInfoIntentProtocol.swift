import Foundation

protocol InputCertificateInfoIntentProtocol {
    func updateCertificate(certificate: String, at index: Int)
    func deleteCertificateColumn(at index: Int)
    func certificateAppendButtonDidTap()
    func prevButtonDidTap()
    func nextButtonDidTap()
}
