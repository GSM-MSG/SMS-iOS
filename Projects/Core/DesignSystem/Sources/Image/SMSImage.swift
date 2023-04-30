import SwiftUI

fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

public struct SMSImage: View {
    public enum Image {
        case background
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
            return DesignSystemAsset.Images.background.suiImage
        }
    }
}
