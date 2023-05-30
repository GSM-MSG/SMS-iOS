import Foundation

final class FilterModel: ObservableObject, FilterStateProtocol {
    @Published var isError: Bool = false
    @Published var isSuccess: Bool = false
}

extension FilterModel: FilterActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updateIsSuccess(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
}
