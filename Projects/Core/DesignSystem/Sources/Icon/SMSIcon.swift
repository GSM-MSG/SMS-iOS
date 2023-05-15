import SwiftUI

public struct SMSIcon: View {
    var icon: Icon
    var renderingMode: Image.TemplateRenderingMode
    var width: CGFloat
    var height: CGFloat

    public init(
        _ icon: Icon,
        renderingMode: Image.TemplateRenderingMode = .original,
        width: CGFloat = 24,
        height: CGFloat = 24
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
        self.width = width
        self.height = height
    }

    public enum Icon: CaseIterable {
        case camera
        case check
        case downChevron
        case plus
        case profile
        case leftArrow
        case smallPlus
        case xmark
    }

    public var body: some View {
        iconToImage()
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: width, height: height)
    }

    private func iconToImage() -> Image {
        switch icon {
        case .camera:
            return DesignSystemAsset.Icons.camera.swiftUIImage

        case .check:
            return DesignSystemAsset.Icons.check.swiftUIImage

        case .downChevron:
            return DesignSystemAsset.Icons.downChevron.swiftUIImage

        case .plus:
            return DesignSystemAsset.Icons.plus.swiftUIImage

        case .profile:
            return DesignSystemAsset.Icons.profile.swiftUIImage

        case .leftArrow:
            return DesignSystemAsset.Icons.leftArrow.swiftUIImage

        case .smallPlus:
            return DesignSystemAsset.Icons.smallPlus.swiftUIImage

        case .xmark:
            return DesignSystemAsset.Icons.xmark.swiftUIImage
        }
    }
}
