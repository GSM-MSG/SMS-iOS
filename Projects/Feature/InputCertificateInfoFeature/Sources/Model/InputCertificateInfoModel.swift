import Foundation

final class InputCertificateInfoModel: ObservableObject, InputCertificateInfoStateProtocol {
    @Published var certificates: [String] = [""]
}

extension InputCertificateInfoModel: InputCertificateInfoActionProtocol {}
