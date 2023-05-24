import Foundation

protocol InputCertificateInfoStateProtocol {
    var certificates: [String] { get }
}

protocol InputCertificateInfoActionProtocol: AnyObject {
    func updateCertificate(certificate: String, at index: Int)
    func deleteCertificateColumn(at index: Int)
    func appendCertificate()
}
