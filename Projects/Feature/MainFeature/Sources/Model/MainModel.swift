import Foundation

final class MainModel: ObservableObject, MainStateProtocol {
    @Published var isError: Bool = false
    @Published var isSuccess: Bool = false
}

extension MainModel: MainActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updateIsSuccess(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
}
