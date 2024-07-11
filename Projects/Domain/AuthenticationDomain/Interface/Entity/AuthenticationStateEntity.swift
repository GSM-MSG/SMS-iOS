public struct AuthenticationStateEntity {
    public let name: String
    public let score: Double
    public let grader: String?
    public let markingBoardType: MarkingBoardType

    public init(name: String, score: Double, grader: String?, markingBoardType: MarkingBoardType) {
        self.name = name
        self.score = score
        self.grader = grader
        self.markingBoardType = markingBoardType
    }
}
