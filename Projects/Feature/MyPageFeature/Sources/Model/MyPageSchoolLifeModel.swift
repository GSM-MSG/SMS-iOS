protocol MyPageSchoolLifeStateProtocol {
    var gsmScore: String { get }
}

protocol MyPageSchoolLifeActionProtocol: AnyObject {
    func updateGSMScore(gsmScore: String)
}

extension MyPageModel: MyPageSchoolLifeActionProtocol {
    func updateGSMScore(gsmScore: String) {
        self.gsmScore = gsmScore
    }
}
