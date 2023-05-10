import DesignSystem
import SwiftUI

struct DemoView: View {
    @State var isPresentedBottomSheet = false
    var body: some View {
        VStack {
            Group {
                CTAButton(text: "CTA Default", style: .default) {
                    withAnimation {
                        isPresentedBottomSheet = true
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
