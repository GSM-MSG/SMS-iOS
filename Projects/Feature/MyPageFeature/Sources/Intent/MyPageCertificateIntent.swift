protocol MyPageCertificateIntentProtocol {
    func updateCertificate(certificate: String, at index: Int)
    func deleteCertificateColumn(at index: Int)
    func certificateAppendButtonDidTap()
}

extension MyPageIntent: MyPageCertificateIntentProtocol {
    func updateCertificate(certificate: String, at index: Int) {
        model?.updateCertificate(certificate: certificate, at: index)
    }

    func deleteCertificateColumn(at index: Int) {
        model?.deleteCertificateColumn(at: index)
    }

    func certificateAppendButtonDidTap() {
        model?.appendCertificate()
    }
}
