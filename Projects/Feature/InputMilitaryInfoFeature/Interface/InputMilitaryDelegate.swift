public protocol InputMilitaryDelegate: AnyObject {
    func militaryPrevButtonDidTap()
    func completeToInputMilitary(militaryServiceType: String)
}
