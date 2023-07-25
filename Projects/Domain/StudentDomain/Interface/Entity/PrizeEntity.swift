public struct PrizeEntity: Equatable, Hashable {
    public let name: String
    public let type: String
    public let date: String

    public init(name: String, type: String, date: String) {
        self.name = name
        self.type = type
        self.date = date
    }
}
