import Foundation

final class InputWorkInfoModel: ObservableObject, InputWorkInfoStateProtocol {
    @Published var workRegion: String = ""
    @Published var salary: String = ""
}

extension InputWorkInfoModel: InputWorkInfoActionProtocol {
    func updateWorkRegion(region: String) {
        self.workRegion = region
    }

    func updateSalary(salary: String) {
        self.salary = salary
    }
}
