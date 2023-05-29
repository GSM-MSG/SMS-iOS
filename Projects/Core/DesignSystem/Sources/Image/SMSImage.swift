import SwiftUI

public struct SMSImage: View {
    public enum Image {
        case background
        case smsLogo
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        smsImageToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func smsImageToImage() -> SwiftUI.Image {
        switch image {
        case .background:
            return DesignSystemAsset.Images.background.swiftUIImage

        case .smsLogo:
            return DesignSystemAsset.Images.smsLogo.swiftUIImage
        }
    }
}
