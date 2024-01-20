import Foundation

protocol InputTeacherInfoStateProtocol {
    var isPresentedJobTitleSheet: Bool { get }
}

protocol InputTeacherInfoActionProtocol: AnyObject {
    func updateIsPresentedJobTitleSheet(isPresented: Bool)
}
