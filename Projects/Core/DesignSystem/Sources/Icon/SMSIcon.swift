import SwiftUI

public struct SMSIcon: View {
    var icon: Icon
    var renderingMode: Image.TemplateRenderingMode
    var width: CGFloat?
    var height: CGFloat?

    public init(
        _ icon: Icon,
        renderingMode: Image.TemplateRenderingMode = .original,
        width: CGFloat? = 24,
        height: CGFloat? = 24
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
        self.width = width
        self.height = height
    }

    public enum Icon: CaseIterable {
        case book
        case camera
        case check
        case checkmark
        case downChevron
        case greenCheck
        case photo
        case plus
        case profile
        case profileSmallPlus
        case trash
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

    // swiftlint: disable cyclomatic_complexity
    private func iconToImage() -> Image {
        switch icon {
        case .book:
            return DesignSystemAsset.Icons.book.swiftUIImage

        case .camera:
            return DesignSystemAsset.Icons.camera.swiftUIImage

        case .check:
            return DesignSystemAsset.Icons.check.swiftUIImage

        case .checkmark:
            return DesignSystemAsset.Icons.checkmark.swiftUIImage

        case .downChevron:
            return DesignSystemAsset.Icons.downChevron.swiftUIImage

        case .greenCheck:
            return DesignSystemAsset.Icons.greenCheck.swiftUIImage

        case .photo:
            return DesignSystemAsset.Icons.photo.swiftUIImage

        case .plus:
            return DesignSystemAsset.Icons.plus.swiftUIImage

        case .profile:
            return DesignSystemAsset.Icons.profile.swiftUIImage

        case .profileSmallPlus:
            return DesignSystemAsset.Icons.profileSmallPlus.swiftUIImage

        case .trash:
            return DesignSystemAsset.Icons.trash.swiftUIImage

        case .leftArrow:
            return DesignSystemAsset.Icons.leftArrow.swiftUIImage

        case .smallPlus:
            return DesignSystemAsset.Icons.smallPlus.swiftUIImage

        case .xmark:
            return DesignSystemAsset.Icons.xmark.swiftUIImage
        }
    }
    // swiftlint: enable cyclomatic_complexity
}
