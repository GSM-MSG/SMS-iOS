import SwiftUI

public extension View {
    func aligned(_ alignment: HorizontalAlignment) -> some View {
        HStack(spacing: 0) {
            if alignment == .trailing {
                Spacer()
            }

            self

            if alignment == .leading {
                Spacer()
            }
        }
    }

    func aligned(_ alignment: VerticalAlignment) -> some View {
        VStack(spacing: 0) {
            if alignment == .bottom {
                Spacer()
            }

            self

            if alignment == .top {
                Spacer()
            }
        }
    }
}
