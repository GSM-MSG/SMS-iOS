import BaseFeature
import DesignSystem
import SwiftUI
import ViewUtil

struct MyPageLanguageView: View {
    @StateObject var container: MVIContainer<MyPageLanguageInfoIntentProtocol, MyPageLanguageInfoStateProtocol>
    var intent: MyPageLanguageInfoIntentProtocol { container.intent }
    var state: MyPageLanguageInfoStateProtocol { container.model }
    let geometry: GeometryProxy

    init(
        container: MVIContainer<MyPageLanguageInfoIntentProtocol, MyPageLanguageInfoStateProtocol>,
        geometry: GeometryProxy
    ) {
        self._container = StateObject(wrappedValue: container)
        self.geometry = geometry
    }

    var body: some View {
        Section {
            languageListView(proxy: geometry)
        } header: {
            SectionHeaderView(title: "외국어")
        }
        .padding(.horizontal, 20)
    }

    @ViewBuilder
    func languageListView(proxy: GeometryProxy) -> some View {
        VStack(spacing: 8) {
            ForEach(state.languageList.indices, id: \.self) { index in
                HStack(spacing: 16) {
                    SMSTextField(
                        "예) 영어, 토익",
                        text: Binding(
                            get: { state.languageList[safe: index]?.name ?? "" },
                            set: { intent.updateLanguageName(name: $0, at: index) }
                        )
                    )
                    .frame(maxWidth: .infinity)

                    SMSTextField(
                        "원어민수준",
                        text: Binding(
                            get: { state.languageList[safe: index]?.score ?? "" },
                            set: { intent.updateLanguageScore(score: $0, at: index) }
                        )
                    )
                    .frame(maxWidth: proxy.size.width / 4)

                    Button {
                        intent.deleteLanguage(at: index)
                    } label: {
                        SMSIcon(.trash)
                    }
                }
            }
            .titleWrapper("외국어")
            .aligned(.leading)

            SMSChip("추가") {
                intent.languageAppendButtonDidTap()
            }
            .aligned(.leading)
        }
        .animation(.default, value: state.languageList.count)
    }
}
