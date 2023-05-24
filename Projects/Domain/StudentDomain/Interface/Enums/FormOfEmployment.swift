public enum FormOfEmployment: String, Codable, CaseIterable {
    case fullTime = "FULL_TIME"
    case temporary = "TEMPORARY"
    case constract = "CONSTRACT"
    case intern = "INTERN"
}

public extension FormOfEmployment {
    func display() -> String {
        switch self {
        case .fullTime: return "정규직"
        case .temporary: return "비정규직"
        case .constract: return "계약직"
        case .intern: return "인턴"
        }
    }
}
