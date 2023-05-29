import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isShowing = false

    public var body: some View {
        VStack {
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isShowing = true
            }
        }
        .smsAlert(
            title: "123",
            description: "!23",
            alertAction: [
                .init(text: "Cancel", style: .outline, action: { isSeletedChange() }),
                .init(text: "Success", style: .default, action: { print("asdf") })
            ],
            isShowing:
                Binding(
                    get: { isShowing },
                    set: { _ in isSeletedChange() }
                )
        )
    }

    func isSeletedChange() {
        isShowing = false
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
