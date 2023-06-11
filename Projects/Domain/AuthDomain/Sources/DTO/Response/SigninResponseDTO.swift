import AuthDomainInterface
import Foundation
import UserDomainInterface

struct SigninResponseDTO: Decodable {
    let isExist: Bool
    let role: UserRoleType
}

extension SigninResponseDTO {
    func toDomain() -> UserSignupInfoEntity {
        UserSignupInfoEntity(
            isAlreadySignup: isExist,
            userRole: role
        )
    }
}
