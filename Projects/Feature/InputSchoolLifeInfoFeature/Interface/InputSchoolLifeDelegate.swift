import Foundation

public protocol InputSchoolLifeDelegate: AnyObject {
    func schoolLifePrevButtonDidTap()
    func completeToInputSchoolLife(input: InputSchoolLifeInformationObject)
}

public struct InputSchoolLifeInformationObject {
    public let hwpFilename: String
    public let gsmAuthenticationScore: Int
    public let hwpData: Data

    public init(hwpFilename: String, gsmAuthenticationScore: Int, hwpData: Data) {
        self.hwpFilename = hwpFilename
        self.gsmAuthenticationScore = gsmAuthenticationScore
        self.hwpData = hwpData
    }
}
