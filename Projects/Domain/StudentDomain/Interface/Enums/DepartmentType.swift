import Foundation

// swiftlint: disable identifier_name
public enum DepartmentType: String, Codable, CaseIterable {
    case software = "SW_DEVELOPMENT"
    case smartIoT = "SMART_IOT_DEVELOPMENT"
    case ai = "AI_DEVELOPMENT"
}
// swiftlint: enable identifier_name

public extension DepartmentType {
    var display: String {
        switch self {
        case .software:
            return "소프트웨어 개발과"

        case .smartIoT:
            return "스마트 IoT 개발과"

        case .ai:
            return "인공지능 개발과"
        }
    }
}
