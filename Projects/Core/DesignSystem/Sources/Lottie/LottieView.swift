import Lottie
import SwiftUI

public struct LottieView: UIViewRepresentable {
    private let asset: AnimationAsset
    private let loopMode: LottieLoopMode
    private let contentMode: UIView.ContentMode

    public init(
        asset: AnimationAsset,
        loopMode: LottieLoopMode = .loop,
        contentMode: UIView.ContentMode = .scaleAspectFit
    ) {
        self.asset = asset
        self.loopMode = loopMode
        self.contentMode = contentMode
    }

    public func makeUIView(context: Context) -> some UIView {
        let lottieView = LottieAnimationView(
            animation: AnimationAsset.smsLoading.animation
        )
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.loopMode = loopMode
        lottieView.contentMode = contentMode
        lottieView.play()

        let containerView = UIView(frame: .zero)
        containerView.addSubview(lottieView)
        NSLayoutConstraint.activate([
            lottieView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            lottieView.widthAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
        return containerView
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {}
}
