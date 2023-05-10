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

            NavigationLink {
                AView()
            } label: {
                Text("A")
            }
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
