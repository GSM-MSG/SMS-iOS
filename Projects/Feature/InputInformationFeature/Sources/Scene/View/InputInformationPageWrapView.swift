import SwiftUI

struct InputInformationPageWrapView<Selection: Hashable, Content: View>: View {
    @Binding var selection: Selection
    var content: Content

    init(
        selection: Binding<Selection>,
        @ViewBuilder content: () -> Content
    ) {
        _selection = selection
        self.content = content()
    }

    var body: some View {
        TabView(selection: $selection) {
            content
                .contentShape(Rectangle())
                .gesture(DragGesture())
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
