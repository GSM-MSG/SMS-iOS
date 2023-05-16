import Foundation

final class InputWorkInfoIntent: InputWorkInfoIntentProtocol {
    private weak var model: (any InputWorkInfoActionProtocol)?

    init(model: any InputWorkInfoActionProtocol) {
        self.model = model
    }

    func updateWorkRegion(region: String) {
        model?.updateWorkRegion(region: region)
    }

    func updateSalary(salary: String) {
        model?.updateSalary(salary: salary)
    }
}
