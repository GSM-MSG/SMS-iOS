import Foundation
import StudentDomainInterface

final class MyPageModel: ObservableObject, MyPageStateProtocol {
    // MARK: Profile
    @Published var profileURL: String = ""
    @Published var introduce: String = ""
    @Published var email: String = ""
    @Published var major: String = ""
    @Published var majorList: [String] = []
    @Published var portfolioURL: String = ""
    @Published var techStacks: [String] = []
    @Published var isSelfEntering: Bool = false
    @Published var isPresentedMajorSheet: Bool = false
    @Published var isPresentedImageMethodPicker: Bool = false
    @Published var isPresentedProfileCamera: Bool = false
    @Published var isPresentedProfileImage: Bool = false
    @Published var isPresentedTechStackAppend: Bool = false

    // MARK: SchoolLife
    @Published var gsmScore: String = ""

    // MARK: WorkInfo
    var workRegionList: [String] = []
    var salary: String = ""
    var salaryDisplay: String = ""
    var formOfEmployment: FormOfEmployment = .fullTime
    var isPresentedFormOfEmployeementSheet: Bool = false
}

extension MyPageModel: MyPageActionProtocol {}
