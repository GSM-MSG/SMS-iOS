import SwiftUI

public struct SMSIcon: View {
    var icon: Icon
    var width: CGFloat
    var height: CGFloat

    public init(
        _ icon: Icon,
        width: CGFloat = 24,
        height: CGFloat = 24
    ) {
        self.icon = icon
        self.width = width
        self.height = height
    }

    public enum Icon: CaseIterable {
        case arrowDown
        case camera
        case check
        case plus
        case rightArrow
        case smallPlus
        case xmark
    }

    public var body: some View {
        iconToImage()
            .resizable()
            .frame(width: width, height: height)
    }

    private func iconToImage() -> Image {
        switch icon {
        case .arrowDown:
            return DesignSystemAsset.Icons.arrowDown.swiftUIImage
        case .camera:
            return DesignSystemAsset.Icons.camera.swiftUIImage
        case .check:
            return DesignSystemAsset.Icons.check.swiftUIImage
        case .plus:
            return DesignSystemAsset.Icons.plus.swiftUIImage
        case .rightArrow:
            return DesignSystemAsset.Icons.rightArrow.swiftUIImage
        case .smallPlus:
            return DesignSystemAsset.Icons.smallPlus.swiftUIImage
        case .xmark:
            return DesignSystemAsset.Icons.xmark.swiftUIImage
        }
    }
}
