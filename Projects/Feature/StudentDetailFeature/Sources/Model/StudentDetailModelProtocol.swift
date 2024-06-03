import Foundation
import UserDomainInterface
import StudentDomainInterface

enum EffectiveDateType: Int, CaseIterable {
    case five = 5
    case ten = 10
    case fifteen = 15
    case twenty = 20
    case twentyFive = 25
    case thirty = 30
}

protocol StudentDetailStateProtocol {
    var userRole: UserRoleType { get }
    var studentDetailEntity: StudentDetailEntity? { get }
    var isLoading: Bool { get }
    var isPresentedEffectiveDateDialog: Bool { get }
    var effectiveDateType: EffectiveDateType { get }
    var isPresentedPasteLinkDialog: Bool { get }
    var portfolioLink: String { get }
}

protocol StudentDetailActionProtocol: AnyObject {
    func updateUserRole(role: UserRoleType)
    func updateStudentDetailEntity(entity: StudentDetailEntity)
    func updateIsLoading(isLoading: Bool)
    func updateIsPresentedEffectiveDateDialog(isPresented: Bool)
    func insertEffectiveDateType(effectiveDateType: EffectiveDateType)
    func updateIsPresentedPasteLinkDialog(isPresented: Bool)
}
