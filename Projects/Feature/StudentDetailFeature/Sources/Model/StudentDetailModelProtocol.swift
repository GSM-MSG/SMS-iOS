import Foundation
import UserDomainInterface
import StudentDomainInterface

protocol StudentDetailStateProtocol {
    var userRole: UserRoleType { get }
    var studentDetailEntity: StudentDetailEntity? { get }
    var isLoading: Bool { get }
    var isDownloading: Bool { get }
    var isPresentedDreamBookExporter: Bool { get }
    var hwpDocument: HWPDocument? { get }
    var hwpFilename: String { get }
}

protocol StudentDetailActionProtocol: AnyObject {
    func updateUserRole(role: UserRoleType)
    func updateStudentDetailEntity(entity: StudentDetailEntity)
    func updateIsLoading(isLoading: Bool)
    func updateIsDownloading(isDownloading: Bool)
    func updateIsPresentedDreamBookExporter(isPresented: Bool)
    func updateHWPDocument(hwpDocument: HWPDocument)
}
