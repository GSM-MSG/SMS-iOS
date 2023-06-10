import Foundation

public enum UserRoleType: String, Codable {
    case student = "ROLE_STUDENT"
    case teacher = "ROLE_TEACHER"
    case guest
}
