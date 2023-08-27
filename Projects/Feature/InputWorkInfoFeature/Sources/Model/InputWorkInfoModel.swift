import Foundation
import FoundationUtil
import StudentDomainInterface

final class InputWorkInfoModel: ObservableObject, InputWorkInfoStateProtocol {
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    @Published var workRegionList: [String] = [""]
    @Published var salary: String = ""
    @Published var formOfEmployment: FormOfEmployment = .fullTime
    @Published var isPresentedFormOfEmployeementSheet: Bool = false
    var salaryDisplay: String {
        guard salary.isNotEmpty else { return "상관없음" }
        return "\(numberFormatter.string(for: Int(salary)) ?? "0") 만원"
    }
}

extension InputWorkInfoModel: InputWorkInfoActionProtocol {
    func appendWorkRegion() {
        workRegionList.append("")
    }

    func updateWorkRegion(region: String, at index: Int) {
        guard workRegionList[safe: index] != nil else { return }
        self.workRegionList[index] = region
    }

    func deleteWorkRegion(at index: Int) {
        self.workRegionList.remove(at: index)
    }

    func updateSalary(salary: String) {
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
