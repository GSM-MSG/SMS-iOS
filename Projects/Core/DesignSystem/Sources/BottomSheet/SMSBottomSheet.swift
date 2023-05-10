import SwiftUI
import ViewUtil

struct SMSBottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    @State private var dragHeight: CGFloat = 0
    var content: () -> T
    var height: CGFloat
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
        content: @escaping () -> T
    ) {
        _isShowing = isShowing
        self.cornerRadius = cornerRadius
        self.height = height
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
                        .padding(.bottom, 42)
                        .offset(y: -dragHeight)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .bottom))
                    .if(height != .infinity) {
                        $0.frame(height: height)
                    }
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
        cornerRadius: CGFloat = 25,
        content: @escaping () -> Content
    ) -> some View {
        modifier(SMSBottomSheet(
            isShowing: isShowing,
            cornerRadius: cornerRadius,
            content: content
        ))
    }
}
