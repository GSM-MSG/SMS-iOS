import Foundation

final class InputAuthenticationModel: ObservableObject, InputAuthenticationStateProtocol {
    @Published var authenticationTitle: String = ""
    @Published var authenticationContent: String = ""
    @Published var authenticationList: [AuthenticationInfo] = []
}

extension InputAuthenticationModel: InputAuthenticationActionProtocol {
    func appendEmptyAuthentication() {
        let newAuthentication = AuthenticationInfo(
            title: "",
            content: ""
        )
        self.authenticationList.append(newAuthentication)
    }

    func updateAuthenticationTitle(index: Int, title: String) {
        guard authenticationList[safe: index] != nil else { return }
        self.authenticationList[index].title = title
    }

    func updateAuthenticationContent(index: Int, content: String) {
        guard authenticationList[safe: index] != nil else { return }
        self.authenticationList[index].content = content
    }
}
