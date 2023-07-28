import SwiftUI
import BaseFeature
import DesignSystem
import InputInformationBaseFeature
import ViewUtil

struct InputPrizeInfoView: View {
    @StateObject var container: MVIContainer<InputPrizeInfoIntentProtocol, InputPrizeInfoStateProtocol>
    var intent: any InputPrizeInfoIntentProtocol { container.intent }
    var state: any InputPrizeInfoStateProtocol { container.model }

    var body: some View {
        SMSNavigationTitleView(title: "수상") {
            GeometryReader { geometry in
                ScrollView(showsIndicators: true) {
                    VStack(spacing: 32) {
                        SMSSeparator()
                        InputInformationPageTitleView(title: "프로젝트", isRequired: false, pageCount: 8, selectedPage: 7)

                        VStack(spacing: 24) {
//                            ForEach(state.projectList.indices, id: \.self) { index in
//                                projectListRowView(index: index, geometry: geometry)
//
//                                SMSSeparator(height: 1)
//                            }
                        }

                        SMSChip("추가") {
                            withAnimation {
//                                intent.projectAppendButtonDidTap()
                            }
                        }
                        .foregroundColor(.sms(.system(.black)))
                        .aligned(.trailing)

                    }
                }
            }
        }
    }

    @ViewBuilder
    func projectListRowView(index: Int, geometry: GeometryProxy) -> some View {
        
    }
}
