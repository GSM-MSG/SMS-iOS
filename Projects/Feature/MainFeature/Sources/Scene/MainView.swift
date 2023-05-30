import SwiftUI
import BaseFeature
import ViewUtil
import DesignSystem

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    var intent: any MainIntentProtocol { container.intent }
    var state: any MainStateProtocol { container.model }

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                SMSIcon(.smsLogo, width: 80, height: 29)

                Spacer()

                SMSIcon(.filter)
                    .buttonWrapper { }

                SMSIcon(.profile)
                    .clipShape(Circle())
                    .buttonWrapper { }
            }
            .padding(.horizontal, 20)

            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<100, id: \.self) { index in
                        HStack(spacing: 12) {
                            SMSIcon(.profile, width: 101, height: 101)
                                .cornerRadius(8)

                            VStack(alignment: .leading, spacing: 4) {
                                Text("최형우")
                                    .smsFont(.title2)

                                Text("iOS dev")
                                    .smsFont(.body2)
                                    .padding(.bottom, 16)

                                LazyHStack {
                                    ForEach(0..<3, id: \.self) { index in
                                        Text(index.description)
                                            .smsFont(.body1, color: .neutral(.n40))
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 5.5)
                                            .background(Color.sms(.neutral(.n10)))
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .padding(16)

                        Divider()
                            .padding(.horizontal, 16)
                    }
                }
            }
            Spacer()
        }

    }
}
