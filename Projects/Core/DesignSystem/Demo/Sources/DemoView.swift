import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isLoading = false

    public var body: some View {
        VStack {
            CTAButton(text: "테스트", style: .error)
            CTAButton(text: "테스트", style: .error)
            CTAButton(text: "테스트", style: .error)
                .disabled(true)
        }
        .padding(.horizontal, 20)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
