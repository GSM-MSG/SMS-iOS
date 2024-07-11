import AuthenticationDomainInterface

struct GSMAuthenticationStateModel {
    var name: String
    var score: Double
    var grader: String?
    var markingBoardType: MarkingBoardType
}
