import FoundationUtil
import StudentDomainInterface

protocol MyPageWorkInfoStateProtocol {
    var workRegionList: [String] { get }
    var salary: String { get }
    var salaryDisplay: String { get }
    var formOfEmployment: FormOfEmployment { get }
    var isPresentedFormOfEmployeementSheet: Bool { get }
}

protocol MyPageWorkInfoActionProtocol: AnyObject {
    func appendWorkRegion()
    func updateWorkRegion(region: String, at index: Int)
    func updateWorkRegions(regions: [String])
    func deleteWorkRegion(at index: Int)
    func updateSalary(salary: String)
    func updateFormOfEmployment(form: FormOfEmployment)
    func updateIsPresentedFormOfEmployeementSheet(isPresented: Bool)
}

extension MyPageModel: MyPageWorkInfoActionProtocol {
    func appendWorkRegion() {
        self.workRegionList.append("")
    }

    func updateWorkRegion(region: String, at index: Int) {
        guard workRegionList[safe: index] != nil else { return }
        self.workRegionList[index] = region
    }

    func updateWorkRegions(regions: [String]) {
        self.workRegionList = regions
    }

    func deleteWorkRegion(at index: Int) {
        self.workRegionList.remove(at: index)
    }

    func updateSalary(salary: String) {
        guard salary.isNotEmpty else {
            self.salary = ""
            return
        }
        guard let salaryInt = Int(salary).map({ String(min($0, 9999)) }) else { return }
        self.salary = salaryInt
    }

    func updateFormOfEmployment(form: FormOfEmployment) {
        self.formOfEmployment = form
    }

    func updateIsPresentedFormOfEmployeementSheet(isPresented: Bool) {
        self.isPresentedFormOfEmployeementSheet = isPresented
    }
}
