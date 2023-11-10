import DesignSystem
import SwiftUI

struct ImageMethodPickerView: View {
    private var albumAction: () -> Void
    private var cameraAction: () -> Void

    init(
        albumAction: @escaping () -> Void,
        cameraAction: @escaping () -> Void
    ) {
        self.albumAction = albumAction
        self.cameraAction = cameraAction
    }

    var body: some View {
        VStack(spacing: 28) {
            Group {
                ImageMethodRowView(title: "앨범", icon: .photo) {
                    albumAction()
                }

                ImageMethodRowView(title: "카메라", icon: .camera) {
                    cameraAction()
                }
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }
}
