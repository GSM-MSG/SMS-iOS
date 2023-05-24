import UIKit
import SwiftUI
import GAuthSignin
import BaseFeature

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
        gauthButton.prepare(
            clientID: Bundle.main.object(forInfoDictionaryKey: "CLIENT_ID") as? String ?? "",
            redirectURI: Bundle.main.object(forInfoDictionaryKey: "REDIREDCT_URI") as? String ?? "",
            presenting: topViewController
        ) { code in
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
