import Foundation

protocol InputTeacherInfoStateProtocol {
    var isPresentedJobTitleSheet: Bool { get }
    var isPresentedGradeSheet: Bool { get }
}

protocol InputTeacherInfoActionProtocol: AnyObject {
    func updateIsPresentedJobTitleSheet(isPresented: Bool)
    func updateIsPresentedGradeSheet(isPresented: Bool)
}
