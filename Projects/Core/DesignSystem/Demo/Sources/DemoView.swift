import DesignSystem
import SwiftUI

struct DemoView: View {
    var body: some View {
        VStack {
            Group {
                SMSTextField("이름을 입력.. 해..!", text: .constant(""))
                    .titleWrapper("이름")

                SMSTextField("비밀번호를 입력.. 해..!", text: .constant(""))
                    .titleWrapper("비밀번호", position: .top(.trailing))
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
