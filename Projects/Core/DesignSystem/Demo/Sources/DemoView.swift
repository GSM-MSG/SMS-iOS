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
                                .radioTag(index)
                            Text("asdfasdf")
                        }
                    }
                }
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
