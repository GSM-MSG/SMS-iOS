import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isOn = true
    @State var selection: Int? = 0

    public var body: some View {
        VStack {
            Group {
                RadioComponent(selection: $selection) {
                    ForEach(0..<4) { index in
                        HStack {
                            SMSSelectionControls(tag: index)
                            Text("asdfasdf")
                        }
                        .radioTag(index)
                    }
                }
            }
            .padding(8)

            NavigationLink {
                AView()
            } label: {
                Text("A")
            }
        }
        .smsBottomSheet(isShowing: $isPresentedBottomSheet) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.sms(.neutral(.n20)))
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .padding(.horizontal)
        }
    }
}

struct AView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("A")
            .smsBackButton(dismiss: dismiss)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
