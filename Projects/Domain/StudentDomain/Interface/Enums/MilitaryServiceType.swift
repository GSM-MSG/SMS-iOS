public enum MilitaryServiceType: String, Codable, CaseIterable {
    case hope = "HOPE"
    case notHope = "NOT_HOPE"
    case noMatter = "NO_MATTER"
    case `none` = "NONE"
}

public extension MilitaryServiceType {
    func display() -> String {
        switch self {
        case .hope: return "병특 희망"
        case .notHope: return "희망하지 않음"
        case .noMatter: return "상관없음"
        case .none: return "해당 사항 없음"
        }
    }
}
