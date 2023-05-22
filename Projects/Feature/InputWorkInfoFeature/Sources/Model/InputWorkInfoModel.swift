import Foundation
import FoundationUtil
import StudentDomainInterface

final class InputWorkInfoModel: ObservableObject, InputWorkInfoStateProtocol {
    @Published var workRegionList: [String] = [""]
    @Published var salary: String = ""
    @Published var formOfEmployment: FormOfEmployment = .fullTime
    @Published var isPresentedFormOfEmployeementSheet: Bool = false
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
        self.salary = salary
    }

    func updateFormOfEmployment(form: FormOfEmployment) {
        self.formOfEmployment = form
    }

    func updateIsPresentedFormOfEmployeementSheet(isPresented: Bool) {
        self.isPresentedFormOfEmployeementSheet = isPresented
    }
}
