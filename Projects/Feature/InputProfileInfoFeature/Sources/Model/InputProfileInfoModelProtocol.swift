import DesignSystem
import Foundation

enum InputProfileErrorField: Hashable {
    case profile
    case introduce
    case email
    case major
    case portfoilo
}

protocol InputProfileInfoStateProtocol {
    var introduce: String { get }
    var email: String { get }
    var major: String { get }
    var portfolioURL: String { get }
    var techStack: String { get }
    var isPresentedMajorSheet: Bool { get }
    var isPresentedImagePicker: Bool { get }
    var isPresentedImageMethodPicker: Bool { get }
    var isPresentedCamera: Bool { get }
    var inputProfileErrorFieldSet: Set<InputProfileErrorField> { get }
    var profileImage: PickedImageResult? { get }
}

protocol InputProfileInfoActionProtocol: AnyObject {
    func updateIntroduce(introduce: String)
    func updateEmail(email: String)
    func updateMajor(major: String)
    func updatePortfolioURL(portfolioURL: String)
    func updateTeckStack(techStack: String)
    func updateIsPresentedMajorSheet(isPresented: Bool)
    func updateIsPresentedImagePicker(isPresented: Bool)
    func updateIsPresentedImageMethodPicker(isPresented: Bool)
    func updateIsPresentedCamera(isPresented: Bool)
    func updateProfileImage(imageResult: PickedImageResult?)
    func updateErrorFieldSet(set: Set<InputProfileErrorField>)
}
