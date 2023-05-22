import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isSeleted = true
    @State var selection: Int? = 0

    public var body: some View {
        VStack {
            Group {
                    ForEach(0..<4) { index in
                        HStack {
                            SMSSelectionControls(isSeleted: $isSeleted)
                            Text("asdfasdf")
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
