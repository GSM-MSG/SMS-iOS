import BaseFeature
import DesignSystem
import SwiftUI

struct StudentDetailView: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.dismiss) var dismiss
    @StateObject var container: MVIContainer<StudentDetailIntentProtocol, StudentDetailStateProtocol>
    var intent: any StudentDetailIntentProtocol { container.intent }
    var state: any StudentDetailStateProtocol { container.model }

    var body: some View {
        ZStack {
            SMSIcon(.profile)
                .frame(maxWidth: .infinity)
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea(edges: .top)

            ScrollView(showsIndicators: false) {
                Color.clear
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1.0, contentMode: .fit)
                    .ignoresSafeArea(edges: .top)

                VStack(alignment: .leading, spacing: 0) {
                    SMSText("Design", font: .body1)
                        .foregroundColor(.sms(.sub(.s2)))
                        .padding(.top, 16)

                    SMSText("변찬우", font: .headline3)
                        .foregroundColor(.sms(.system(.black)))
                        .padding(.top, 4)

                    LazyHStack {
                        ForEach(1...10, id: \.self) { count in
                            SMSText("Figma \(count)", font: .caption2)
                                .padding(.vertical, 12)
                                .padding(.vertical, 6.5)
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.sms(.neutral(.n10)))
                                }
                        }
                    }
                    .padding(.top, 16)

                    SMSText("더 나은\n사용자사용자사용자사용자사용자사용자사용자사용자사용자사용자사용자", font: .body2)
                        .lineLimit(nil)
                }
                .padding(.horizontal, 20)
            }

            SMSIcon(.xmark)
                .padding(.top, safeAreaInsets.top + 8)
                .padding(.leading, 20)
                .buttonWrapper {
                    dismiss()
                }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarHidden(true)
    }
}
