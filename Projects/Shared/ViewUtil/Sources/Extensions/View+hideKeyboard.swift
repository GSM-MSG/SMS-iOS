import SwiftUI

public extension View {
    func hideKeyboardWhenTap() -> some View {
        self
            .onTapGesture(perform: hideKeyboard)
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
