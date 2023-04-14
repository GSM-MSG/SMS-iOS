import Emdpoint
import Foundation

public protocol SMSEndpoint: EndpointType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var errorMap: [Int: ErrorType]? { get }
}

extension SMSEndpoint {
    public var baseURL: URL {
        URL(
            string: Bundle.module.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        ) ?? URL(string: "https://www.google.com")!
    }

    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var validationCode: ClosedRange<Int> {
        200...299
    }
}

private final class BundleFinder {}

private extension Foundation.Bundle {
    static let module = Bundle(for: BundleFinder.self)
}
