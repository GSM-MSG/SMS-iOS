import Foundation

public enum SortType: String, Codable, CaseIterable {
    case asc = "ASCENDING"
    case desc = "DESCENDING"
}

public extension SortType {
    var display: String {
        switch self {
        case .asc:
            return "오름차순"

        case .desc:
            return "내림차순"
        }
    }
}
