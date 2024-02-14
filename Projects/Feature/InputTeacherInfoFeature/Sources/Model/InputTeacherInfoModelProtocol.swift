import Foundation

protocol InputTeacherInfoStateProtocol {
    var isPresentedJobTitleSheet: Bool { get }
    var isPresentedGradeSheet: Bool { get }
    var isPresentedClassSheet: Bool { get }
}

protocol InputTeacherInfoActionProtocol: AnyObject {
    func updateIsPresentedJobTitleSheet(isPresented: Bool)
    func updateIsPresentedGradeSheet(isPresented: Bool)
    func updateIsPresentedClassSheet(isPresented: Bool)
}
