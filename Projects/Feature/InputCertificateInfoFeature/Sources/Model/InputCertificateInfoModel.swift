import Foundation

final class InputCertificateInfoModel: ObservableObject, InputCertificateInfoStateProtocol {
    @Published var certificates: [String] = [""]
}

extension InputCertificateInfoModel: InputCertificateInfoActionProtocol {
    func updateCertificate(certificate: String, at index: Int) {
        guard self.certificates[safe: index] != nil else { return }
        self.certificates[index] = certificate
    }

    func deleteCertificateColumn(at index: Int) {
        self.certificates.remove(at: index)
    }

    func appendCertificate() {
        self.certificates.append("")
    }
}
