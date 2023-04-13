import Emdpoint
import Foundation

public protocol SMSEndpoint: EndpointType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var errorMap: [Int: ErrorType] { get }
}

extension SMSEndpoint {
    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var validationCode: ClosedRange<Int> {
        200...299
    }
}
