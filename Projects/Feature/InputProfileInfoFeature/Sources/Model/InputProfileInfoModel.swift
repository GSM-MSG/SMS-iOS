import Foundation

final class InputProfileInfoModel: ObservableObject, InputProfileInfoStateProtocol {
    @Published var introduce: String = ""
    @Published var email: String = ""
    @Published var major: String = ""
    @Published var portfoiloURL: String = ""
    @Published var techStack: String = ""
}

extension InputProfileInfoModel: InputProfileInfoActionProtocol {}
