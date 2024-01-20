import Foundation

final class InputTeacherInfoModel: ObservableObject, InputTeacherInfoStateProtocol {
    @Published var isPresentedJobTitleSheet: Bool = false
    @Published var isPresentedGradeSheet: Bool = false
}

extension InputTeacherInfoModel: InputTeacherInfoActionProtocol {
    func updateIsPresentedJobTitleSheet(isPresented: Bool) {
        self.isPresentedJobTitleSheet = isPresented
    }

    func updateIsPresentedGradeSheet(isPresented: Bool) {
        self.isPresentedGradeSheet = isPresented
    }
}
