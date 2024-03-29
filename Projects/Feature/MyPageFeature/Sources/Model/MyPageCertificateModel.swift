import FoundationUtil

protocol MyPageCertificateStateProtocol {
    var certificates: [String] { get }
}

protocol MyPageCertificateActionProtocol: AnyObject {
    func updateCertificate(certificate: String, at index: Int)
    func updateCertificates(certificates: [String])
    func deleteCertificateColumn(at index: Int)
    func appendCertificate()
}

extension MyPageModel: MyPageCertificateActionProtocol {
    func updateCertificate(certificate: String, at index: Int) {
        guard certificates[safe: index] != nil else { return }
        certificates[index] = certificate
    }

    func updateCertificates(certificates: [String]) {
        self.certificates = certificates
    }

    func deleteCertificateColumn(at index: Int) {
        certificates.remove(at: index)
    }

    func appendCertificate() {
        certificates.append("")
    }
}
