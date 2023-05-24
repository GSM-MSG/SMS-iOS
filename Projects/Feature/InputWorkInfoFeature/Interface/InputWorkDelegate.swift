public protocol InputWorkDelegate: AnyObject {
    func workPrevButtonDidTap()
    func completeToInputWork(input: InputWorkInformationObject)
}

public struct InputWorkInformationObject {
    public let formOfEmployment: String
    public let salary: Int
    public let workRegion: [String]

    public init(formOfEmployment: String, salary: Int, workRegion: [String]) {
        self.formOfEmployment = formOfEmployment
        self.salary = salary
        self.workRegion = workRegion
    }
}
