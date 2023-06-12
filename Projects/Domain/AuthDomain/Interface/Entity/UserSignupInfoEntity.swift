import Foundation
import UserDomainInterface

public struct UserSignupInfoEntity: Equatable {
    public let isAlreadySignup: Bool
    public let userRole: UserRoleType

    public init(isAlreadySignup: Bool, userRole: UserRoleType) {
        self.isAlreadySignup = isAlreadySignup
        self.userRole = userRole
    }
}
