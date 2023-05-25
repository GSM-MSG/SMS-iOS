import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isSeleted = false
    @State var selection: Int? = 0

    public var body: some View {
        VStack {
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isSeleted = true
            }
        }
        .smsDialog(
            title: "123",
            description: "!23",
            checkText: "123",
            cancelText: "123",
            checkAction: { print("asdf") },
            cancelAction: { isSeletedChange() },
            isShowing:
                Binding(
                    get: { isSeleted },
                    set: { _ in isSeletedChange() }
                )
        )
    }

    func isSeletedChange() {
        isSeleted = false
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
