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
        ZStack(alignment: .topTrailing) {
            TabView(selection: $selection) {
                content
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}
