import Foundation

final class InputTeacherInfoModel: ObservableObject, InputTeacherInfoStateProtocol {
    @Published var isPresentedJobTitleSheet: Bool = false
}

extension InputTeacherInfoModel: InputTeacherInfoActionProtocol {
    func updateIsPresentedJobTitleSheet(isPresented: Bool) {
        self.isPresentedJobTitleSheet = isPresented
    }
}
