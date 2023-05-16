import Foundation

final class InputWorkInfoModel: ObservableObject, InputWorkInfoStateProtocol {
    @Published var workRegion: String = ""
    @Published var salary: String = ""
    @Published var isPresentedFormOfEmployeementSheet: Bool = false
}

extension InputWorkInfoModel: InputWorkInfoActionProtocol {
    func updateWorkRegion(region: String) {
        self.workRegion = region
    }

    func updateSalary(salary: String) {
        self.salary = salary
    }

    func updateIsPresentedFormOfEmployeementSheet(isPresented: Bool) {
        self.isPresentedFormOfEmployeementSheet = isPresented
    }
}
