import Foundation

final class InputProjectInfoModel: InputProjectInfoStateProtocol {
    @Published var projectList: [ProjectInfo] = []
    @Published var projectErrorSetList: [Set<InputProjectInfoErrorField>] = []
}

extension InputProjectInfoModel: InputProjectInfoActionProtocol {
}
