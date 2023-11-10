import Foundation
import StudentDomainInterface
import FoundationUtil

final class MyPageModel: ObservableObject, MyPageStateProtocol {
    // MARK: MyPage
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var isPresentedExitBottomSheet: Bool = false
    @Published var isPresentedLogoutDialog: Bool = false
    @Published var isPresentedWithdrawalDialog: Bool = false
    @Published var isCompleteModify: Bool = false

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
    @Published var profileErrorFieldSet: Set<MyPageProfileErrorField> = []

    // MARK: SchoolLife
    @Published var gsmScore: String = ""

    // MARK: WorkInfo
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    @Published var workRegionList: [String] = []
    @Published var salary: String = ""
    @Published var formOfEmployment: FormOfEmployment = .fullTime
    @Published var isPresentedFormOfEmployeementSheet: Bool = false
    var salaryDisplay: String {
        guard salary.isNotEmpty else { return "상관없음" }
        return "\(numberFormatter.string(for: Int(salary)) ?? "0") 만원"
    }

    // MARK: Military
    @Published var selectedMilitaryServiceType: MilitaryServiceType = .hope
    @Published var isPresentedMilitarySheet: Bool = false

    // MARK: Certificate
    @Published var certificates: [String] = []

    // MARK: Language
    @Published var languageList: [LanguageModel] = []

    // MARK: Project
    @Published var projectList: [ProjectModel] = []
    @Published var collapsedProject: [Bool] = []
    @Published var focusedProjectIndex: Int = 0
    @Published var isPresentedProjectImagePicker: Bool = false
    @Published var isPresentedPreviewImagePicker: Bool = false
    @Published var isPresentedProjectStartAtDatePicker: Bool = false
    @Published var isPresentedProjectEndAtDatePicker: Bool = false
    @Published var isPresentedProjectTechStackAppend: Bool = false
    @Published var isPresentedProjectToast: Bool = false
    @Published var projectErrorSetList: [Set<MyPageProjectInfoErrorField>] = []

    // MARK: Prize
    @Published var prizeList: [PrizeModel] = []
    @Published var collapsedPrize: [Bool] = []
    @Published var isPresentedPrizeAtDatePicker: Bool = false
    @Published var focusedPrizeIndex: Int = 0
    @Published var prizeErrorSetList: [Set<MyPagePrizeInfoErrorField>] = []
}

extension MyPageModel: MyPageActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateIsPresentedExitBottomSheet(isPresented: Bool) {
        self.isPresentedExitBottomSheet = isPresented
    }

    func updateIsPresentedLogoutDialog(isPresented: Bool) {
        self.isPresentedLogoutDialog = isPresented
    }

    func updateIsPresentedWithdrawalDialog(isPresented: Bool) {
        self.isPresentedWithdrawalDialog = isPresented
    }

    func updateIsCompleteModify(isComplete: Bool) {
        self.isCompleteModify = isComplete
    }
}
