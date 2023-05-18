import BaseFeature
import DesignSystem
import SwiftUI
import ViewUtil

struct InputLanguageInfoView: View {
    @StateObject var container: MVIContainer<InputLanguageInfoIntentProtocol, InputLanguageInfoStateProtocol>
    var intent: any InputLanguageInfoIntentProtocol { container.intent }
    var state: any InputLanguageInfoStateProtocol { container.model }

    var body: some View {
        GeometryReader { proxy in
            SMSNavigationTitleView(title: "정보입력") {
                Rectangle()
                    .fill(Color.sms(.neutral(.n10)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 16)

                VStack(spacing: 32) {
                    pageTitleView()

                    VStack(spacing: 8) {
                        languageListView(proxy: proxy)
                            .titleWrapper("외국어")
                            .aligned(.leading)

                        SMSChip("추가")
                            .aligned(.leading)
                    }
                }
            }
        }
    }

    @ViewBuilder
    func pageTitleView() -> some View {
        HStack(spacing: 4) {
            Text("외국어")
                .foregroundColor(.sms(.system(.black)))
            
            Text("*")
                .foregroundColor(.sms(.sub(.s2)))
            
            Spacer()
            
            SMSPageControl(pageCount: 6, selectedPage: 4)
        }
        .smsFont(.title1)
    }

    @ViewBuilder
    func languageListView(proxy: GeometryProxy) -> some View {
        VStack(spacing: 12) {
            ForEach(1..<5, id: \.self) { index in
                HStack(spacing: 16) {
                    SMSTextField("예) 토익", text: .constant(""))
                        .frame(maxWidth: .infinity)

                    SMSTextField("900", text: .constant(""))
                        .frame(maxWidth: proxy.size.width / 3)

                    Image(systemName: "trash")
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
}
