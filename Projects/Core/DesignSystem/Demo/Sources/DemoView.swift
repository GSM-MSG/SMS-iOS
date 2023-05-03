import DesignSystem
import SwiftUI

struct DemoView: View {
    var body: some View {
        VStack {
            Group {
                CTAButton(text: "CTA Default", style: .default)
                CTAButton(text: "CTA Outline", style: .outline)
                FillButton(text: "Fill Default", style: .default)
                FillButton(text: "Fill Default", style: .outline)
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
