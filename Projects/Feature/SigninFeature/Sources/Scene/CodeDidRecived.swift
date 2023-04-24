import UIKit
import SwiftUI
import GAuthSignin

struct GAuthButtonView: UIViewRepresentable {
    private let completion: (String) -> Void

    func updateUIView(_ uiView: UIViewType, context: Context) { }

    func makeUIView(context: Context) -> some UIView {
        let gauthButton = GAuthButton(rounded: .rounded)
        guard let topViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .windows
            .first?
            .rootViewController
        else { return gauthButton }
        gauthButton.prepare(clientID: "dfeb634a690a4f76ba9148829171338e2817e94461c34b1794bb3e586b4296bf", redirectURI: "https://sms.msg-team.com/login", presenting: topViewController) { code in
            completion(code)
        }
        return gauthButton
    }

    init(
        completion: @escaping (String) -> Void
    ) {
        self.completion = completion
    }
}
