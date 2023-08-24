protocol MyPageSchoolLifeIntentProtocol {
    func updateGSMScore(gsmScore: String)
}

extension MyPageIntent: MyPageSchoolLifeIntentProtocol {
    func updateGSMScore(gsmScore: String) {
        model?.updateGSMScore(gsmScore: gsmScore)
    }
}
