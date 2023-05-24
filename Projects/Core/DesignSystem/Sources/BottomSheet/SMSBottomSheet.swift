import SwiftUI
import ViewUtil

struct SMSBottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    @State private var dragHeight: CGFloat = 0
    @Environment(\.safeAreaInsets) var safeAreaInsets

    var content: () -> T
    var height: CGFloat
    var topPadding: CGFloat
    var cornerRadius: CGFloat
    var sheetDragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                withAnimation(.spring()) {
                    dragHeight = min(30, -value.translation.height)
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    dragHeight = 0
                }
                let verticalAmount = value.translation.height
                if verticalAmount > 100 {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
    }

    init(
        isShowing: Binding<Bool>,
        cornerRadius: CGFloat = 16,
        height: CGFloat = .infinity,
        topPadding: CGFloat = .zero,
        content: @escaping () -> T
    ) {
        _isShowing = isShowing
        self.cornerRadius = cornerRadius
        self.height = height
        self.topPadding = topPadding
        self.content = content
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            ZStack(alignment: .bottom) {
                if isShowing {
                    Color.sms(.system(.black))
                        .opacity(0.25)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isShowing = false
                            }
                        }
                        .gesture(sheetDragGesture)
                        .transition(.opacity)

                    ZStack {
                        Color.sms(.system(.white))
                            .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                            .padding(.top, -dragHeight)
                            .gesture(sheetDragGesture)

                        VStack {
                            self.content()
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.top, 24)
                        .padding(.bottom, safeAreaInsets.bottom + 24)
                        .offset(y: -dragHeight)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .bottom))
                    .padding(.top, topPadding)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

public extension View {
    func smsBottomSheet<Content: View>(
        isShowing: Binding<Bool>,
        cornerRadius: CGFloat = 16,
        topPadding: CGFloat = .zero,
        content: @escaping () -> Content
    ) -> some View {
        modifier(SMSBottomSheet(
            isShowing: isShowing,
            cornerRadius: cornerRadius,
            topPadding: topPadding,
            content: content
        ))
    }
}
