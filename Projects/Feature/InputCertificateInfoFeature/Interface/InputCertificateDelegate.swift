public protocol InputCertificateDelegate: AnyObject {
    func certificatePrevButtonDidTap()
    func completeToInputCertificate(certificates: [String])
}
