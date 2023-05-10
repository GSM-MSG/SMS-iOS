import DesignSystem
import SwiftUI

struct DemoView: View {
    var body: some View {
        VStack {
            Group {
                TopLeadingTitleWrapperView("이름") {
                    SMSTextField("이름을 입력.. 해..!", text: .constant(""))
                }
            }
            .padding(8)
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
